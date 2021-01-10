<?php
/**
 * Created by PhpStorm.
 * User: nahian
 * Date: 11/23/17
 * Time: 1:20 PM
 * @property Mod_file_upload $Mod_file_upload
 * @property Mod_common      $Mod_common
 * @property Mod_email       $Mod_email
 * @property Mod_package     $Mod_package
 */

class Mod_user extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model( 'Mod_file_upload' );
    }

    public function update_user_profile( $id )
    {
        $response = ['status' => FALSE, 'msg' => NULL];

        if ( $this->input->post() ) {
            $data = [
                'name'            => $this->input->post( 'name', TRUE ),
                'bmdc_no'         => $this->input->post( 'bmdc_no', TRUE ),
                'phone'           => $this->input->post( 'phone', TRUE ),
                'dob'             => date( 'Y-m-d', strtotime( $this->input->post( 'dob', TRUE ) ) ),
                'blood_group'     => $this->input->post( 'blood_group' ),
                'gender'          => $this->input->post( 'gender' ),
                'father_name'     => $this->input->post( 'father_name', TRUE ),
                'mother_name'     => $this->input->post( 'mother_name', TRUE ),
                'nid'             => $this->input->post( 'nid', TRUE ),
                'passport_no'     => $this->input->post( 'passport_no', TRUE ),
                'medical_college' => $this->input->post( 'medical_college' ),
                'job_desc'        => $this->input->post( 'job_desc', TRUE ),
            ];

            // Profie Photo Upload
            if ( $_FILES['photo']['error'] == 0 && $_FILES['photo']['size'] > 0 ) {
                $photo = $this->Mod_file_upload->upload_file( 'users', 'photo', ['size' => '500', 'width' => '1000', 'height' => '1000'] );

                if ( $photo['status'] ) {
                    $data['photo'] = $photo['path'];
                } else {
                    $response['msg'] = $photo['msg'];
                }
            }

            $this->db->trans_start();

            // Update master table
            $this->db->where( 'id', $id )->update( 'oe_doc_master', $data );

            // Delete Previous saved address
            $this->db->where( 'doc_id', $id )->delete( 'oe_doc_address' );

            // Insert Address
            $present = $this->input->post( 'present', TRUE );
            $permanent = $this->input->post( 'permanent', TRUE );
            $arr = [
                'doc_id' => $id,
                'status' => 1
            ];
            $address = [
                $arr + $present + ['type' => 1],
                $arr + $permanent + ['type' => 2]
            ];
            $this->db->insert_batch( 'oe_doc_address', $address );

            // Delete Old Education
            $this->db->where( 'doc_id', $id )->delete( 'oe_doc_educations' );
            //Insert Education
            $exam = $this->input->post( 'exam', TRUE );
            $exam_data = [];

            foreach ( $exam as $item ) {
                $item['doc_id'] = $id;
                $item['status'] = 1;
//                $exam_data[] = $item;
                $this->db->insert( 'oe_doc_educations', $item );
            }

            // Delete Old Reference
            $this->db->where( 'doc_id', $id )->delete( 'oe_doc_referance' );

            // Insert New reference
            $refs = $this->input->post( 'ref', TRUE );
            foreach ( $refs as $ref ) {
                $ref['doc_id'] = $id;
                $ref['status'] = 1;
                $this->db->insert( 'oe_doc_referance', $ref );
            }

            if ( $this->db->trans_status() === TRUE ) {
                $this->db->trans_commit();
                $response['status'] = TRUE;
                $response['msg'] = "Profile Information Updated.";
//                $flash = ['msg_type' => 'success', 'msg' => $response['msg']];
//                $this->session->set_flashdata($flash);
            } else {
                $this->db->trans_rollback();
                $response['msg'] = "Sorry! Profile Information Cannot Update. Please Try again.";
            }
        }
        return $response;
    }

    public function change_password( $id )
    {
        $response = ['status' => FALSE, 'msg' => NULL];
        if ( $pass = $this->input->post( 'password', TRUE ) ) {
            $data = [
                'password' => makeMyPassword( $pass )
            ];

            $flag = $this->db->where( 'id', $id )->update( 'oe_doc_master', $data );

            if ( $flag ) {
                $response['status'] = TRUE;
                $response['msg'] = "Password Changed";
            } else {
                $response['msg'] = "Sorry! Your Password cannot be changed right now. Please Try again.";
            }
        }
        return $response;
    }

    public function save_exam_data( $id )
    {
        $response = ['status' => FALSE, 'msg' => NULL];
        if ( $this->input->post() ) {

            $exams = $this->input->post( 'exam', TRUE );
            $institute_id = $this->input->post( 'institute_id', TRUE );
            $course_id = $this->input->post( 'course_id', TRUE );
            $faculty_id = $this->input->post( 'faculty_id', TRUE );
            $subject_id = $this->input->post( 'subject_id', TRUE );
            $coupon_code = $this->input->post( 'coupon_code', TRUE );
            // starting the transaction
            $this->db->trans_start();
            try {
                $types = $this->Mod_common->get_exam_types( array_column( $exams, 'id' ) );

                $valid = TRUE;
                $coupon = NULL;
                if ( $coupon_code ) {
                    $valid = FALSE;
                    $this->load->model( 'Mod_coupon' );
                    $coupon = $this->Mod_coupon->get_valid_coupon_details( $coupon_code );

                    if ( $coupon ) {
                        if ( $coupon->times_allowed > $coupon->times_used ) {
                            $valid = TRUE;
                            // Update Coupon Code Use Count
                            $this->Mod_coupon->update_coupon_use_count( $coupon );
                        } else {
                            $response['msg'] = "Coupon is not valid";
                        }

                    } else {
                        $response['msg'] = "Coupon is not valid";
                    }

                }

                if ( $valid ) {

                    $exam_array = [];
                    $purchase_array = [
                        'doc_id'         => $id,
                        'exam_count'     => 0,
                        'cost_bdt'       => 0,
                        'cost_usd'       => 0,
                        'discount'       => $coupon ? $coupon->discount : 0,
                        'final_cost_bdt' => 0,
                        'final_cost_usd' => 0,
                        'payment_status' => 0,
                        'status'         => 1
                    ];
                    $eids = [];
                    $sl = 0;
                    foreach ( $exams as $k => $exam ) {
                        $available_exams = $this->Mod_common->get_available_exams( $institute_id, $course_id, $faculty_id, $subject_id, $exam['id'] );
                        if ( $available_exams && $exam['count'] <= count( $available_exams ) ) {
                            $purchase_array['exam_count'] += $exam['count'];
                            $purchase_array['cost_bdt'] += ($exam['count'] * $types[$sl]->cost_bdt);
                            $purchase_array['cost_usd'] += ($exam['count'] * $types[$sl]->cost_usd);
                            for ( $i = 1; $i <= $exam['count']; $i++ ) {
                                array_push( $eids, $available_exams[$i - 1]->id );
                                $exam_array[] = [
                                    'doc_id'       => $id,
                                    'institute_id' => $institute_id,
                                    'course_id'    => $course_id,
                                    'faculty_id'   => $faculty_id,
                                    'subject_id'   => $subject_id,
                                    'exam_type_id' => $exam['id'],
                                    'exam_id'      => $available_exams[$i - 1]->id,
                                    'duration'     => intval( $available_exams[$i - 1]->time ),
                                    'cost_bdt'     => $types[$sl]->cost_bdt,
                                    'cost_usd'     => $types[$sl]->cost_usd,
                                    'discount'     => 0,
                                    'cost_final'   => $types[$sl]->cost_bdt,
                                    'status'       => 9
                                ];
                            }
                        }
                        $sl++;
                    }
                    $purchase_array['exam_ids'] = json_encode( $eids );

                    // Final cost Calculation
                    $dis_bdt = $purchase_array['discount'] ? ($purchase_array['cost_bdt'] * $purchase_array['discount']) / 100 : 0;
                    $dis_usd = $purchase_array['discount'] ? ($purchase_array['cost_usd'] * $purchase_array['discount']) / 100 : 0;
                    $purchase_array['final_cost_bdt'] = $purchase_array['cost_bdt'] - $dis_bdt;
                    $purchase_array['final_cost_usd'] = $purchase_array['cost_usd'] - $dis_usd;

                    $this->db->insert( 'oe_doc_purchases', $purchase_array );
                    $ins_id = $this->db->insert_id();
                    $response['id'] = $ins_id;
                    $data = [];
                    foreach ( $exam_array as $item ) {
                        $item['purchase_id'] = $ins_id;
                        $data[] = $item;
                    }
                    $this->db->insert_batch( 'doc_exams', $data );

                    if ( $this->db->trans_status() == TRUE ) {
                        $this->db->trans_complete();
                        $this->db->trans_commit();
                        $response['status'] = TRUE;
                        $response['reset'] = TRUE;
                        $response['msg'] = "Exam Purchase Complete.";
                        $msg = ['msg_type' => 'success', 'msg' => $response['msg']];
                        $this->session->set_flashdata( $msg );
                    } else {
                        $this->db->trans_rollback();
                        $response['msg'] = "Sorry! Something Went Wrong! Please Try Again.";
                    }
                }
            } catch ( Exception $exception ) {
                $this->db->trans_rollback();
                $response['msg'] = "Sorry! Something Went Wrong! Please Try Again.";
            }
        }
        return $response;
    }

    public function save_package_data( $id )
    {
        $response = ['status' => FALSE, 'msg' => NULL];
        if ( $this->input->post() ) {

            $package_ids = $this->input->post( 'package', TRUE );
            $institute_id = $this->input->post( 'institute_id', TRUE );
            $course_id = $this->input->post( 'course_id', TRUE );
            $faculty_id = $this->input->post( 'faculty_id', TRUE );
            $subject_id = $this->input->post( 'subject_id', TRUE );
            $coupon_code = $this->input->post( 'coupon_code', TRUE );

            $this->load->model( 'Mod_package' );

            $this->db->trans_start();
            try {
                $packages = $this->Mod_package->get_packages_by_ids( $package_ids );
                $valid = TRUE;
                $coupon = NULL;
                if ( $coupon_code ) {
                    $valid = FALSE;
                    $this->load->model( 'Mod_coupon' );
                    $coupon = $this->Mod_coupon->get_valid_coupon_details( $coupon_code );

                    if ( $coupon ) {
                        if ( $coupon->times_allowed > $coupon->times_used ) {
                            $valid = TRUE;
                            // Update Coupon Code Use Count
                            $this->Mod_coupon->update_coupon_use_count( $coupon );
                        } else {
                            $response['msg'] = "Coupon is not valid";
                        }

                    } else {
                        $response['msg'] = "Coupon is not valid";
                    }

                }

                if ( $valid ) {
                    $exam_array = [];
                    $purchase_array = [
                        'doc_id'         => $id,
                        'currency'       => "BDT",
                        'exam_count'     => 0,
                        'cost_bdt'       => 0,
                        'cost_usd'       => 0,
                        'discount'       => $coupon ? $coupon->discount : 0,
                        'final_cost_bdt' => 0,
                        'final_cost_usd' => 0,
                        'payment_status' => 0,
                        'status'         => 1
                    ];
                    $eids = [];
                    $sl = 0;
                    foreach ( $packages as $k => $package ) {
//                    $available_exams = $this->Mod_common->get_available_exams( $institute_id, $course_id, $faculty_id, $subject_id, $exam['id'] );
//                    if ( $available_exams && $exam['count'] <= count( $available_exams ) ) {
                        $exam_count = count( $package->exam_ids );
                        $purchase_array['exam_count'] += $exam_count;
                        $purchase_array['cost_bdt'] += $package->amount_bdt;
                        $purchase_array['cost_usd'] += $package->amount_usd;

                        foreach ( $package->exam_ids as $exam_id ) {
                            $exam_type = explode( '.', $exam_id );
                            $exam = $this->Mod_common->get_row_data_by_id( 'exams', $exam_type[1] );
                            $exam_array[] = [
                                'doc_id'       => $id,
                                'package_id'   => $package->id,
                                'institute_id' => $institute_id,
                                'course_id'    => $course_id,
                                'faculty_id'   => $faculty_id,
                                'subject_id'   => $subject_id,
                                'exam_type_id' => $exam->exam_id,
                                'exam_id'      => $exam->id,
                                'duration'     => intval( $exam->time ),
                                'cost_bdt'     => $package->amount_bdt / $exam_count,
                                'cost_usd'     => $package->amount_usd / $exam_count,
                                'discount'     => 0,
                                'cost_final'   => $package->amount_bdt / $exam_count,
                                'status'       => 9
                            ];

                            array_push( $eids, $exam->id );
                        }
                    }
                    $purchase_array['exam_ids'] = json_encode( $eids );
                    $purchase_array['package_ids'] = json_encode( array_values( $package_ids ) );

                    // Final cost Calculation
                    $dis_bdt = $purchase_array['discount'] ? ($purchase_array['cost_bdt'] * $purchase_array['discount']) / 100 : 0;
                    $dis_usd = $purchase_array['discount'] ? ($purchase_array['cost_usd'] * $purchase_array['discount']) / 100 : 0;
                    $purchase_array['final_cost_bdt'] = $purchase_array['cost_bdt'] - $dis_bdt;
                    $purchase_array['final_cost_usd'] = $purchase_array['cost_usd'] - $dis_usd;

                    $this->db->insert( 'oe_doc_purchases', $purchase_array );
                    $ins_id = $this->db->insert_id();
                    $response['id'] = $ins_id;
                    $data = [];
                    foreach ( $exam_array as $item ) {
                        $item['purchase_id'] = $ins_id;
                        $data[] = $item;
                    }
                    $this->db->insert_batch( 'doc_exams', $data );

                    if ( $this->db->trans_status() == TRUE ) {
                        $this->db->trans_complete();
                        $this->db->trans_commit();
                        $response['status'] = TRUE;
                        $response['reset'] = TRUE;
                        $response['msg'] = "Package Purchase Complete.";
                        $msg = ['msg_type' => 'success', 'msg' => $response['msg']];
                        $this->session->set_flashdata( $msg );
                    } else {
                        $this->db->trans_rollback();
                        $response['msg'] = "Sorry! Something Went Wrong! Please Try Again.";
                    }
                }
            } catch ( Exception $exception ) {
                $this->db->trans_rollback();
                $response['msg'] = "Sorry! Something Went Wrong! Please Try Again.";
            }
        }
        return $response;
    }

    public function get_user_exams_with_purchase( $id = NULL )
    {
        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->where( 'doc_id', $id )
                          ->order_by( 'created_at', 'DESC' )
//                          ->order_by('payment_status', 'ASC')
                          ->get( 'oe_doc_purchases' );

        if ( $query->num_rows() > 0 ) {
            $purchases = $query->result();

            foreach ( $purchases as $purchase ) {
                $purchase->exams = $this->get_user_exams( $id, $purchase->id );
            }

            return $purchases;
        }

        return FALSE;
    }

    public function get_user_notices( $id = NULL )
    {
        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->select( 'N.id id, N.doc_id, N.type, , N.title, N.details, N.attachment, N.created_at, DN.status ' )
                          ->where( 'DN.doc_id', $id )
                          ->where( 'N.status', 1 )
                          ->order_by( 'N.type' )
                          ->order_by( 'N.created_at', 'DESC' )
                          ->join( 'oe_notice N', 'N.id = DN.notice_id' )
                          ->get( 'oe_doc_notice DN' );

        if ( $query->num_rows() > 0 ) {
            return $query->result();
        }

        return FALSE;
    }

    public function get_user_notice( $id = NULL, $nid )
    {
        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->select( 'N.id id, N.doc_id, N.type, , N.title, N.details, N.attachment, N.created_at, DN.status ' )
                          ->where( 'DN.doc_id', $id )
                          ->where( 'N.id', $nid )
                          ->where( 'N.status', 1 )
                          ->order_by( 'N.type' )
                          ->order_by( 'N.created_at', 'DESC' )
                          ->join( 'oe_notice N', 'N.id = DN.notice_id' )
                          ->get( 'oe_doc_notice DN' );

        if ( $query->num_rows() > 0 ) {
            return $query->row();
        }

        return FALSE;
    }

    public function change_user_notice_status( $id, $nid )
    {
        return $this->db->update( 'oe_doc_notice', ['status' => 1], ['doc_id' => $id, 'notice_id' => $nid] );
    }

    public function get_user_exam_with_purchase( $id = NULL, $pid )
    {
        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->where( 'doc_id', $id )
                          ->where( 'id', $pid )
                          ->order_by( 'created_at', 'DESC' )
//                          ->order_by('payment_status', 'ASC')
                          ->get( 'oe_doc_purchases' );

        if ( $query->num_rows() == 1 ) {
            $purchase = $query->row();

            $purchase->exams = $this->get_user_exams( $id, $purchase->id );

            return $purchase;
        }

        return FALSE;
    }

    public function get_user_exams( $id = NULL, $purchase_id )
    {

        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->where( 'status !=', 0 )
                          ->where( 'doc_id', $id )
                          ->where( 'purchase_id', $purchase_id )
                          ->order_by( 'package_id, exam_type_id' )
                          ->get( 'doc_exams' );

        if ( $query->num_rows() > 0 ) {
            return $query->result();
        }

        return FALSE;
    }

    public function get_user_exam_history( $id = NULL )
    {

        if ( !$id ) {
            $id = $this->session->userdata( 'user' )->id;
        }

        $query = $this->db->where( 'status', 1 )
                          ->where( 'doc_id', $id )
                          ->where( 'is_free', 0 )
                          ->order_by( 'exam_type_id' )
                          ->get( 'doc_exams' );

        if ( $query->num_rows() > 0 ) {
            return $query->result();
        }

        return FALSE;
    }

    public function get_user_exam_data( $exam_id, $id = NULL )
    {
        if ( !$id ) {
            $id = $this->session->user->id;
        }

        $query = $this->db->where( 'status', 9 )
                          ->where( 'doc_id', $id )
                          ->where( 'id', $exam_id )
//                          ->where( 'open_date >=', date('Y-m-d H:i:s'))
//                          ->where( 'close_date <=', date('Y-m-d H:i:s'))
//                          ->order_by( 'exam_type_id' )
                          ->get( 'doc_exams' );

        if ( $query->num_rows() == 1 ) {
            $doc_exam = $query->row();
            $doc_exam->exam_data = $this->Mod_common->get_row_data_by_id( 'exams', $doc_exam->exam_id );
            return $doc_exam;
        }

        return FALSE;

    }

    public function get_user_free_exam_data( $exam_id )
    {

        $id = $this->session->user->id;

        $query = $this->db->where( 'status', 1 )
                          ->where( 'free_exam', 1 )
                          ->where( 'id', $exam_id )
                          ->get( 'exams' );

        if ( $query->num_rows() > 0 ) {
            $exam = $query->row();

            $exam_array = [
                'doc_id'       => $id,
                'institute_id' => $exam->institute_id,
                'course_id'    => $exam->course_id,
                'faculty_id'   => $exam->faculty_id,
                'subject_id'   => $exam->subject_id,
                'exam_type_id' => $exam->exam_id,
                'exam_id'      => $exam->id,
                'duration'     => intval( $exam->time ),
                'cost_bdt'     => 0,
                'cost_usd'     => 0,
                'discount'     => 0,
                'cost_final'   => 0,
                'is_free'      => 1,
                'status'       => 9
            ];

            $this->db->insert( 'doc_exams', $exam_array );

            if ( $this->db->affected_rows() == 1 ) {
                return $this->db->insert_id();
            }
        }

        return FALSE;

    }

    public function get_user_exam_result( $exam_id, $where = [] )
    {

        $id = $this->user_id;

        $this->db->where( 'status', 1 );
        $this->db->where( 'doc_id', $id );
        $this->db->where( 'id', $exam_id );

        if ( count( $where ) ) $this->db->where( $where );

        $query = $this->db->get( 'doc_exams' );

        if ( $query->num_rows() == 1 ) {
            $doc_exam = $query->row();
            $doc_exam->exam_data = $this->Mod_common->get_row_data_by_id( 'exams', $doc_exam->exam_id );
            return $doc_exam;
        }

        return FALSE;

    }

    public function get_user_exam_question_with_answers()
    {
		$old_ids = $this->session->qs_id;
		$data['question'] 	= $qs = $this->getRandQs($old_ids);
		$data['answers']	= $this->getAnswers( $qs['id'] );
		return $data;
    
    }
    
    private function getRandQs($old_ids){
		$this->db->select('*');
		if($old_ids)
			$this->db->where_not_in('id', $old_ids);
		$this->db->order_by('id', 'RANDOM');
		$query = $this->db->get('qs_bank');
		if($query->num_rows()){
			return $query->row_array();
		}
		return null;
	}
	
	private function getAnswers($qs_id){
    	$this->db->select('*');
    	$this->db->where('qs_bank_id', $qs_id);
    	$q = $this->db->get('qs_bank_ans');
    	return $q->result_array();
    	
	}
	
	public function answer_procedure(){
    	$qs_id = $this->input->post('qs_id');
    	$ans_id = $this->input->post('ans_id');
		$procedure_type = trim($this->input->post('action_name'));
		
		if($procedure_type == 'skip'){
			$ans_id = "skip";
		}
    	$user_ans = ['qs_id' => $qs_id, 'ans_id' => $ans_id ];
    	
    	//get session data
    	$sess_qs_id = $this->session->qs_id;
    	$sess_answers = $this->session->answers;
    	$sess_qs_count = $this->session->qs_count;
    	$sess_qs_skipped = $this->session->qs_skipped;
    	//
		
    	array_push($sess_qs_id, $qs_id);
    	array_push($sess_answers, $user_ans);
		$sess_qs_count++;
		if($procedure_type == "skip")
			$sess_qs_skipped++;
		
		$this->session->set_userdata( 'qs_id', $sess_qs_id );
		$this->session->set_userdata( 'answers', $sess_answers );
		$this->session->set_userdata( 'qs_count', $sess_qs_count );
		$this->session->set_userdata( 'qs_skipped', $sess_qs_skipped );
	}
	
	public function process_quize_result(){
		$qs_ids = $this->session->qs_id;
		$answers = $this->session->answers;
		$qs_count = $this->session->qs_count;
		$data['skip'] = $qs_skipped = $this->session->qs_skipped;
		$correct_ans = 0;
		$wrong_ans = 0;
		foreach($answers as $answer ){
			if($answer['qs_id'] && $answer['ans_id'] != "skip"){
				$this->db->where([
					'id' => $answer['qs_id'],
					'correct_ans_id' => $answer['ans_id']
				]);
				$query = $this->db->get('qs_bank');
				if($query->num_rows() > 0 )
					$correct_ans++;
				else
					$wrong_ans++;
			}
		}
		$data['correct_ans'] = $correct_ans;
		$data['wrong_ans'] = $wrong_ans;
		return $data;
	}

    public function get_user_exam_questions_with_answers( $exam_id )
    {

        $id = $this->user_id;

        $query = $this->db->select( 'question_id id' )
                          ->where( 'exam_ref_id', $exam_id )
//                          ->order_by( 'id', 'random' )
                          ->get( 'exam_question' );

        if ( $query->num_rows() > 0 ) {
            $questions = $query->result();
            $data = [];

            foreach ( $questions as $i => $question ) {
                $data[$i]['question'] = $this->Mod_common->get_row_data_by_id( 'oe_qsn_bnk_master', $question->id );
                $data[$i]['answers'] = $this->Mod_common->get_question_anserws( $question->id );
            }

            return $data;
        }

        return FALSE;
    }

    public function get_question_answers( $qid )
    {
        $query = $this->db->where( 'id', $qid )
                          ->get( 'oe_qsn_bnk_master' );

        if ( $query->num_rows() > 0 ) {
            $question = $query->row();
            $data['question'] = $question;
            $data['answers'] = $this->Mod_common->get_question_anserws( $question->id );
            return $data;
        }

        return FALSE;
    }

    public function save_exam_answers( $exam_id, $action_name )
    {
        $response = ['success' => FALSE, 'redirect' => NULL, 'msg' => NULL];
        if ( $action_name == 'next' ) {
            $qid = $this->input->post( 'id', TRUE );
            $qtype = $this->input->post( 'type', TRUE );
            $ans = $this->input->post( 'ans', TRUE );
            $timer = $this->input->post( 'timer', TRUE );
            $question = $this->Mod_common->get_row_data_by_id( 'oe_qsn_bnk_master', $qid );
            $doc_exam = $this->Mod_common->get_row_data_by_id( 'doc_exams', $exam_id );
            $exam = $this->Mod_common->get_row_data_by_id( 'exams', $doc_exam->exam_id );
            $is_valid = $this->Mod_common->exam_time_validation( $doc_exam );

            // Exam Marks from config
            $this->load->config( 'exam' );
            $ec = $this->config->item( 'exam_config' );
            if ( $is_valid ) {
                $q_res = $this->session->userdata( 'answers' );
                if ( $qtype === '1' ) {
                    if ( $ans ) {
                        if ( $ans === $question->correct_ans ) {
                            $correct = $ans;
                            $correct_mark = $ec->sba_mark;
                        } else {
                            $wrong = $ans;
//                            $negative_mark = $exam->negative_mark;
                        }
                    } else {
                        $not_answered = TRUE;
                    }
                } elseif ( $qtype === '2' ) {
                    $correct_ans = $this->get_correct_ans( $question->id );
                    if ( is_array( $ans ) ) {
                        $mcq_mark = $ec->mcq_mark / 5;
                        $correct = array_intersect_assoc( $correct_ans, $ans );
                        $not_answered = array_diff_key( $correct_ans, $ans );
                        $wrong = array_diff_assoc( $correct_ans, $ans, $not_answered );
                        $correct_mark = count( $correct ) * $mcq_mark;
                        $negative_mark = count( $wrong ) * $ec->negetive_mark;
                    } else {
                        $not_answered = $correct_ans;
                    }

                }

                $q_res[$question->id] = [
                    'ans'           => $ans ? $ans : NULL,
                    'correct'       => isset( $correct ) ? $correct : NULL,
                    'not_answered'  => isset( $not_answered ) ? $not_answered : NULL,
                    'wrong'         => isset( $wrong ) ? $wrong : NULL,
                    'correct_mark'  => isset( $correct_mark ) ? $correct_mark : 0,
                    'negative_mark' => isset( $negative_mark ) ? $negative_mark : 0
                ];
                $this->session->set_userdata( 'answers', $q_res );

                $response['success'] = TRUE;

            } else {
                $response['msg'] = "Sorry! Exam Time is Over.";
            }
        } elseif ( $action_name == 'skip' ) {
            $response['success'] = TRUE;
        } else {
            $response['msg'] = "Sorry! Nothing Posted..";
        }
        return $response;
    }

    public function get_correct_ans( $qid )
    {
        $query = $this->db->select( 'index_seqn,correct_ans' )
                          ->where( 'master_ref_id', $qid )
                          ->order_by( 'index_seqn' )
                          ->get( 'oe_qsn_bnk_ans' );

        if ( $query->num_rows() > 0 ) {
            $results = $query->result_array();

            return array_column( $results, 'correct_ans', 'index_seqn' );
        }

        return FALSE;
    }

    public function process_exam_result( $exam_id )
    {
        $answers = $this->session->userdata( 'answers' );
        $ans = $wrong = $correct = $not_answered = [];
        $correct_mark = $negative_mark = 0;

        foreach ( $answers as $i => $answer ) {
            $answer['ans'] ? array_push( $ans, [$i => $answer['ans']] ) : NULL;
            $answer['correct'] ? array_push( $correct, [$i => $answer['correct']] ) : NULL;
            $answer['not_answered'] ? array_push( $not_answered, [$i => $answer['not_answered']] ) : NULL;
            $answer['wrong'] ? array_push( $wrong, [$i => $answer['wrong']] ) : NULL;
            $correct_mark += $answer['correct_mark'];
            $negative_mark += $answer['negative_mark'];
        }

        $data = [
            'answers'      => $ans ? json_encode( $ans ) : NULL,
            'correct'      => $correct ? json_encode( $correct ) : NULL,
            'wrong'        => $wrong ? json_encode( $wrong ) : NULL,
            'not_answered' => $not_answered ? json_encode( $not_answered ) : NULL,
            'correct_mark' => $correct_mark,
            'wrong_mark'   => $negative_mark,
            'final_mark'   => $correct_mark - $negative_mark,
            'attend_date'  => date( 'Y-m-d' ),
            'end_time'     => date( "H:i:s" ),
            'status'       => 1
        ];

        $this->db->where( 'id', $exam_id )->update( 'doc_exams', $data );

        if ( $this->db->affected_rows() > 0 ) {
            return TRUE;
        }
        return FALSE;
    }

    public function change_user_exam_status( $exam_id, $data )
    {
        if ( !is_array( $data ) ) {
            $data = ['status' => 0, 'start_time' => date( 'H:i:s' )];
        }
        $this->db->where( ['id' => $exam_id, 'status' => 9] )->update( 'doc_exams', $data );

        if ( $this->db->affected_rows() > 0 ) {
            return TRUE;
        }

        return FALSE;
    }
}
