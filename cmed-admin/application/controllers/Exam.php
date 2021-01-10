<?php
/**
 * Created by PhpStorm.
 * User: nahian
 * Date: 11/27/17
 * Time: 2:26 PM
 *
 * @property Mod_home    $Mod_home
 * @property Mod_common  $Mod_common
 * @property common_lib  $common_lib
 * @property Mod_setting $Mod_setting
 * @property Mod_user    $Mod_user
 * @property Mod_student $Mod_student
 */

class Exam extends CI_Controller
{
    public $data, $authEmail, $master_id, $user_id;

    public function __construct()
    {
        parent::__construct();

        // Redirect if not logged in
//        if ( !user_logged_in() ) redirect( "doctor_login" );

        $this->load->model( 'Mod_auth_student' );
//        $this->data['authUser'] = $this->Mod_auth_student->get_auth_student_info();
        //print_r($this->data['authUser']->user_name);exit;
//        $this->authEmail = $this->data['authUser']->email;
//        $this->master_id = $this->data['authUser']->id;

//        $this->load->model( 'model_user/Mod_home', 'Mod_home' );
        $this->load->model( 'Mod_user' );
//        $this->load->model( 'Mod_student' );
//        $this->load->model( 'Mod_setting' );
        $this->load->model( 'Mod_common' );
//        $this->data['company'] = $this->Mod_setting->get_general_info();
//        $this->load->library( 'pagination' );
        $this->load->helper( 'date' );
        $this->load->helper( 'utility' );
//        $this->data['msg'] = $this->Mod_setting->get_messages();
//        $this->data['user'] = $this->Mod_student->get_details_doctor_addmission( $this->authEmail, $this->master_id );
//        $this->user_id = $this->data['user']->id;
//        $this->data['page_title'] = "Exam";
    }

    public function free_exam( $exam_id )
    {
        if ( $exam_id ) {
            $exam = $this->Mod_user->get_user_free_exam_data( $exam_id );
            if ( $exam ) {
                redirect( "exam-prompt/$exam" );
            }
        }
        show_404();

    }

    public function exam_prompt( $exam_id )
    {
        if ( $exam_id ) {
            $exam = $this->Mod_user->get_user_exam_data( $exam_id, $this->user_id );
            if ( $exam ) {
                $this->data['exam'] = $exam;
                $this->data['rules'] = $this->Mod_common->get_exam_rules();
                $this->data['page_title'] = "Confirm Exam Start";
                $this->data['title'] = $this->data['page_title'];
                $this->load->view( 'online-exam/view_start_confirm', $this->data );
            } else {
                show_error( $this->lang->line( 'cmed_overtinking_msg' ), 403, $this->lang->line( 'cmed_overtinking_hdr' ) );
            }
        } else {
            show_404();
        }
    }

    public function exam_start($exam_id)
    {
        // Unset Previous Exam Data
		$this->session->set_userdata( 'qs_id', [] );
		$this->session->set_userdata( 'answers', [] );
		$this->session->set_userdata( 'qs_count', 0 );
		$this->session->set_userdata( 'qs_skipped', 0 );
		
		$this->data['exam'] = ['duration'=> 1];
		$this->data['page_title'] = "Quize Test!";
		$this->data['title'] = "Quize";
		$data = $this->Mod_user->get_user_exam_question_with_answers();
		$this->data['question_answer'] = $this->load->view( 'online-exam/view_question_answer', $data, TRUE );
		$this->load->view( 'online-exam/view_exam_question', $this->data );
    
    }
    
    public function answer_proceed(){
		$timer = $this->input->post( 'timer', TRUE );
		
		if($timer != '00:00')
			$this->Mod_user->answer_procedure();
		
		$qs_count = $this->session->qs_count;
		
		if ( $qs_count < 5 && $timer != '00:00' ) {
			$qus_ans = $this->Mod_user->get_user_exam_question_with_answers();
			$response['content'] = $this->load->view( 'online-exam/view_question_answer', $qus_ans, TRUE );
			$response['remaining'] = (5 - $qs_count );
		} else {
			$response['redirect'] = site_url( "exam/quize_result" );
		}
		$response['success'] = true;
		echo json_encode($response);
		
		
	}
	
	public function quize_result(){
		$this->data['result'] = $this->Mod_user->process_quize_result();
		$this->data['page_title'] = "Exam Result";
		$this->data['title'] = 'Exam Result';
		$this->session->unset_userdata( ['qs_id', 'answers', 'qs_count', 'qs_skipped'] );
		$this->load->view( 'online-exam/view_quize_result', $this->data );
	}

    public function exam_result( $exam_id )
    {
        if ( $exam_id ) {
            $exam = $this->Mod_user->get_user_exam_result( $exam_id );
            if ( $exam ) {
                $this->data['exam'] = $exam;
                $this->data['page_title'] = "Exam Result";
                $this->data['title'] = $this->data['page_title'];
                $this->load->view( 'online-exam/view_result', $this->data );
            } else {
                show_error( $this->lang->line( 'cmed_overtinking_msg' ), 403, $this->lang->line( 'cmed_overtinking_hdr' ) );
            }
        } else {
            show_404();
        }
    }

