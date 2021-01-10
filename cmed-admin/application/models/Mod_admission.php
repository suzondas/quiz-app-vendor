<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_admission
 * @author jnahian
 * @property common_lib      $common_lib
 * @property Mod_file_upload $Mod_file_upload
 */
class Mod_admission extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function save_photo( $photo_name, $reg_no )
	{
		$photo = [ 'success' => FALSE, 'msg' => '', 'status' => FALSE ];
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '1000', 'height' => '1000', 'size' => '1000' );
			$photo_tempname  = $_FILES[$photo_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$photo_name]['size'] <= 100000 ) {
				$photo            = $this->Mod_file_upload->upload_file( 'documents/' . $reg_no, $photo_name, $condition_photo, 'photo_' . $reg_no );
				$photo['success'] = $photo['status'];
				
				if ( $photo['success'] ) {
					$this->Mod_file_upload->resizeImage( $photo['path'], 300, 300 );
				}
			} else {
				$photo['msg'] .= '<p>Image Size:100Kb Max, width & height(300 X 300 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		return $photo;
	}
	
	public function save_signature( $sig_name, $reg_no )
	{
		$signature = [ 'success' => FALSE, 'msg' => '', 'status' => FALSE ];
		if ( $_FILES[$sig_name]['size'] > 0 ) {
			$condition_photo    = array( 'width' => '300', 'height' => '80', 'size' => '500' );
			$signature_tempname = $_FILES[$sig_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $signature_tempname );
			
			if ( $_FILES[$sig_name]['size'] <= 50000 ) {
				$signature            = $this->Mod_file_upload->upload_file( 'documents/' . $reg_no, $sig_name, $condition_photo, 'sign_' . $reg_no );
				$signature['success'] = $signature['status'];
			} else {
				$signature['msg'] .= '<p>Signature Size:50Kb Max, width & height(300 X 80 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		return $signature;
	}
	
	public function save_document( $file_name, $reg_no )
	{
		$file = [ 'success' => FALSE, 'msg' => '', 'status' => FALSE ];
		if ( $_FILES[$file_name]['size'] > 0 ) {
			$conditions      = array( 'size' => '10240' );
			$name            = explode( '_', $file_name );
			$f_name          = $name[1] . "_" . $reg_no;
			$file            = $this->Mod_file_upload->upload_file( 'documents/' . $reg_no, $file_name, $conditions, $f_name, 'jpg|jpeg|png|pdf|doc|docx' );
			$file['success'] = $file['status'];
		}
		return $file;
	}
	
	function save_file_data()
	{
		$return  = array( 'success' => FALSE, 'msg' => '' );
		$year    = $this->input->post( 'year', TRUE );
		$session = $this->input->post( 'session', TRUE );
		
		$password = strtoupper( random_string( 'nozero', 6 ) );
		
		$reg_no         = $this->get_doc_reg_no( $year, $session );
		$bmdc_no        = $this->input->post( 'bmdc_no', TRUE );
		$duplicate_flag = $this->check_duplicate_doc_reg( $bmdc_no );
		$data_master    = array(
			'registrtion_no' => $reg_no,
			'user_name'      => $this->input->post( 'email', TRUE ),
			'password'       => $password,
			'bmdc_no'        => $this->input->post( 'bmdc_no', TRUE ),
			'doc_name'       => $this->input->post( 'doc_name', TRUE ),
			'father_name'    => $this->input->post( 'father_name', TRUE ),
			'mother_name'    => $this->input->post( 'mother_name', TRUE ),
			'phone'          => $this->input->post( 'phone', TRUE ),
			'email'          => $this->input->post( 'email', TRUE ),
			'status'         => 9
		);
		
		$flag = $photo_flag = $sig_flag = FALSE;
		
		$photo = $this->save_photo( 'photo_image', $reg_no );
		$sig   = $this->save_signature( 'sig_name', $reg_no );
		
		if ( isset( $photo['path'] ) ) {
			$data_master['photo'] = $photo['path'];
		}
		//Documents Upload
		$mbbs = $this->save_document( 'doc_mbbs', $reg_no );
		$pg   = $this->save_document( 'doc_pg', $reg_no );
		// $phi = $this->save_document('doc_phi', $reg_no);
		$nid = $this->save_document( 'doc_nid', $reg_no );
		
		$data = array(
			'reg_no'             => $reg_no,
			'reg_type'           => 'CMED',
			'user_name'          => $this->input->post( 'email', TRUE ),
			'password'           => $password,
			'year'               => $year,
			'session'            => $session,
			// 'subject'            => $this->input->post( 'subject', TRUE ),
			'bmdc_no'            => $this->input->post( 'bmdc_no', TRUE ),
			'doc_name'           => $this->input->post( 'doc_name', TRUE ),
			'father_name'        => $this->input->post( 'father_name', TRUE ),
			'mother_name'        => $this->input->post( 'mother_name', TRUE ),
			'phone'              => $this->input->post( 'phone', TRUE ),
			'email'              => $this->input->post( 'email', TRUE ),
			'n_id'               => $this->input->post( 'n_id', TRUE ),
			'passport'           => $this->input->post( 'passport', TRUE ),
			'dob'                => $this->input->post( 'dob', TRUE ),
			'blood_gro'          => $this->input->post( 'blood_gro', TRUE ),
			'gender'             => $this->input->post( 'gender', TRUE ),
			'marital_status'     => $this->input->post( 'marital_status', TRUE ),
			'religion'           => $this->input->post( 'religion', TRUE ),
			'nationality'        => $this->input->post( 'nationality', TRUE ),
			'fb_id'              => $this->input->post( 'fb_id', TRUE ),
			'skype'              => $this->input->post( 'skype', TRUE ),
			'viber'              => $this->input->post( 'viber', TRUE ),
			'pt_call'            => $this->input->post( 'pt_call', TRUE ),
			'pw_payment'         => $this->input->post( 'pw_payment', TRUE ),
			'pw_communitcation'  => $this->input->post( 'pw_communitcation', TRUE ),
			'present_work_place' => $this->input->post( 'present_work_place', TRUE ),
			'job_description'    => $this->input->post( 'job_description', TRUE ),
			'spouse_name'        => $this->input->post( 'spouse_name', TRUE ),
			'spouse_mobile'      => $this->input->post( 'spouse_mobile', TRUE ),
			'per_divi'           => $this->input->post( 'per_divi', TRUE ),
			'per_dist'           => $this->input->post( 'per_dist', TRUE ),
			'per_thana'          => $this->input->post( 'per_thana', TRUE ),
			'per_address'        => $this->input->post( 'per_address', TRUE ),
			'mai_divi'           => $this->input->post( 'mai_divi', TRUE ),
			'mai_dist'           => $this->input->post( 'mai_dist', TRUE ),
			'mai_thana'          => $this->input->post( 'mai_thana', TRUE ),
			'mai_address'        => $this->input->post( 'mai_address', TRUE ),
			'photo'              => isset( $photo['path'] ) ? $photo['path'] : '',
			'doc_mbbs'           => $mbbs['status'] ? $mbbs['path'] : '',
			'doc_pg'             => $pg['status'] ? $pg['path'] : '',
			// 'doc_phi' => $phi['status'] ? $phi['path'] : '',
			'doc_nid'            => $nid['status'] ? $nid['path'] : '',
			'status'             => 9,
			'course_code'        => 1,
		);
		
		if ( $sig['status'] ) {
			$data['sign'] = $sig['path'];
		}
		
		$this->db->trans_start();
		if ( $photo['status'] ) { //  && $sig['status'] && $mbbs['status'] && $pg['status'] && $nid['status']
			if ( $duplicate_flag == FALSE ) {
				$this->db->insert( 'sif_doc_master', $data_master );
				$master_table_id = $this->db->insert_id();
			} else {
				$master_table_id = $duplicate_flag;
			}
			$data['master_id'] = $master_table_id;
			$result            = $this->db->insert( 'sif_admission', $data );
			$insert_id         = $this->db->insert_id();
//            $this->db->insert( 'sif_admission_transition', $data );
			
			$exam_name   = $this->input->post( 'exam_name', TRUE );
			$pass_year   = $this->input->post( 'pass_year', TRUE );
			$exam_group  = $this->input->post( 'exam_group', TRUE );
			$exam_board  = $this->input->post( 'exam_board', TRUE );
			$exam_ins    = $this->input->post( 'exam_ins', TRUE );
			$exam_result = $this->input->post( 'exam_result', TRUE );
			if ( $exam_name && $insert_id ) {
				foreach ( $exam_name as $i => $exam ) {
					
					if ( $exam ) {
						
						$exam_data = array(
							'admiss_id'   => $insert_id,
							'exam_name'   => $exam,
							'pass_year'   => $pass_year[$i],
							'exam_group'  => !empty( $exam_group[$i] ) ? $exam_group[$i] : 0,
							'exam_board'  => !empty( $exam_board[$i] ) ? $exam_board[$i] : 0,
							'exam_ins'    => $exam_ins[$i],
							'exam_result' => $exam_result[$i]
						);
						$this->db->insert( 'sif_edu_qualification', $exam_data );
					}
				}
			}
			
			$name         = $this->input->post( 'training_name', TRUE );
			$duration     = $this->input->post( 'training_duration', TRUE );
			$organization = $this->input->post( 'training_organization', TRUE );
			if ( $name && $insert_id ) {
				foreach ( $name as $i => $val ) {
					if ( $val ) {
						$ref_data = array(
							'admi_id'               => $insert_id,
							'training_name'         => $val,
							'training_duration'     => $duration[$i],
							'training_organization' => $organization[$i],
							'created_at'            => database_formatted_date()
						);
						$this->db->insert( 'doc_training', $ref_data );
					}
				}
			}
			$exp_inst_name   = $this->input->post( 'exp_inst_name', TRUE );
			$exp_designation = $this->input->post( 'exp_designation', TRUE );
			$exp_los         = $this->input->post( 'exp_los', TRUE );
			if ( $exp_inst_name && $insert_id ) {
				foreach ( $exp_inst_name as $i => $val ) {
					if ( $val ) {
						$ref_data = array(
							'admi_id'         => $insert_id,
							'exp_inst_name'   => $val,
							'exp_designation' => $exp_designation[$i],
							'exp_los'         => $exp_los[$i],
							'created_at'      => database_formatted_date()
						);
						$this->db->insert( 'doc_experience', $ref_data );
					}
				}
			}
			
			
			if ( $this->db->trans_status() == TRUE ) {
				$this->db->trans_commit();
				
				$return['success'] = TRUE;
				$return['data']    = $data_master;
			} else {
				$this->db->trans_rollback();
			}
		} else {
			// $return['msg'] .= "MBBS Certificate => ".$mbbs['msg'] ."POST Graduate Certificate => ". $pg['msg'] ."NID => ". $nid['msg'] . "Photo => ".$photo['msg'] . "Signature => ". $sig['msg']; // . $phi['msg']
			$return['msg'] .= $mbbs['msg'] ? "<p>MBBS Certificate: {$mbbs['msg']}</p>" : NULL;
			$return['msg'] .= $pg['msg'] ? "<p>POST Graduate Certificate: {$pg['msg']}</p>" : NULL;
			$return['msg'] .= $nid['msg'] ? "<p>NID: {$nid['msg']}</p>" : NULL;
			$return['msg'] .= $photo['msg'] ? "<p>Photo: {$photo['msg']}</p>" : NULL;
			$return['msg'] .= $sig['msg'] ? "<p>Signature: {$sig['msg']}</p>" : NULL;
		}
		return $return;
	}
	
	
	function readmission_genesis()
	{
		$return         = array( 'success' => FALSE );
		$year           = $this->input->post( 'year', TRUE );
		$session        = $this->input->post( 'session', TRUE );
		$course         = $this->input->post( 'course_code', TRUE );
		$faculty        = $this->input->post( 'faculty_code', TRUE );
		$batch          = $this->input->post( 'batch_code', TRUE );
		$ser_pack_id    = $this->input->post( 'service_pack_id', TRUE );
		$password       = random_string( 'alnum', 8 );
		$reg_no         = $this->get_doc_reg_no( $year, $session, $course, $batch ); //$faculty
		$bmdc_no        = $this->input->post( 'bmdc_no', TRUE );
		$duplicate_flag = $this->check_duplicate_doc_reg( $bmdc_no );
		$profile_id     = $this->input->post( 'readmission' );
		$profile_info   = $this->get_doctor_profile_info( $profile_id );
		//print_r($photo['path']);exit;
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '300', 'size' => '100' );
			$photo_tempname  = $_FILES[$photo_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$photo_name]['size'] <= 100000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$photo = $this->Mod_file_upload->upload_file( 'photo', 'photo_image', $condition_photo, 'photo_' . $reg_no );
				
				if ( $photo['status'] ) {
					$photo_flag = TRUE;
				} else {
					$return['msg'] .= $photo_flag['msg'];
				}
			} else {
				$return['msg'] .= '<p>Image Size:100Kb Max, width & height(300 X 300 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		if ( isset( $photo['path'] ) ) {
			$data_master['photo'] = $photo['path'];
		}


//        if ($photo_flag && $duplicate_flag == FALSE) {
//            $this->db->insert('sif_doc_master', $data_master);
//            $master_table_id = $this->db->insert_id();
//        } else {
		$master_table_id = $duplicate_flag;
		//   }
		$admi_type = $this->input->post( 'admi_type' );
		
		$fee_amount = $this->get_ser_pack_amount( $ser_pack_id, $course, $admi_type );
		//echo $fee_amount;exit;
		$final_amount = $fee_amount - $this->input->post( 'discount_amont' );
		
		$college_id = $this->input->post( 'medical_col', TRUE );
		
		$data = array( 'master_id' => $master_table_id, 'reg_no' => $reg_no, 'reg_type' => 'genesis', 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'institute' => $this->input->post( 'institute', TRUE ), 'year' => $year, 'course_code' => $course, 'faculty_code' => $faculty, 'batch_code' => $batch, 'subject' => $this->input->post( 'subject', TRUE ), 'service_pack_id' => $ser_pack_id, 'admi_type' => $admi_type, 'session' => $session, 'medical_col' => $college_id, 'collage_type' => $this->get_collage_type( $college_id ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'blood_gro' => $this->input->post( 'blood_gro', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'n_id' => $this->input->post( 'n_id', TRUE ), 'passport' => $this->input->post( 'passport', TRUE ), 'job_des' => $this->input->post( 'job_des', TRUE ), 'f_id' => $this->input->post( 'f_id', TRUE ), 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'spouse_name' => $this->input->post( 'spouse_name', TRUE ), 'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ), 'answer_type' => $this->input->post( 'answer_type', TRUE ), 'per_divi' => $this->input->post( 'per_divi', TRUE ), 'per_dist' => $this->input->post( 'per_dist', TRUE ), 'per_thana' => $this->input->post( 'per_thana', TRUE ), 'per_address' => $this->input->post( 'per_address', TRUE ), 'mai_divi' => $this->input->post( 'mai_divi', TRUE ), 'mai_dist' => $this->input->post( 'mai_dist', TRUE ), 'mai_thana' => $this->input->post( 'mai_thana', TRUE ), 'mai_address' => $this->input->post( 'mai_address', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), 'fee_amount' => $fee_amount, 'photo' => isset( $photo['path'] ) ? $photo['path'] : $profile_info->photo, 'sign' => isset( $photo['path'] ) ? $photo['path'] : $profile_info->sign, 'final_amount' => $final_amount, 'discount_amont' => $this->input->post( 'discount_amont', TRUE ), 'dis_auth_by' => $this->input->post( 'dis_auth_by', TRUE ), 'status' => '1', );
		
		
		$sig_flag = FALSE;
		
		$sig_name = 'sig_name';
		if ( $_FILES[$sig_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '80', 'size' => '50' );
			$photo_tempname  = $_FILES[$sig_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$sig_name]['size'] <= 50000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$sig = $this->Mod_file_upload->upload_file( 'sign', 'sig_name', $condition_photo, 'sign_' . $reg_no );
				
				if ( $sig['status'] ) {
					$sig_flag = TRUE;
				} else {
					$return['msg'] .= $sig['msg'];
				}
			} else {
				$return['msg'] .= '<p>Signature Size:50Kb Max, width & height(300 X 80 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		if ( isset( $sig['path'] ) ) {
			$data['sign'] = $sig['path'];
		}


//        if ($photo_flag && $sig_flag) {
		$result    = $this->db->insert( 'sif_admission', $data );
		$insert_id = $this->db->insert_id();
//        $this->db->insert( 'sif_admission_transition', $data );
		
		$exam_name   = $this->input->post( 'exam_name', TRUE );
		$pass_year   = $this->input->post( 'pass_year', TRUE );
		$exam_group  = $this->input->post( 'exam_group', TRUE );
		$exam_board  = $this->input->post( 'exam_board', TRUE );
		$exam_ins    = $this->input->post( 'exam_ins', TRUE );
		$exam_result = $this->input->post( 'exam_result', TRUE );
		if ( $exam_name && $insert_id ) {
			foreach ( $exam_name as $i => $exam ) {
				
				if ( $exam && $exam_result[$i] ) {
					
					$exam_data = array( 'admiss_id' => $insert_id, 'exam_name' => $exam, 'pass_year' => $pass_year[$i], 'exam_group' => isset( $exam_group[$i] ) ? $exam_group[$i] : '', 'exam_board' => isset( $exam_board[$i] ) ? $exam_board[$i] : '', 'exam_ins' => $exam_ins[$i], 'exam_result' => $exam_result[$i] );
					$this->db->insert( 'sif_edu_qualification', $exam_data );
				}
			}
		}
		
		$name        = $this->input->post( 'name', TRUE );
		$designation = $this->input->post( 'designation', TRUE );
		$mobile      = $this->input->post( 'mobile', TRUE );
		$relation    = $this->input->post( 'relation', TRUE );
		if ( $name && $insert_id ) {
			foreach ( $name as $i => $val ) {
				if ( $val ) {
					$ref_data = array( 'admiss_id' => $insert_id, 'name' => $val, 'designation' => $designation[$i], 'mobile' => $mobile[$i], 'relation' => $relation[$i] );
					$this->db->insert( 'sif_reference', $ref_data );
				}
			}
		}
		
		
		if ( $result ) {
			$return['success'] = TRUE;
		}
		//}
		return $return;
	}
	
	
	function save_outlier_data()
	{
		$return         = array( 'success' => FALSE );
		$year           = $this->input->post( 'year', TRUE );
		$session        = $this->input->post( 'session', TRUE );
		$course         = $this->input->post( 'course_code', TRUE );
		$faculty        = $this->input->post( 'faculty_code', TRUE );
		$batch          = $this->input->post( 'batch_code', TRUE );
		$ser_pack_id    = $this->input->post( 'service_pack_id', TRUE );
		$password       = random_string( 'alnum', 8 );
		$reg_no         = $this->get_doc_reg_no( $year, $session, $course, $batch ); //$faculty
		$bmdc_no        = $this->input->post( 'bmdc_no', TRUE );
		$duplicate_flag = $this->check_duplicate_doc_reg( $bmdc_no );
		// echo $reg_no;
		//exit;
		$data_master = array( 'registrtion_no' => $reg_no, 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), );
		
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '300', 'size' => '100' );
			$photo_tempname  = $_FILES[$photo_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$photo_name]['size'] <= 100000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$photo = $this->Mod_file_upload->upload_file( 'photo', 'photo_image', $condition_photo, 'photo_' . $reg_no );
				
				if ( $photo['status'] ) {
					$photo_flag = TRUE;
				} else {
					$return['msg'] .= $photo_flag['msg'];
				}
			} else {
				$return['msg'] .= '<p>Image Size:100Kb Max, width & height(300 X 300 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		
		if ( isset( $photo['path'] ) ) {
			$data_master['photo'] = $photo['path'];
		}
		
		$admi_type = $this->input->post( 'admi_type' );
		
		$fee_amount = $this->get_ser_pack_amount( $ser_pack_id, $course, $admi_type );
		//echo $fee_amount;exit;
		$final_amount = $fee_amount - $this->input->post( 'discount_amont' );
		
		$collage_id    = $this->input->post( 'medical_col', TRUE );
		$data          = array( 'reg_no' => $reg_no, 'reg_type' => 'outlier', 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'institute' => $this->input->post( 'institute', TRUE ), 'year' => $year, 'course_code' => $course, 'faculty_code' => $faculty, 'batch_code' => $batch, 'subject' => $this->input->post( 'subject', TRUE ), 'service_pack_id' => $ser_pack_id, 'admi_type' => $this->input->post( 'admi_type' ), 'session' => $session, 'medical_col' => $collage_id, 'collage_type' => $this->get_collage_type( $collage_id ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'blood_gro' => $this->input->post( 'blood_gro', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'n_id' => $this->input->post( 'n_id', TRUE ), 'passport' => $this->input->post( 'passport', TRUE ), 'job_des' => $this->input->post( 'job_des', TRUE ), 'f_id' => $this->input->post( 'f_id', TRUE ), 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'spouse_name' => $this->input->post( 'spouse_name', TRUE ), 'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ), 'answer_type' => $this->input->post( 'answer_type', TRUE ), 'rcp_reg_no' => $this->input->post( 'rcp_reg_no', TRUE ), 'per_divi' => $this->input->post( 'per_divi', TRUE ), 'per_dist' => $this->input->post( 'per_dist', TRUE ), 'per_thana' => $this->input->post( 'per_thana', TRUE ), 'per_address' => $this->input->post( 'per_address', TRUE ), 'mai_divi' => $this->input->post( 'mai_divi', TRUE ), 'mai_dist' => $this->input->post( 'mai_dist', TRUE ), 'mai_thana' => $this->input->post( 'mai_thana', TRUE ), 'mai_address' => $this->input->post( 'mai_address', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), 'fee_amount' => $fee_amount, 'photo' => isset( $photo['path'] ) ? $photo['path'] : '', 'final_amount' => $final_amount, 'discount_amont' => $this->input->post( 'discount_amont', TRUE ), 'dis_auth_by' => $this->input->post( 'dis_auth_by', TRUE ), 'status' => '1', );
		$flag          = $sig_flag = FALSE;
		$return['msg'] = '';
		
		$sig_name = 'sig_name';
		if ( $_FILES[$sig_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '80', 'size' => '50' );
			$photo_tempname  = $_FILES[$sig_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$sig_name]['size'] <= 50000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$sig = $this->Mod_file_upload->upload_file( 'sign', 'sig_name', $condition_photo, 'sign_' . $reg_no );
				
				if ( $sig['status'] ) {
					$sig_flag = TRUE;
				} else {
					$return['msg'] .= $sig['msg'];
				}
			} else {
				$return['msg'] .= '<p>Signature Size:50Kb Max, width & height(300 X 80 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		
		
		if ( isset( $sig['path'] ) ) {
			$data['sign'] = $sig['path'];
		}
		
		if ( $photo_flag ) {
			
			if ( $duplicate_flag == FALSE ) {
				$this->db->insert( 'sif_doc_master', $data_master );
				$master_table_id = $this->db->insert_id();
			} else {
				$master_table_id = $duplicate_flag;
			}
			$data['master_id'] = $master_table_id;
			$result            = $this->db->insert( 'sif_admission', $data );
			$insert_id         = $this->db->insert_id();
			$this->db->insert( 'sif_admission_transition', $data );
			
			$exam_name   = $this->input->post( 'exam_name', TRUE );
			$pass_year   = $this->input->post( 'pass_year', TRUE );
			$exam_group  = $this->input->post( 'exam_group', TRUE );
			$exam_board  = $this->input->post( 'exam_board', TRUE );
			$exam_ins    = $this->input->post( 'exam_ins', TRUE );
			$exam_result = $this->input->post( 'exam_result', TRUE );
			if ( $exam_name && $insert_id ) {
				foreach ( $exam_name as $i => $exam ) {
					
					if ( $exam && $exam_result[$i] ) {
						
						$exam_data = array( 'admiss_id' => $insert_id, 'exam_name' => $exam, 'pass_year' => $pass_year[$i], 'exam_group' => isset( $exam_group[$i] ) ? $exam_group[$i] : '', 'exam_board' => isset( $exam_board[$i] ) ? $exam_board[$i] : '', 'exam_ins' => $exam_ins[$i], 'exam_result' => $exam_result[$i] );
						$this->db->insert( 'sif_edu_qualification', $exam_data );
					}
				}
			}
			
			$name        = $this->input->post( 'name', TRUE );
			$designation = $this->input->post( 'designation', TRUE );
			$mobile      = $this->input->post( 'mobile', TRUE );
			$relation    = $this->input->post( 'relation', TRUE );
			if ( !empty( $name ) && $insert_id ) {
				foreach ( $name as $i => $val ) {
					
					if ( !empty( $val ) ) {
						$ref_data = array( 'admiss_id' => $insert_id, 'name' => $val, 'designation' => $designation[$i], 'mobile' => $mobile[$i], 'relation' => $relation[$i] );
						$this->db->insert( 'sif_reference', $ref_data );
					}
				}
			}
			
			
			if ( $result ) {
				$return['success'] = TRUE;
			}
		}
		return $return;
	}
	
	function readmission_outlier()
	{
		$return         = array( 'success' => FALSE );
		$year           = $this->input->post( 'year', TRUE );
		$session        = $this->input->post( 'session', TRUE );
		$course         = $this->input->post( 'course_code', TRUE );
		$faculty        = $this->input->post( 'faculty_code', TRUE );
		$batch          = $this->input->post( 'batch_code', TRUE );
		$ser_pack_id    = $this->input->post( 'service_pack_id', TRUE );
		$password       = random_string( 'alnum', 8 );
		$reg_no         = $this->get_doc_reg_no( $year, $session, $course, $batch ); //$faculty
		$bmdc_no        = $this->input->post( 'bmdc_no', TRUE );
		$duplicate_flag = $this->check_duplicate_doc_reg( $bmdc_no );
		
		$profile_id = $this->input->post( 'readmission' );
		
		$profile_info = $this->get_doctor_profile_info( $profile_id );
		
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '300', 'size' => '100' );
			$photo_tempname  = $_FILES[$photo_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$photo_name]['size'] <= 100000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$photo = $this->Mod_file_upload->upload_file( 'photo', 'photo_image', $condition_photo, 'photo_' . $reg_no );
				
				if ( $photo['status'] ) {
					$photo_flag = TRUE;
				} else {
					$return['msg'] .= $photo_flag['msg'];
				}
			} else {
				$return['msg'] .= '<p>Image Size:100Kb Max, width & height(300 X 300 Pixel), only .jpg is allowed to upload</p>';
			}
		}
		
		$master_table_id = $duplicate_flag;
		$admi_type       = $this->input->post( 'admi_type' );
		
		$fee_amount = $this->get_ser_pack_amount( $ser_pack_id, $course, $admi_type );
		//echo $fee_amount;exit;
		$final_amount  = $fee_amount - $this->input->post( 'discount_amont' );
		$collage_id    = $this->input->post( 'medical_col', TRUE );
		$data          = array( 'master_id' => $master_table_id, 'reg_no' => $reg_no, 'reg_type' => 'outlier', 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'institute' => $this->input->post( 'institute', TRUE ), 'year' => $year, 'course_code' => $course, 'faculty_code' => $faculty, 'batch_code' => $batch, 'subject' => $this->input->post( 'subject', TRUE ), 'service_pack_id' => $ser_pack_id, 'admi_type' => $admi_type, 'session' => $session, 'medical_col' => $collage_id, 'collage_type' => $this->get_collage_type( $collage_id ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'blood_gro' => $this->input->post( 'blood_gro', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'n_id' => $this->input->post( 'n_id', TRUE ), 'passport' => $this->input->post( 'passport', TRUE ), 'job_des' => $this->input->post( 'job_des', TRUE ), 'f_id' => $this->input->post( 'f_id', TRUE ), 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'spouse_name' => $this->input->post( 'spouse_name', TRUE ), 'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ), 'answer_type' => $this->input->post( 'answer_type', TRUE ), 'rcp_reg_no' => $this->input->post( 'rcp_reg_no', TRUE ), 'per_divi' => $this->input->post( 'per_divi', TRUE ), 'per_dist' => $this->input->post( 'per_dist', TRUE ), 'per_thana' => $this->input->post( 'per_thana', TRUE ), 'per_address' => $this->input->post( 'per_address', TRUE ), 'mai_divi' => $this->input->post( 'mai_divi', TRUE ), 'mai_dist' => $this->input->post( 'mai_dist', TRUE ), 'mai_thana' => $this->input->post( 'mai_thana', TRUE ), 'mai_address' => $this->input->post( 'mai_address', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), 'fee_amount' => $fee_amount, 'photo' => isset( $photo['path'] ) ? $photo['path'] : $profile_info->photo, 'sign' => isset( $photo['path'] ) ? $photo['path'] : $profile_info->sign, 'final_amount' => $final_amount, 'discount_amont' => $this->input->post( 'discount_amont', TRUE ), 'dis_auth_by' => $this->input->post( 'dis_auth_by', TRUE ), 'status' => '1', );
		$flag          = $sig_flag = FALSE;
		$return['msg'] = '';
		
		$sig_name = 'sig_name';
		if ( $_FILES[$sig_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '80', 'size' => '50' );
			$photo_tempname  = $_FILES[$sig_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$sig_name]['size'] <= 50000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$sig = $this->Mod_file_upload->upload_file( 'sign', 'sig_name', $condition_photo, 'sign_' . $reg_no );
				
				if ( $sig['status'] ) {
					$sig_flag = TRUE;
				} else {
					$return['msg'] .= $sig['msg'];
				}
			} else {
				$return['msg'] .= '<p>Signature Size:50Kb Max, width & height(300 X 80 Pixel), only .jpg is allowed to upload</p>';
			}
		}


//        if (isset($sig['path'])) {
//            $data['sign'] = $sig['path'];
//        }
		
		
		$result    = $this->db->insert( 'sif_admission', $data );
		$insert_id = $this->db->insert_id();
		$this->db->insert( 'sif_admission_transition', $data );
		
		$exam_name   = $this->input->post( 'exam_name', TRUE );
		$pass_year   = $this->input->post( 'pass_year', TRUE );
		$exam_group  = $this->input->post( 'exam_group', TRUE );
		$exam_board  = $this->input->post( 'exam_board', TRUE );
		$exam_ins    = $this->input->post( 'exam_ins', TRUE );
		$exam_result = $this->input->post( 'exam_result', TRUE );
		if ( $exam_name ) {
			foreach ( $exam_name as $i => $exam ) {
				
				if ( $exam && $exam_result[$i] ) {
					
					$exam_data = array( 'admiss_id' => $insert_id, 'exam_name' => $exam, 'pass_year' => $pass_year[$i], 'exam_group' => isset( $exam_group[$i] ) ? $exam_group[$i] : '', 'exam_board' => isset( $exam_board[$i] ) ? $exam_board[$i] : '', 'exam_ins' => $exam_ins[$i], 'exam_result' => $exam_result[$i] );
					$this->db->insert( 'sif_edu_qualification', $exam_data );
				}
			}
		}
		
		$name        = $this->input->post( 'name', TRUE );
		$designation = $this->input->post( 'designation', TRUE );
		$mobile      = $this->input->post( 'mobile', TRUE );
		$relation    = $this->input->post( 'relation', TRUE );
		if ( !empty( $name ) ) {
			foreach ( $name as $i => $val ) {
				
				if ( !empty( $val ) ) {
					$ref_data = array( 'admiss_id' => $insert_id, 'name' => $val, 'designation' => $designation[$i], 'mobile' => $mobile[$i], 'relation' => $relation[$i] );
					$this->db->insert( 'sif_reference', $ref_data );
				}
			}
		}
		
		
		if ( $result ) {
			$return['success'] = TRUE;
		}
		
		return $return;
	}
	
	
	public
	function get_collage_type( $collage_id )
	{
		$this->db->select( 'collage_type' );
		$this->db->where( 'id', $collage_id );
		$query = $this->db->get( 'sif_medical_collage' );
		if ( $query->num_rows() > 0 ) {
			return $query->row()->collage_type;
		} else {
			return FALSE;
		}
	}
	
	function get_district_by_division_val( $division_id )
	{
		$this->db->select( 'DISTRICT_ID,DISTRICT_NAME' );
		$this->db->where( 'DIVISION_ID', $division_id );
		$query = $this->db->get( 'districts' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	function get_district_by_division_val2( $division_id )
	{
		$this->db->select( 'DISTRICT_ID,DISTRICT_NAME' );
		$this->db->where( 'DIVISION_ID', $division_id );
		$query = $this->db->get( 'districts' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	function get_thana_by_district_val( $district_id )
	{
		$this->db->select( 'THANA_ID,THANA_NAME' );
		$this->db->where( 'DISTRICT_ID', $district_id );
		$query = $this->db->get( 'thanas' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	function get_thana_by_district_val2( $district_id )
	{
		$this->db->select( 'THANA_ID,THANA_NAME' );
		$this->db->where( 'DISTRICT_ID', $district_id );
		$query = $this->db->get( 'thanas' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	function get_doctor_list()
	{
		$this->db->select( '*' );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	function get_doctor_profile_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'id', $profile_id );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_master_id( $profile_id )
	{
		$this->db->select( 'master_id' );
		$this->db->where( 'id', $profile_id );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() == 1 ) {
			return $query->row()->master_id;
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_master_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'id', $profile_id );
		$query = $this->db->get( 'sif_doc_master' );
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_education_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'admiss_id', $profile_id );
		$query = $this->db->get( 'sif_edu_qualification' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_training_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'admi_id', $profile_id );
		$query = $this->db->get( 'doc_training' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_experience_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'admi_id', $profile_id );
		$query = $this->db->get( 'doc_experience' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	function get_doctor_ref_info( $profile_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'admiss_id', $profile_id );
		$query = $this->db->get( 'sif_reference' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	public
	function get_doc_reg_no( $year, $session ) //$faculty
	{
		$reg_no = substr( $year, -2 );
//        $reg_no .= $faculty;
		$reg_no .= $session;
//        $reg_no .= $course;
//        $reg_no .= $batch;
		
		$reg = $this->get_last_batch_doc_req( $year, $session ); //$faculty
		//echo $reg;
		// exit;
		if ( $reg ) {
			$reg_no = intval( $reg ) + 1;
		} else {
			$reg_no .= '001';
		}
		
		return $reg_no;
	}
	
	public
	function get_last_batch_doc_req( $year, $session )
	{
		$this->db->select( 'reg_no' );
		$this->db->where( array(
				'year'    => $year,
				'session' => $session
			)
		);
		
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->last_row()->reg_no;
		}
		return FALSE;
	}
	
	function count_admmission_list( $tid = NULL )
	{
		$sql_where = [];
		
		$year           = $this->input->get( 'year', TRUE );
		$session        = $this->input->get( 'session', TRUE );
		$reg_no         = $this->input->get( 'reg_no', TRUE );
		$from_date_time = $this->input->get( 'from_date_time', TRUE );
		$to_date_time   = $this->input->get( 'to_date_time', TRUE );
		$name           = $this->input->get( 'name', TRUE );
		
		if ( !empty( $year ) ) {
			$sql_where['A.year'] = $year;
		}
		if ( !empty( $session ) ) {
			$sql_where['A.session'] = $session;
		}
		if ( !empty( $reg_no ) ) {
			$sql_where['A.reg_no'] = $reg_no;
		}
		
		// date range search
		if ( $from_date_time ) {
			$final_date_from              = date( 'Y-m-d H:i:s', strtotime( $from_date_time . " 00:00:00" ) );
			$sql_where['A.created_at >='] = $final_date_from;
		}
		if ( $to_date_time ) {
			$final_date_to                = date( 'Y-m-d H:i:s', strtotime( $to_date_time . " 23:59:59" ) );
			$sql_where['A.created_at <='] = $final_date_to;
		}
		
		$status = $this->input->get( 'status', TRUE );
		if ( $status ) {
			$sql_where['A.status'] = $status;
		}
		
		$this->db->select( 'A.id' );
		
		if ( $sql_where ) {
			$this->db->where( $sql_where );
		}
		
		if ( !empty( $tid ) ) {
			$this->db->where( 'TD.teacher_id', $tid );
		}
		
		if ( !empty( $name ) ) {
			$this->db->like( 'A.doc_name', $name, 'both' );
			$this->db->or_like( 'A.user_name', $name, 'both' );
			$this->db->or_like( 'A.email', $name, 'both' );
			$this->db->or_like( 'A.phone', $name, 'both' );
		}
		
		$this->db->group_by( 'A.id' );
		$this->db->join( 'assigned_teacher_doctors TD', 'A.id = TD.doc_id', 'LEFT' );
		$query = $this->db->get( 'sif_admission A' );
		return $query->num_rows();
	}
	
	function get_admission_list( $limit = 100, $row = 0, $tid = NULL )
	{
		$sql_where = [];
		
		$year           = $this->input->get( 'year', TRUE );
		$session        = $this->input->get( 'session', TRUE );
		$reg_no         = $this->input->get( 'reg_no', TRUE );
		$from_date_time = $this->input->get( 'from_date_time', TRUE );
		$to_date_time   = $this->input->get( 'to_date_time', TRUE );
		$name           = $this->input->get( 'name', TRUE );
		
		if ( !empty( $year ) ) {
			$sql_where['A.year'] = $year;
		}
		if ( !empty( $session ) ) {
			$sql_where['A.session'] = $session;
		}
		if ( !empty( $reg_no ) ) {
			$sql_where['A.reg_no'] = $reg_no;
		}
		
		$status = $this->input->get( 'status', TRUE );
		if ( $status ) {
			$sql_where['A.status'] = $status;
		}
		
		// date range search
		if ( $from_date_time ) {
			$final_date_from              = date( 'Y-m-d H:i:s', strtotime( $from_date_time . " 00:00:00" ) );
			$sql_where['A.created_at >='] = $final_date_from;
		}
		if ( $to_date_time ) {
			$final_date_to                = date( 'Y-m-d H:i:s', strtotime( $to_date_time . " 23:59:59" ) );
			$sql_where['A.created_at <='] = $final_date_to;
		}
		
		$this->db->select( 'A.*, TD.teacher_id' );
		
		if ( $sql_where ) {
			$this->db->where( $sql_where );
		}
		
		if ( !empty( $tid ) ) {
			$this->db->where( 'TD.teacher_id', $tid );
		}
		
		if ( !empty( $name ) ) {
			$this->db->like( 'A.doc_name', $name, 'both' );
			$this->db->or_like( 'A.user_name', $name, 'both' );
			$this->db->or_like( 'A.email', $name, 'both' );
			$this->db->or_like( 'A.phone', $name, 'both' );
		}
		
		$this->db->order_by( "A.reg_no", "DESC" );
		$this->db->group_by( 'A.id' );
		$this->db->join( 'assigned_teacher_doctors TD', 'A.id = TD.doc_id', 'LEFT' );
		$query = $this->db->get( 'sif_admission A', $limit, $row );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
			return $result;
		}
		
		return FALSE;
	}
	
	function get_ser_pack_amount( $ser_pack_id, $course_code, $admi_type = "N" )
	{
		$this->db->select( 'id,fee_amount,old_fee_amount' );
		$this->db->where( 'ser_pack_id', $ser_pack_id );
		$this->db->where( 'course_code', $course_code );
		$query = $this->db->get( 'sif_fee' );
		
		if ( $query->num_rows() > 0 ) {
			if ( $admi_type == 'N' ) {
				return $query->row()->fee_amount;
			} elseif ( $admi_type == 'O' ) {
				return $query->row()->old_fee_amount;
			} else {
				return 0;
			}
		}
		
		return FALSE;
	}
	
	public function check_duplicate_doc_reg( $bmdc_no )
	{
		$this->db->select( 'id' );
		$this->db->where( 'bmdc_no', $bmdc_no );
		$query = $this->db->get( 'sif_doc_master' );
		if ( $query->num_rows() > 0 ) {
			return $query->row()->id;
		}
		return FALSE;
	}
	
	function get_admission_list_for_settiong_serarch()
	{
		//$read_db = $this->load->database('read', TRUE); /* database conection for read operation */
		
		$sql_where      = "";
		$year           = "";
		$session        = "";
		$course         = "";
		$faculty        = "";
		$batch          = "";
		$bmdc_no        = "";
		$reg_no         = "";
		$reg_type       = "";
		$from_date_time = "";
		$to_date_time   = "";
		
		
		if ( $this->input->server( 'REQUEST_METHOD' ) === 'POST' ) {
			
			$year     = $this->input->post( 'year', TRUE );
			$session  = $this->input->post( 'session', TRUE );
			$course   = $this->input->post( 'course', TRUE );
			$faculty  = $this->input->post( 'faculty', TRUE );
			$batch    = $this->input->post( 'batch', TRUE );
			$bmdc_no  = $this->input->post( 'bmdc_no', TRUE );
			$reg_no   = $this->input->post( 'reg_no', TRUE );
			$reg_type = $this->input->post( 'reg_type', TRUE );
			
			
			$from_date_time = $this->input->post( 'from_date_time', TRUE );
			$to_date_time   = $this->input->post( 'to_date_time', TRUE );
			
			$sql_where .= "id != ''";
			
			if ( !empty( $year ) ) {
				//echo $year;exit;
				$sql_where .= " and year = '$year'";
			}
			if ( !empty( $session ) ) {
				$sql_where .= " and session = '$session'";
			}
			if ( !empty( $course ) ) {
				$sql_where .= " and course_code = '$course'";
			}
			if ( !empty( $faculty ) ) {
				$sql_where .= " and faculty_code = '$faculty'";
			}
			if ( !empty( $batch ) ) {
				$sql_where .= " and batch_code = '$batch'";
			}
			if ( !empty( $bmdc_no ) ) {
				$sql_where .= " and bmdc_no = '$bmdc_no'";
			}
			if ( !empty( $reg_no ) ) {
				$sql_where .= " and reg_no = '$reg_no'";
			}
			if ( !empty( $reg_type ) ) {
				$sql_where .= " and reg_type = '$reg_type'";
			}
			
			if ( !empty( $from_date_time ) and !empty( $to_date_time ) ) {
				$final_date_from = $from_date_time . "13:59:59";
				$final_date_to   = $to_date_time . " 23:59:59";
				$sql_where       .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
			}
			
			$this->session->unset_userdata( 'sql_where_session' );
			$this->session->set_userdata( 'sql_where_session', $sql_where );
		} else {
			$sql_where = $this->session->userdata( 'sql_where_session' );
		}
		if ( $sql_where != "" ) {
			$this->db->where( $sql_where );
		}
		// $genesis = 'genesis';
		//$query = $this->db->where('reg_type',$genesis);
		$query = $this->db->order_by( "id", 'DESC' );
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
			return $result;
		}
		
		return FALSE;
	}
	
	public
	function save_doc_ins_roll_no()
	{
		$flag  = FALSE;
		$ids   = $this->input->post( 'ids', TRUE );
		$marks = $this->input->post( 'ins_roll_no', TRUE );
		if ( $ids && $marks ) {
			foreach ( $marks as $i => $mark ) {
				if ( $mark ) {
					$data['ins_roll_no'] = $mark;
					$this->db->where( 'id', $ids[$i] );
					$flag = $this->db->update( 'sif_admission', $data );
				}
			}
		}
		return $flag;
	}
	
	public
	function get_doctor_data( $admission_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'id', $admission_id );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		} else {
			return FALSE;
		}
	}
	
	public
	function update_admission_data( $auto_id, $master_table_auto_id )
	{
		$return = array( 'success' => FALSE );
		
		$year    = $this->input->post( 'year', TRUE );
		$session = $this->input->post( 'session', TRUE );
		
		$prev_year    = $this->input->post( 'prev_year', TRUE );
		$prev_session = $this->input->post( 'prev_session', TRUE );
//        $password = strtoupper( random_string( 'alnum', 6 ) );
		if ( $prev_year != $year || $prev_session != $session ) {
			$reg_no = $this->get_doc_reg_no( $year, $session );
		} else {
			$reg_no = $this->input->post( 'prev_reg', TRUE );
		}
		$bmdc_no = $this->input->post( 'bmdc_no', TRUE );
//        $duplicate_flag = $this->check_duplicate_doc_reg( $bmdc_no );
		
		$data_master = array(
			'user_name'   => $this->input->post( 'email', TRUE ),
			//            'password'       => $password,
			'bmdc_no'     => $bmdc_no,
			'doc_name'    => $this->input->post( 'doc_name', TRUE ),
			'father_name' => $this->input->post( 'father_name', TRUE ),
			'mother_name' => $this->input->post( 'mother_name', TRUE ),
			'phone'       => $this->input->post( 'phone', TRUE ),
			'email'       => $this->input->post( 'email', TRUE ),
		);
		
		if ( $reg_no ) {
			$data_master['registrtion_no'] = $reg_no;
		}
		
		$flag = $photo_flag = $sig_flag = FALSE;
		
		$photo = $this->save_photo( 'photo_image', $reg_no );
		$sig   = $this->save_signature( 'sig_name', $reg_no );
		
		if ( isset( $photo['path'] ) ) {
			$data_master['photo'] = $photo['path'];
		}
		//Documents Upload
		$mbbs = $this->save_document( 'doc_mbbs', $reg_no );
		$pg   = $this->save_document( 'doc_pg', $reg_no );
		// $phi = $this->save_document('doc_phi', $reg_no);
		$nid = $this->save_document( 'doc_nid', $reg_no );
		
		$data = array(
			'reg_type'           => 'CMED',
			'user_name'          => $this->input->post( 'email', TRUE ),
			//            'password'           => $password,
			'year'               => $year,
			'session'            => $session,
			// 'subject'            => $this->input->post( 'subject', TRUE ),
			'bmdc_no'            => $bmdc_no,
			'doc_name'           => $this->input->post( 'doc_name', TRUE ),
			'father_name'        => $this->input->post( 'father_name', TRUE ),
			'mother_name'        => $this->input->post( 'mother_name', TRUE ),
			'phone'              => $this->input->post( 'phone', TRUE ),
			'email'              => $this->input->post( 'email', TRUE ),
			'n_id'               => $this->input->post( 'n_id', TRUE ),
			'passport'           => $this->input->post( 'passport', TRUE ),
			'dob'                => $this->input->post( 'dob', TRUE ),
			'blood_gro'          => $this->input->post( 'blood_gro', TRUE ),
			'gender'             => $this->input->post( 'gender', TRUE ),
			'marital_status'     => $this->input->post( 'marital_status', TRUE ),
			'religion'           => $this->input->post( 'religion', TRUE ),
			'nationality'        => $this->input->post( 'nationality', TRUE ),
			'fb_id'              => $this->input->post( 'fb_id', TRUE ),
			'skype'              => $this->input->post( 'skype', TRUE ),
			'viber'              => $this->input->post( 'viber', TRUE ),
			'pt_call'            => $this->input->post( 'pt_call', TRUE ),
			'pw_payment'         => $this->input->post( 'pw_payment', TRUE ),
			'pw_communitcation'  => $this->input->post( 'pw_communitcation', TRUE ),
			'present_work_place' => $this->input->post( 'present_work_place', TRUE ),
			'job_description'    => $this->input->post( 'job_description', TRUE ),
			'spouse_name'        => $this->input->post( 'spouse_name', TRUE ),
			'spouse_mobile'      => $this->input->post( 'spouse_mobile', TRUE ),
			'per_divi'           => $this->input->post( 'per_divi', TRUE ),
			'per_dist'           => $this->input->post( 'per_dist', TRUE ),
			'per_thana'          => $this->input->post( 'per_thana', TRUE ),
			'per_address'        => $this->input->post( 'per_address', TRUE ),
			'mai_divi'           => $this->input->post( 'mai_divi', TRUE ),
			'mai_dist'           => $this->input->post( 'mai_dist', TRUE ),
			'mai_thana'          => $this->input->post( 'mai_thana', TRUE ),
			'mai_address'        => $this->input->post( 'mai_address', TRUE ),
			//            'photo'              => isset( $photo['path'] ) ? $photo['path'] : '',
			'doc_mbbs'           => $mbbs['status'] ? $mbbs['path'] : '',
			'doc_pg'             => $pg['status'] ? $pg['path'] : '',
			// 'doc_phi' => $phi['status'] ? $phi['path'] : '',
			'doc_nid'            => $nid['status'] ? $nid['path'] : '',
			'course_code'        => 1,
		);
		
		if ( isset( $photo['path'] ) ) {
			$data['photo'] = $photo['path'];
		}
		
		if ( $reg_no ) {
			$data['reg_no'] = $reg_no;
		}
		
		if ( $sig['status'] ) {
			$data['sign'] = $sig['path'];
		}
		
		$this->db->trans_start();
//        die( json_encode( [$auto_id, $master_table_auto_id] ) );
//        if ( $photo['status'] ) { //  && $sig['status'] && $mbbs['status'] && $pg['status'] && $nid['status']
		$this->db->where( 'id', $master_table_auto_id )->update( 'sif_doc_master', $data_master );
		$master_table_id   = $master_table_auto_id;
		$data['master_id'] = $master_table_id;
		$result            = $this->db->where( 'id', $auto_id )->update( 'sif_admission', $data );
		$insert_id         = $auto_id;
//            $this->db->insert( 'sif_admission_transition', $data );
		
		$exam_name   = $this->input->post( 'exam_name', TRUE );
		$pass_year   = $this->input->post( 'pass_year', TRUE );
		$exam_group  = $this->input->post( 'exam_group', TRUE );
		$exam_board  = $this->input->post( 'exam_board', TRUE );
		$exam_ins    = $this->input->post( 'exam_ins', TRUE );
		$exam_result = $this->input->post( 'exam_result', TRUE );
		if ( $exam_name && $insert_id ) {
			$this->db->delete( 'sif_edu_qualification', [ 'admiss_id' => $insert_id ] );
			foreach ( $exam_name as $i => $exam ) {
				
				if ( $exam ) {
					
					$exam_data = array(
						'admiss_id'   => $insert_id,
						'exam_name'   => $exam,
						'pass_year'   => $pass_year[$i],
						'exam_group'  => !empty( $exam_group[$i] ) ? $exam_group[$i] : 0,
						'exam_board'  => !empty( $exam_board[$i] ) ? $exam_board[$i] : 0,
						'exam_ins'    => $exam_ins[$i],
						'exam_result' => $exam_result[$i]
					);
					$this->db->insert( 'sif_edu_qualification', $exam_data );
				}
			}
		}
		
		$name         = $this->input->post( 'training_name', TRUE );
		$duration     = $this->input->post( 'training_duration', TRUE );
		$organization = $this->input->post( 'training_organization', TRUE );
		if ( $name && $insert_id ) {
			
			$this->db->delete( 'doc_training', [ 'admi_id' => $insert_id ] );
			
			foreach ( $name as $i => $val ) {
				if ( $val ) {
					$ref_data = array(
						'admi_id'               => $insert_id,
						'training_name'         => $val,
						'training_duration'     => $duration[$i],
						'training_organization' => $organization[$i],
						'created_at'            => database_formatted_date()
					);
					$this->db->insert( 'doc_training', $ref_data );
				}
			}
		}
		$exp_inst_name   = $this->input->post( 'exp_inst_name', TRUE );
		$exp_designation = $this->input->post( 'exp_designation', TRUE );
		$exp_los         = $this->input->post( 'exp_los', TRUE );
		if ( $exp_inst_name && $insert_id ) {
			
			$this->db->delete( 'doc_experience', [ 'admi_id' => $insert_id ] );
			
			foreach ( $exp_inst_name as $i => $val ) {
				if ( $val ) {
					$ref_data = array(
						'admi_id'         => $insert_id,
						'exp_inst_name'   => $val,
						'exp_designation' => $exp_designation[$i],
						'exp_los'         => $exp_los[$i],
						'created_at'      => database_formatted_date()
					);
					$this->db->insert( 'doc_experience', $ref_data );
				}
			}
		}
		
		
		if ( $this->db->trans_status() == TRUE ) {
			$this->db->trans_commit();
			
			$return['success'] = TRUE;
			$return['data']    = $data_master;
		} else {
			$this->db->trans_rollback();
		}
//        } else {
//            // $return['msg'] .= "MBBS Certificate => ".$mbbs['msg'] ."POST Graduate Certificate => ". $pg['msg'] ."NID => ". $nid['msg'] . "Photo => ".$photo['msg'] . "Signature => ". $sig['msg']; // . $phi['msg']
////            $return['msg'] .= $mbbs['msg'] ? "<p>MBBS Certificate: {$mbbs['msg']}</p>" : NULL;
////            $return['msg'] .= $pg['msg'] ? "<p>POST Graduate Certificate: {$pg['msg']}</p>" : NULL;
////            $return['msg'] .= $nid['msg'] ? "<p>NID: {$nid['msg']}</p>" : NULL;
//            $return['msg'] = $photo['msg'] ? "<p>Photo: {$photo['msg']}</p>" : NULL;
////            $return['msg'] .= $sig['msg'] ? "<p>Signature: {$sig['msg']}</p>" : NULL;
//        }
		
		return $return;
	}
	
	public
	function update_outlier_data( $auto_id, $master_table_auto_id )
	{
		$return      = array( 'success' => FALSE );
		$year        = $this->input->post( 'year', TRUE );
		$session     = $this->input->post( 'session', TRUE );
		$course      = $this->input->post( 'course_code', TRUE );
		$faculty     = $this->input->post( 'faculty_code', TRUE );
		$batch       = $this->input->post( 'batch_code', TRUE );
		$ser_pack_id = $this->input->post( 'service_pack_id', TRUE );
		$password    = random_string( 'alnum', 8 );
		$reg_no      = $this->get_doc_reg_no( $year, $session, $course, $batch ); //$faculty,
		$bmdc_no     = $this->input->post( 'bmdc_no', TRUE );
		
		$admi_type  = $this->input->post( 'admi_type' );
		$fee_amount = $this->get_ser_pack_amount( $ser_pack_id, $course, $admi_type );
		
		
		$data_master = array( 'registrtion_no' => $reg_no, 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), );
		
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '300', 'size' => '100' );
			$photo_tempname  = $_FILES[$photo_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$photo_name]['size'] <= 100000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$photo = $this->Mod_file_upload->upload_file( 'photo', 'photo_image', $condition_photo, 'photo_' . $reg_no );
				
				if ( $photo['status'] ) {
					$photo_flag = TRUE;
				} else {
					$return['msg'] .= $photo_flag['msg'];
				}
			} else {
				$return['msg'] .= '<p>Image Size:100Kb Max, width & height(300 X 300 Pixel), only .jpg is allowed to upload</p>';
			}
			
			if ( isset( $photo['path'] ) ) {
				$data_master['photo'] = $photo['path'];
			}
		}
		
		
		$this->db->where( 'id', $master_table_auto_id );
		$this->db->update( 'sif_doc_master', $data_master );
		
		
		$college_id = $this->input->post( 'medical_col', TRUE );
		
		$data = array( 'master_id' => $master_table_auto_id, 'reg_no' => $reg_no, 'reg_type' => 'outlier', 'user_name' => $this->input->post( 'bmdc_no', TRUE ), 'password' => $password, 'institute' => $this->input->post( 'institute', TRUE ), 'year' => $year, 'course_code' => $course, 'faculty_code' => $faculty, 'batch_code' => $batch, 'subject' => $this->input->post( 'subject', TRUE ), 'service_pack_id' => $ser_pack_id, 'admi_type' => $admi_type, 'session' => $session, 'medical_col' => $college_id, 'collage_type' => $this->get_collage_type( $college_id ), 'doc_name' => $this->input->post( 'doc_name', TRUE ), 'blood_gro' => $this->input->post( 'blood_gro', TRUE ), 'father_name' => $this->input->post( 'father_name', TRUE ), 'mother_name' => $this->input->post( 'mother_name', TRUE ), 'n_id' => $this->input->post( 'n_id', TRUE ), 'passport' => $this->input->post( 'passport', TRUE ), 'job_des' => $this->input->post( 'job_des', TRUE ), 'f_id' => $this->input->post( 'f_id', TRUE ), 'bmdc_no' => $this->input->post( 'bmdc_no', TRUE ), 'spouse_name' => $this->input->post( 'spouse_name', TRUE ), 'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ), 'answer_type' => $this->input->post( 'answer_type', TRUE ), 'rcp_reg_no' => $this->input->post( 'rcp_reg_no', TRUE ), 'per_divi' => $this->input->post( 'per_divi', TRUE ), 'per_dist' => $this->input->post( 'per_dist', TRUE ), 'per_thana' => $this->input->post( 'per_thana', TRUE ), 'per_address' => $this->input->post( 'per_address', TRUE ), 'mai_divi' => $this->input->post( 'mai_divi', TRUE ), 'mai_dist' => $this->input->post( 'mai_dist', TRUE ), 'mai_thana' => $this->input->post( 'mai_thana', TRUE ), 'mai_address' => $this->input->post( 'mai_address', TRUE ), 'phone' => $this->input->post( 'phone', TRUE ), 'email' => $this->input->post( 'email', TRUE ), 'status' => '1', );
		
		
		if ( isset( $photo['path'] ) ) {
			$data['photo'] = $photo['path'];
		}
		$sig_flag = FALSE;
		
		$return['msg'] = '';
		
		$sig_name = 'sig_name';
		if ( $_FILES[$sig_name]['size'] > 0 ) {
			$condition_photo = array( 'width' => '300', 'height' => '80', 'size' => '50' );
			$photo_tempname  = $_FILES[$sig_name]['tmp_name'];
			list( $p_width, $p_height ) = getimagesize( $photo_tempname );
			
			if ( $_FILES[$sig_name]['size'] <= 50000 && $p_width == $condition_photo['width'] && $p_height == $condition_photo['height'] ) {
				$sig = $this->Mod_file_upload->upload_file( 'sign', 'sig_name', $condition_photo, 'sign_' . $reg_no );
				
				if ( $sig['status'] ) {
					$sig_flag = TRUE;
				} else {
					$return['msg'] .= $sig['msg'];
				}
			} else {
				$return['msg'] .= '<p>Signature Size:50Kb Max, width & height(300 X 80 Pixel), only .jpg is allowed to upload</p>';
			}
			
			if ( isset( $sig['path'] ) ) {
				$data['sign'] = $sig['path'];
			}
		}
		
		$this->db->where( 'id', $auto_id );
		$this->db->where( 'master_id', $master_table_auto_id );
		$result = $this->db->update( 'sif_admission', $data );
		
		$this->db->insert( 'sif_admission_transition', $data );
		
		
		$exam_name   = $this->input->post( 'exam_name', TRUE );
		$pass_year   = $this->input->post( 'pass_year', TRUE );
		$exam_group  = $this->input->post( 'exam_group', TRUE );
		$exam_board  = $this->input->post( 'exam_board', TRUE );
		$exam_ins    = $this->input->post( 'exam_ins', TRUE );
		$exam_result = $this->input->post( 'exam_result', TRUE );
		
		$this->db->where( 'admiss_id', $auto_id );
		$this->db->delete( 'sif_edu_qualification' );
		
		if ( $exam_name && $auto_id ) {
			foreach ( $exam_name as $i => $exam ) {
				if ( $exam && $exam_result[$i] ) {
					$exam_data = array( 'admiss_id' => $auto_id, 'exam_name' => $exam, 'pass_year' => $pass_year[$i], 'exam_group' => isset( $exam_group[$i] ) ? $exam_group[$i] : '', 'exam_board' => isset( $exam_board[$i] ) ? $exam_board[$i] : '', 'exam_ins' => $exam_ins[$i], 'exam_result' => $exam_result[$i] );
					$this->db->insert( 'sif_edu_qualification', $exam_data );
				}
			}
		}
		
		$name        = $this->input->post( 'name', TRUE );
		$designation = $this->input->post( 'designation', TRUE );
		$mobile      = $this->input->post( 'mobile', TRUE );
		$relation    = $this->input->post( 'relation', TRUE );
		
		$this->db->where( 'admiss_id', $auto_id );
		$this->db->delete( 'sif_reference' );
		
		if ( !empty( $name ) && $auto_id ) {
			foreach ( $name as $i => $val ) {
				
				if ( !empty( $val ) ) {
					$ref_data = array( 'admiss_id' => $auto_id, 'name' => $val, 'designation' => $designation[$i], 'mobile' => $mobile[$i], 'relation' => $relation[$i] );
					$this->db->insert( 'sif_reference', $ref_data );
				}
			}
		}
		
		if ( $result ) {
			$return['success'] = TRUE;
		}
		
		return $return;
	}
	
	public function get_payment_info_doctor( $doctor_reg_no )
	{
		$this->db->select_max( 'date' );
		$this->db->select_max( 'auth_by' );
		$this->db->select_sum( 'amount' );
		$this->db->where( 'doc_reg_no', $doctor_reg_no );
		$query = $this->db->get( 'sif_doc_payment' );
		// print_r($query->result()->amount);exit;
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		} else {
			return FALSE;
		}
	}
	
	public function get_unassigned_doc_list()
	{
		// $this->db->where('assigned_teacher_id', NULL);
		$this->db->where( 'status', 1 );
		$this->db->order_by( 'reg_no' );
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result_array();
			
			return array_column( $result, 'doc_name', 'id' );
		}
		
		return FALSE;
	}
	
	
	public function get_assigned_doc_list( $teacher_id = NULL )
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			
			$this->db->select( 'A.*, TD.teacher_id, TD.module' );
			$this->db->where( 'status', 1 );
			if ( $year ) {
				$this->db->where( 'TD.year', $year );
			}
			if ( $session ) {
				$this->db->where( 'TD.session', $session );
			}
			if ( $teacher_id ) {
				$this->db->where( 'TD.teacher_id', $teacher_id );
			}
			
			if ( $module ) {
				$this->db->where( 'TD.module', $module );
			}
			
			if ( $module ) {
				$this->db->where( 'TD.unit', $unit );
			}
			
			$this->db->join( 'assigned_teacher_doctors TD', 'A.id = TD.doc_id', 'LEFT' );
			$this->db->order_by( 'TD.teacher_id, A.reg_no' );
			$query = $this->db->get( 'sif_admission A' );
			
			if ( $query->num_rows() > 0 ) {
				return $query->result();
			}
		}
		
		return FALSE;
	}
	
	public function get_year_session_doc_ids( $year = NULL, $session = NULL )
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
		}
		$this->db->select( 'id, module' );
		$this->db->where( 'status', 1 );
		if ( $year ) {
			$this->db->where( 'year', $year );
		}
		if ( $session ) {
			$this->db->where( 'session', $session );
		}
		
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
}