    public function exam_answer( $exam_id )
    {
        if ( $exam_id ) {
            $exam = $this->Mod_user->get_user_exam_result( $exam_id );
            if ( $exam ) {
                $this->data['exam'] = $exam;
                $this->data['page_title'] = "Exam Answer - " . $this->data['exam']->exam_data->name;
                $this->data['title'] = $this->data['page_title'];
                $this->data['data'] = $this->Mod_user->get_user_exam_questions_with_answers( $exam->exam_id );
                $this->load->view( 'online-exam/view_answer_details', $this->data );
            } else {
                show_error( $this->lang->line( 'cmed_overtinking_msg' ), 403, $this->lang->line( 'cmed_overtinking_hdr' ) );
            }
        } else {
            show_404();
        }
    }

    public function exam_answer_save( $exam_id )
    {
        $response = ['success' => FALSE, 'msg' => NULL, 'content' => NULL, 'remaining' => FALSE];
        if ( $this->input->post() && $this->input->is_ajax_request() ) {
            $this->load->model( 'Mod_user' );

            // Action name skip/next
            $action_name = $this->input->post( 'action_name' );
//            $status = ['success' => TRUE, 'redirect' => NULL, 'msg' => NULL];
            $status = $this->Mod_user->save_exam_answers( $exam_id, $action_name );
            if ( $status['success'] ) {
                $response['success'] = TRUE;

                // get next question
                $all_ques = $this->session->userdata( 'questions' );

                // Add Skip Question
                if ( $action_name == 'skip' ) {
                    $skipped_questions = $this->session->userdata( 'skipped_questions' );
                    array_push( $skipped_questions, isset( $all_ques[0] ) ? $all_ques[0] : $skipped_questions[0] );
                    $this->session->set_userdata( 'skipped_questions', array_values( $skipped_questions ) );
                }

                unset( $all_ques[0] );
                $this->session->set_userdata( 'questions', array_values( $all_ques ) );
                $questions = $this->session->userdata( 'questions' );

                // Show Skipped Questions
                if ( !$questions ) {
                    $skipped_questions = $this->session->userdata( 'skipped_questions' );
                    $questions = $skipped_questions;
                    unset( $skipped_questions[0] );
                    $this->session->set_userdata( 'skipped_questions', array_values( $skipped_questions ) );
                }

                $timer = $this->input->post( 'timer', TRUE );

                if ( count( $questions ) && $timer != '00:00' ) {
                    $qus_ans = $this->Mod_user->get_question_answers( $questions[0] );
                    $response['content'] = $this->load->view( 'online-exam/view_question_answer', $qus_ans, TRUE );
                    $response['answers'] = $this->session->userdata( 'answers' );
                    $response['remaining'] = count( $questions ) + count( $this->session->userdata( 'skipped_questions' ) );
                } else {
                    if ( $timer == "00:00" || (!$this->session->userdata( 'questions' ) && !$this->session->userdata( 'skipped_questions' )) ) {
                        $status = $this->Mod_user->process_exam_result( $exam_id );
                        $this->db->where( 'id', $exam_id )->update( 'doc_exams', ['status' => 1] );
                        $response['success'] = $status;
                    }
                    $this->session->unset_userdata( ['questions', 'skipped_questions', 'answers', 'ques_count'] );
                    $response['redirect'] = site_url( "exam/exam_result/$exam_id" );
                }

            }
            $response['msg'] = $status['msg'];
        }
        echo json_encode( $response );
    }
    
    
    
//    public function qs(){
//    	$query = $this->db->get('oe_qsn_bnk_master');
//    	$qs = $query->result();
//    	foreach ($qs as $q){
//    		$this->db->insert('qs_bank', ['qs_title' => $q->question_name]);
//			$qs_id = $this->db->insert_id();
//    		//
//    		$this->db->select('id, ans');
//    		$this->db->order_by('id', 'RANDOM');
//    		$this->db->limit(5);
//    		$qry = $this->db->get('oe_qsn_bnk_ans');
//    		$ans = $qry->result();
//    		$ans_ids = [];
//    		foreach($ans as $k=>$a){
//    			$this->db->insert('qs_bank_ans', ['qs_bank_id'=>$qs_id, 'answer' => $a->ans]);
//    			$ans_id = $this->db->insert_id();
//				$ans_ids[$k] = $ans_id;
//			}
//			shuffle($ans_ids);
//    		$correct_ans_id = $ans_ids[0];
//    		$this->db->set('correct_ans_id', $correct_ans_id);
//    		$this->db->where('id', $qs_id);
//    		$this->db->update('qs_bank');
//		}
//	}
 
}
