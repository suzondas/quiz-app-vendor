<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_teacher
 * @author jnahian
 * @property Mod_file_upload $Mod_file_upload
 * @property common_lib      $common_lib
 * @property Mod_email       $Mod_email
 */
class Mod_teacher extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model( 'mod_file_upload' );
	}
	
	function get_course_list()
	{
		
		$query = $this->db->order_by( "id", 'ASC' );
		$query = $this->db->get( 'sif_course' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
		}
		$this->db->trans_start();
		
		return $result;
	}
	
	function get_course_list_array()
	{
		$list  = $this->get_course_list();
		$array = array('' => 'Select');
		foreach ( $list as $ser ) {
			$array[$ser->course_code] = $ser->course_name;
		}
		return $array;
	}
	
	function get_faculty_list_array()
	{
		$facultys = $this->get_faculty_list();
		
		$array = array('' => 'Select');
		foreach ( $facultys as $i => $faculty ) {
			$array[$faculty->faculty_code] = $faculty->faculty_name;
		}
		return $array;
	}
	
	function get_faculty_list()
	{
		
		//$query = $this->db->order_by("id", 'ASC');
		$this->db->select( 'faculty_name,faculty_code,id' );
		$query = $this->db->get( 'sif_faculty' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
		}
		
		return $result;
	}
	
	
	function get_subject_list_array()
	{
		$subjects = $this->get_subject_list();
		
		$array = array('' => 'Select');
		foreach ( $subjects as $i => $subject ) {
			$array[$subject->id] = $subject->subject;
		}
		return $array;
	}
	
	function get_subject_list()
	{
		$query = $this->db->order_by( "id", 'ASC' );
		$query = $this->db->get( 'sif_subject' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
			return $result;
		}
		
		return FALSE;
	}
	
	
	function save_data()
	{
		$return     = array('status' => FALSE, 'msg' => '');
		$teacher_id = $this->common_lib->get_teacher_id();
		$data       = array(
			'teacher_id'   => $teacher_id,
			'tec_name'     => $this->input->post( 'tec_name', TRUE ),
			'tec_type'     => $this->input->post( 'tec_type', TRUE ),
			'fath_name'    => $this->input->post( 'fath_name', TRUE ),
			'mother_name'  => $this->input->post( 'mother_name', TRUE ),
			'dob'          => $this->input->post( 'dob', TRUE ),
			'gender'       => $this->input->post( 'gender', TRUE ),
			'religion'     => $this->input->post( 'religion', TRUE ),
			'nationality'  => $this->input->post( 'nationality', TRUE ),
			'na_id'        => $this->input->post( 'na_id', TRUE ),
			'pass_no'      => $this->input->post( 'pass_no', TRUE ),
			'mobile'       => $this->input->post( 'mobile', TRUE ),
			'telephone'    => $this->input->post( 'telephone', TRUE ),
			'email'        => $this->input->post( 'email', TRUE ),
			'bmdc_no'      => $this->input->post( 'bmdc_no', TRUE ),
			'joining_date' => $this->input->post( 'joining_date', TRUE ),
			'spouse_name'  => $this->input->post( 'spouse_name', TRUE ),
			'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ),
			'blood_gro'    => $this->input->post( 'blood_gro', TRUE ),
			'per_divi'     => $this->input->post( 'per_divi', TRUE ),
			'per_dist'     => $this->input->post( 'per_dist', TRUE ),
			'per_thana'    => $this->input->post( 'per_thana', TRUE ),
			'per_address'  => $this->input->post( 'per_address', TRUE ),
			'mai_divi'     => $this->input->post( 'mai_divi', TRUE ),
			'mai_dist'     => $this->input->post( 'mai_dist', TRUE ),
			'mai_thana'    => $this->input->post( 'mai_thana', TRUE ),
			'mai_address'  => $this->input->post( 'mai_address', TRUE ),
			'status'       => 1,
			'created_by'   => AUTH_EMAIL,
			'created_at'   => database_formatted_date(),
		);
//        if ($this->ion_auth->username_check($data['bmdc_no'])) {
		// echo 'adsfasdf';exit;
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array('size' => '500'); // 'width' => '300', 'height' => '300',
			$photo           = $this->Mod_file_upload->upload_file( 'teacher-photo', 'photo_image', $condition_photo, $teacher_id );
			
			if ( $photo['status'] ) {
				$photo_flag = TRUE;
			} else {
				$return['msg'] .= $photo_flag['msg'];
			}
		}
		
		if ( isset( $photo['path'] ) && $photo_flag ) {
			$data['photo'] = $photo['path'];
			
		}
		
		// if ($photo_flag) {
		
		$this->db->trans_start();
		$result    = $this->db->insert( 'sif_teacher', $data );
		$insert_id = $this->db->insert_id();
		
		// Educational Qualification
		$exams = $this->input->post( 'exam', TRUE );
		if ( $exams ) {
			$exam_data = [];
			foreach ( $exams as $i => $exam ) {
				
				if ( $exam && $exam['result'] ) {
					$exam_data[$i] = array(
						'teacher_auto_id' => $insert_id,
						'exam_name'       => $exam['name'] == 'Others' ? $this->input->post( 'other_exam_name', TRUE ) : $exam['name'],
						'pass_year'       => $exam['pass_year'],
						'exam_group'      => isset( $exam['group'] ) ? $exam['group'] : '',
						'exam_board'      => isset( $exam['board'] ) ? $exam['board'] : '',
						'exam_ins'        => isset( $exam['inst'] ) ? $exam['inst'] : '',
						'exam_result'     => $exam['result']
					);
					
				}
			}
			if ( $exam_data ) $this->db->insert_batch( 'sif_teacher_edu_qualification', $exam_data );
		}
		
		if ( $result ) {
			$username = $data['email'];
			$password = generate_random_password( 6 );
			$email    = $data['email'];
			
			$group = array('4');
			
			$exp        = explode( ' ', $data['tec_name'] );
			$first_name = $exp[0];
			$last_name  = $exp[count( $exp ) - 1];
			
			//teachers login information
			$additional_data = array(
				'teacher_id'    => $teacher_id,
				'password_view' => $password,
				'first_name'    => $first_name,
				'last_name'     => $last_name,
				'phone'         => $data['mobile'],
				'image'         => isset( $photo['path'] ) ? $photo['path'] : ''
			);
			
			if ( $this->ion_auth->register( $username, $password, $email, $additional_data, $group ) ) {
				// Send Email to Teacher
				$subject         = 'CMEd Faculty Credentials';
				$data            = [
					'name'     => $data['tec_name'],
					'username' => $username,
					'password' => $password,
					'subject'  => $subject
				];
				$data['company'] = $this->Mod_setting->get_general_info();
				$stu_msg         = $this->load->view( 'emails/faculty_userid_pass', $data, TRUE );
                $this->Mod_email->SendGmailEmail($email, $subject, $stu_msg);
//                $return['status'] = TRUE;
			} else {
				$return['msg'] .= $this->ion_auth->errors();
			}
		}
		
		if ( $this->db->trans_status() ) {
			$this->db->trans_complete();
			$this->db->trans_commit();
			$return['status'] = TRUE;
		} else {
			$this->db->trans_rollback();
		}
		
		return $return;
	}
	
	
	function update_data( $auto_id )
	{
		$return        = array('status' => FALSE, 'msg' => '');
		$data          = array(
			'tec_name'     => $this->input->post( 'tec_name', TRUE ),
			'tec_type'     => $this->input->post( 'tec_type', TRUE ),
			'fath_name'    => $this->input->post( 'fath_name', TRUE ),
			'mother_name'  => $this->input->post( 'mother_name', TRUE ),
			'dob'          => $this->input->post( 'dob', TRUE ),
			'gender'       => $this->input->post( 'gender', TRUE ),
			'religion'     => $this->input->post( 'religion', TRUE ),
			'nationality'  => $this->input->post( 'nationality', TRUE ),
			'na_id'        => $this->input->post( 'na_id', TRUE ),
			'pass_no'      => $this->input->post( 'pass_no', TRUE ),
			'mobile'       => $this->input->post( 'mobile', TRUE ),
			'telephone'    => $this->input->post( 'telephone', TRUE ),
			'bmdc_no'      => $this->input->post( 'bmdc_no', TRUE ),
			'joining_date' => $this->input->post( 'joining_date', TRUE ),
			'spouse_name'  => $this->input->post( 'spouse_name', TRUE ),
			'pouse_mobile' => $this->input->post( 'pouse_mobile', TRUE ),
			'blood_gro'    => $this->input->post( 'blood_gro', TRUE ),
			'per_divi'     => $this->input->post( 'per_divi', TRUE ),
			'per_dist'     => $this->input->post( 'per_dist', TRUE ),
			'per_thana'    => $this->input->post( 'per_thana', TRUE ),
			'per_address'  => $this->input->post( 'per_address', TRUE ),
			'mai_divi'     => $this->input->post( 'mai_divi', TRUE ),
			'mai_dist'     => $this->input->post( 'mai_dist', TRUE ),
			'mai_thana'    => $this->input->post( 'mai_thana', TRUE ),
			'mai_address'  => $this->input->post( 'mai_address', TRUE ),
			'status'       => 1,
			'created_by'   => AUTH_EMAIL,
			'created_at'   => database_formatted_date(),
		);
		$teacher_id    = $this->get_teacher_id( $auto_id );
		$flag          = $photo_flag = FALSE;
		$return['msg'] = '';
		$photo_name    = 'photo_image';
		if ( $_FILES[$photo_name]['size'] > 0 ) {
			$condition_photo = array('size' => '500'); // 'width' => '300', 'height' => '300',
			$photo           = $this->Mod_file_upload->upload_file( 'teacher-photo', 'photo_image', $condition_photo, $teacher_id );
			
			if ( $photo['status'] ) {
				$photo_flag = TRUE;
			} else {
				$return['msg'] .= $photo_flag['msg'];
			}
		}
		
		if ( isset( $photo['path'] ) && $photo_flag ) {
			$data['photo'] = $photo['path'];
		}
		
		// if ($photo_flag) {
		$this->db->trans_start();
		$result    = $this->db->update( 'sif_teacher', $data, ['id' => $auto_id] );
		$insert_id = $auto_id;
		
		
		// delete existing data
		$this->db->delete( 'sif_teacher_edu_qualification', ['teacher_auto_id' => $insert_id] );
		
		// Educational Qualification
		$exams = $this->input->post( 'exam', TRUE );
		if ( $exams ) {
			$exam_data = [];
			foreach ( $exams as $i => $exam ) {
				
				if ( $exam && $exam['result'] ) {
					$exam_data[$i] = array(
						'teacher_auto_id' => $insert_id,
						'exam_name'       => $exam['name'] == 'Others' ? $this->input->post( 'other_exam_name', TRUE ) : $exam['name'],
						'pass_year'       => $exam['pass_year'],
						'exam_group'      => isset( $exam['group'] ) ? $exam['group'] : '',
						'exam_board'      => isset( $exam['board'] ) ? $exam['board'] : '',
						'exam_ins'        => isset( $exam['inst'] ) ? $exam['inst'] : '',
						'exam_result'     => $exam['result']
					);
					
				}
			}
			if ( $exam_data ) $this->db->insert_batch( 'sif_teacher_edu_qualification', $exam_data );
		}
		
		if ( $result ) {
			
			$exp        = explode( ' ', $data['tec_name'] );
			$first_name = $exp[0];
			$last_name  = $exp[count( $exp ) - 1];
			
			//teachers login information
			$additional_data = array(
				'first_name' => $first_name,
				'last_name'  => $last_name,
				'phone'      => $data['mobile'],
				//                'image'         => isset( $photo['path'] ) ? $photo['path'] : ''
			);
			$mas_id          = $this->get_master_id_by_id( $insert_id );
			$this->ion_auth->update( $mas_id->id, $additional_data );
			
			if ( $this->db->trans_status() ) {
				$this->db->trans_complete();
				$this->db->trans_commit();
				
				// Send Email to Teacher
//                $stu_msg = "Your User ID: $username and PASSWORD: $password";
//                $this->Mod_email->SendGmailEmail($email, 'User ID Password', $stu_msg);
				$return['status'] = TRUE;
			} else {
				$this->db->trans_rollback();
				$return['msg'] .= $this->ion_auth->errors();
			}
		} else {
			$this->db->trans_rollback();
		}
		return $return;
	}
	
	public function get_master_id_by_id( $id )
	{
		$tid = $this->get_teacher_id( $id );
		
		$query = $this->db->select( 'id' )
						  ->where( 'teacher_id', $tid )
						  ->get( 'sif_users' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->first_row();
		}
		
		return FALSE;
	}
	
	
	function count_records()
	{
		//$read_db = $this->load->database('read', TRUE); /* database conection for read operation */
		
		$sql_where      = "";
		$tec_name       = "";
		$from_date_time = "";
		$to_date_time   = "";
		// $status = "";
		
		if ( $this->input->server( 'REQUEST_METHOD' ) === 'POST' ) {
			$tec_name = $this->security->xss_clean( $this->input->post( 'tec_name' ) );
			
			$from_date_time = $this->security->xss_clean( $this->input->post( 'from_date_time' ) );
			$to_date_time   = $this->security->xss_clean( $this->input->post( 'to_date_time' ) );
			// $status = $this->security->xss_clean($this->input->post('status'));
			
			$sql_where .= "id != ''";
			
			if ( !empty( $tec_name ) ) {
				$sql_where .= " and tec_name = '$tec_name'";
				//echo $tec_name;exit;
			}
//            if (!empty($subject_id)) {
//                $sql_where .= " and subject_id = '$subject_id'";
//            }
			if ( !empty( $from_date_time ) and !empty( $to_date_time ) ) {
				$final_date_from = date( 'Y-m-d', strtotime( $from_date_time ) ) . " 00:00:00";
				$final_date_to   = date( 'Y-m-d', strtotime( $to_date_time ) ) . " 23:59:59";
				$sql_where       .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
			}
//            if (!empty($status)) {
//                $sql_where .= " and status = '$status'";
//            }
			$this->session->unset_userdata( 'sql_where_session' );
			$this->session->set_userdata( 'sql_where_session', $sql_where );
			
		} else {
			$sql_where = $this->session->userdata( 'sql_where_session' );
		}
		
		if ( $sql_where != "" ) {
			$this->db->where( $sql_where );
		}
		
		$query = $this->db->select( 'id' );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query ) {
			return $query->num_rows();
		} else {
			return FALSE;
		}
	}
	
	
	function get_records_list( $limit = 20, $row = 0 )
	{
		//$read_db = $this->load->database('read', TRUE); /* database conection for read operation */
		
		// $result = "";
		$sql_where      = "";
		$tec_name       = "";
		$from_date_time = "";
		$to_date_time   = "";
		//$status = "";
		
		if ( $this->input->server( 'REQUEST_METHOD' ) === 'POST' ) {
			$tec_name = $this->security->xss_clean( $this->input->post( 'tec_name' ) );
			//$subject_id = $this->security->xss_clean($this->input->post('subject_id'));
			
			$from_date_time = $this->security->xss_clean( $this->input->post( 'from_date_time' ) );
			$to_date_time   = $this->security->xss_clean( $this->input->post( 'to_date_time' ) );
			//$status = $this->security->xss_clean($this->input->post('status'));
			
			$sql_where .= "id != ''";
			
			if ( !empty( $tec_name ) ) {
				$sql_where .= " and tec_name = '$tec_name'";
			}
//            if (!empty($subject_id)) {
//                $sql_where .= " and subject_id = '$subject_id'";
//            }
			if ( !empty( $from_date_time ) and !empty( $to_date_time ) ) {
				$final_date_from = date( 'Y-m-d', strtotime( $from_date_time ) ) . " 00:00:00";
				$final_date_to   = date( 'Y-m-d', strtotime( $to_date_time ) ) . " 23:59:59";
				$sql_where       .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
			}
//            if (!empty($status)) {
//                $sql_where .= " and status = '$status'";
//            }
			$this->session->unset_userdata( 'sql_where_session' );
			$this->session->set_userdata( 'sql_where_session', $sql_where );
			
		} else {
			$sql_where = $this->session->userdata( 'sql_where_session' );
		}
		
		if ( $sql_where != "" ) {
			$this->db->where( $sql_where );
		}
		$query = $this->db->order_by( "id", 'DESC' );
		$query = $this->db->get( 'sif_teacher', $limit, $row );
		
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			return $results;
		}
		//echo $read_db->last_query();
		return FALSE;
	}
	
	public function get_auto_id( $teacher_id )
	{
		$this->db->select( 'id' );
		$this->db->where( 'teacher_id', $teacher_id );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			return $query->row()->id;
		} else {
			return FALSE;
		}
	}
	
	public function get_teacher_id( $id )
	{
		$this->db->select( 'teacher_id' );
		$this->db->where( 'id', $id );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			return $query->row()->teacher_id;
		} else {
			return FALSE;
		}
	}
	
	function get_details( $teacher_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'id', $teacher_id );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			$result = $query->row();
			
			return $result;
			
		}
		return FALSE;
	}
	
	public function get_education_record( $teacher_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'teacher_auto_id', $teacher_id );
		$query = $this->db->get( 'sif_teacher_edu_qualification' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	public function get_schedules_data( $teacher_id = NULL )
	{
		$this->db->select( '*' );
		if ( $teacher_id ) {
			$this->db->where( 'teacher_id', $teacher_id );
		}
		$this->db->order_by( 'date', 'desc' );
		$this->db->order_by( 'time_from', 'desc' );
		$query = $this->db->get( 'sif_schedule' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	public function get_evaluation_result( $schedule_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'schedule_id', $schedule_id );
		$query = $this->db->get( 'sif_teacher_evaluation' );
		//$in = count($query->introduction);
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	public function get_courese_plan_code_number( $teacher_id )
	{
		$this->db->select( '*' );
		$this->db->where( 'id', $teacher_id );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			$result = $query->row();
			
			$crs_fac     = $this->db->where( 'teacher_id', $result->id )->get( 'sif_teacher_course_faculty' )->result();
			$course_plan = array();
			
			foreach ( $crs_fac as $i => $row ) {
				$where = array('teacher_id' => $result->id, 'crs_fac_id' => $row->id);
				$subs  = $this->db->where( $where )->get( 'sif_teacher_subjects' )->result();
				$tops  = $this->db->where( $where )->get( 'sif_teacher_topics' )->result();
				
				$course_plan[$i]['course']   = $row->course_code;
				$course_plan[$i]['faculty']  = $row->faculty_code;
				$course_plan[$i]['type']     = $row->type;
				$course_plan[$i]['subjects'] = array();
				$course_plan[$i]['topics']   = array();
				
				foreach ( $subs as $sub ) {
					array_push( $course_plan[$i]['subjects'], $sub->subject_id );
				}
				
				foreach ( $tops as $top ) {
					array_push( $course_plan[$i]['topics'], $top->topic_id );
				}
				
			}
			$result->course_plan = $course_plan;
			return $result;
		}
		return FALSE;
	}
	
	public function getTeacherList()
	{
		$query = $this->db->select( 'tec_name, teacher_id' )->where( 'status', 1 )->get( 'sif_teacher' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result_array();
			return ['' => 'Select Faculty'] + array_column($result, 'tec_name', 'teacher_id');
		}
		
		return FALSE;
	}
	
	public function assign_doc()
	{
		// echo '<pre>'; print_r($this->input->post() ); exit;
		if ( $this->input->post() ) {
			$teacher = $this->input->post( 'teacher', TRUE );
			$doctors = $this->input->post( 'doctors', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$this->db->trans_start();
			if ($doctors) {

				$delete = $this->db->where(['year' => $year, 'session' => $session, 'unit' => $unit, 'module' => $module])->delete('assigned_teacher_doctors');

				foreach ($doctors as $doctor) {
					$data = [
						'year' => $year,
						'session' => $session,
						'unit' => $unit,
						'module' => $module,
						'teacher_id' => $teacher,
						'doc_id' => $doctor,
						'created_by' => AUTH_EMAIL,
						'created_at' => database_formatted_date(),
					];

					$this->db->insert('assigned_teacher_doctors', $data);
				}
			}
			
			if ( $this->db->trans_status() === FALSE ) {
				$this->db->trans_rollback();
			} else {
				$this->db->trans_commit();
				return TRUE;
			}
		}
		return FALSE;
	}
	
	function save_assignment()
	{
		if ( $this->input->post() ) {
			$id                 = $this->input->post( 'doc_id', TRUE );
			$doc                = $this->Mod_admission->get_doctor_data( $id );
			$data               = [];
			$data['doc_id']     = $id;
			$data['teacher_id'] = $this->input->post( 'teacher_id', TRUE );
			$data['year']       = $doc->year;
			$data['session']    = $doc->session;
			$data['module']     = $this->input->post( 'module', TRUE );
			$data['unit']       = $this->input->post( 'unit', TRUE );
			$data['title']      = $this->input->post( 'subject', TRUE );
			$data['desc']       = $this->input->post( 'desc', TRUE );
			$data['mark']       = $this->input->post( 'mark', TRUE );
			$data['sent']       = date( 'Y-m-d h:i:s' );
			
			if ( $_FILES['attachment']['error'] == 0 ) {
				$condition  = array('size' => '5000');
				$attachment = $this->Mod_file_upload->upload_file( 'attachment', 'attachment', $condition, '', '*' );
				
				if ( $attachment['status'] ) {
					$data['attachment'] = $attachment['path'];
				}
			}
			$assignment_id = $this->input->post( 'assignment_id', TRUE );
			if ( $assignment_id ) {
				
				$data['assignment_id'] = $assignment_id;
				$flag                  = $this->db->insert( 'assignments_resend', $data );
			} else {
				$flag = $this->db->insert( 'assignments', $data );
			}
			
			if ( $flag ) {
				return TRUE;
			}
		}
		return FALSE;
	}
	
	function save_fellows_assignment( $ids = NULL )
	{
		if ( $this->input->post() ) {
			$data = [];
			if ( $ids && is_array( $ids ) ) {
				$doc_id = $ids;
			} else {
				$doc_id = $this->input->post( 'doc_id', TRUE );
			}
			
			$attachment = ['status' => FALSE];
			if ( $_FILES['attachment']['error'] == 0 ) {
				$condition  = array('size' => '5000');
				$attachment = $this->Mod_file_upload->upload_file( 'attachment', 'attachment', $condition, '', '*' );
			}
			$flag = FALSE;
			foreach ( $doc_id as $item ) {
				$doc                = $this->Mod_admission->get_doctor_data( $item );
				$data['doc_id']     = $item;
				$data['teacher_id'] = $this->input->post( 'teacher_id', TRUE );
				$data['year']       = $doc->year;
				$data['session']    = $doc->session;
				$data['module']     = $this->input->post( 'module', TRUE );
				$data['unit']       = $this->input->post( 'unit', TRUE );
				$data['title']      = $this->input->post( 'subject', TRUE );
				$data['desc']       = $this->input->post( 'desc', TRUE );
				$data['mark']       = $this->input->post( 'mark', TRUE );
				$data['sent']       = date( 'Y-m-d h:i:s' );
				$data['status']     = 'P';
				$data['attachment'] = $attachment['status'] ? $attachment['path'] : '';
				
				$flag = $this->db->insert( 'assignments', $data );
			}
			
			
			if ( $flag ) {
				// send email
				$this->Mod_teacher->send_assignment_emails();
				return TRUE;
			}
		}
		return FALSE;
	}
	
	function check_fellows_assignment( $year = NULL, $session = NULL, $module = NULL, $unit = NULL, $doc_ids = NULL )
	{
		
		$this->db->select( 'id, doc_id' );
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			$doc_ids = $this->input->post( 'doc_id', TRUE );
			
		}
		$year ? $this->db->where( 'year', $year ) : NULL;
		$session ? $this->db->where( 'session', $session ) : NULL;
		$module ? $this->db->where( 'module', $module ) : NULL;
		$unit ? $this->db->where( 'unit', $unit ) : NULL;
		$doc_ids ? $this->db->where_in( 'doc_id', $doc_ids ) : NULL;
		$query = $this->db->get( 'assignments' );
		
		if ( $query->num_rows() == 0 ) {
			return TRUE;
		} elseif ( $query->num_rows() == 1 ) {
			return FALSE;
		} elseif ( $query->num_rows() < 5 ) {
			$res         = $query->result_array();
			$exclude_ids = array_column( $res, 'doc_id' );
			$ids         = array_diff( $doc_ids, $exclude_ids );
			return array_values( $ids );
		}
		return FALSE;
	}
	
	function save_assignment_feedback( $id )
	{
		$data = [
			"feedback_msg" => $this->input->post( "desc", TRUE ),
			"feedback_at"  => database_formatted_date(),
			"status"       => "F"
		];
		if ( $_FILES['attachment']['error'] == 0 ) {
			$condition  = array('size' => '5000');
			$attachment = $this->Mod_file_upload->upload_file( 'attachment', 'attachment', $condition, '', '*' );
			
			if ( $attachment['status'] ) {
				$data['feedback_attachment'] = $attachment['path'];
			}
		}
		
		$this->db->trans_start();
		$this->db->where( 'id', $id )->update( 'assignments_reply', $data );
		$aid = $this->input->post( 'assignment_id', TRUE );
		$this->db->update( 'assignments', ['status' => 'F'], ['id' => $aid] );
		
		if ( $this->db->trans_status() ) {
			
			// send assignment feedback email
			$this->Mod_teacher->send_assignment_feedback_email( $id );
			
			$this->db->trans_commit();
			$this->db->trans_complete();
			return TRUE;
		} else {
			$this->db->trans_rollback();
		}
		
		return FALSE;
	}
	
	public function get_assignmnets( $teacher_id )
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			
			$this->db->select( '*' );
//            $this->db->where( 'status', 1 );
			if ( $year ) {
				$this->db->where( 'year', $year );
			}
			if ( $session ) {
				$this->db->where( 'session', $session );
			}
			if ( $teacher_id ) {
				$this->db->where( 'teacher_id', $teacher_id );
			}
			
			if ( $module ) {
				$this->db->where( 'module', $module );
			}
			
			if ( $unit ) {
				$this->db->where( 'unit', $unit );
			}
			
			$this->db->order_by( 'sent', 'DESC' );
			$query = $this->db->get( 'assignments A' );
			
			if ( $query->num_rows() > 0 ) {
				return $query->result();
			} else {
				$this->session->set_flashdata( 'flashError', 'Nothing Found..' );
			}
		}
		
		return FALSE;
	}
	
	public function send_assignment_emails()
	{
		$module     = $this->input->post( 'module', TRUE );
		$unit       = $this->input->post( 'unit', TRUE );
		$teacher_id = $this->input->post( 'teacher_id', TRUE );
		$doc_ids    = $this->input->post( 'doc_id', TRUE );
		
		$teacher_name = get_name_by_id( 'sif_teacher', $teacher_id, 'teacher_id', 'tec_name' );
		
		if ( $doc_ids ) {
			$query = $this->db->select( 'email' )->where_in( 'id', $doc_ids )->get( 'sif_admission' );
			
			if ( $query->num_rows() > 0 ) {
				$results     = $query->result_array();
				$emails      = array_column( $results, 'email' );
				$module_name = get_name_by_id( 'modules', $module, 'id', 'name' );
				$unit_name   = get_name_by_id( 'module_units', $unit, 'id', 'name' );
				
				$company = $this->data['company'];
				$data    = [
					'module_name'  => $module_name,
					'unit_name'    => $unit_name,
					'teacher_name' => $teacher_name,
					'title'        => $this->input->post( 'subject', TRUE ),
					'desc'         => $this->input->post( 'desc', TRUE ),
					'company'      => $company,
				];
				
				$subject = "{$company->name} - Assignment sent by {$teacher_name}";
				$msg     = $this->load->view( 'emails/assignment-sent', $data, TRUE );

                return $this->Mod_email->SendGmailEmail($emails, $subject, $msg);
				
				
			}
		}
		
		return FALSE;
	}
	
	
	public function send_assignment_feedback_email()
	{
		$assignment_id = $this->input->post( 'assignment_id', TRUE );
		if ( $assignment_id ) {
			$assignment = $this->Mod_student->getAssignment( $assignment_id );
			$desc       = $this->input->post( 'desc', TRUE );
			
			$teacher_name = get_name_by_id( 'sif_teacher', $assignment->teacher_id, 'teacher_id', 'tec_name' );
			
			$module_name = get_name_by_id( 'modules', $assignment->module, 'id', 'name' );
			$unit_name   = get_name_by_id( 'module_units', $assignment->unit, 'id', 'name' );
			$unit_code   = get_name_by_id( 'module_units', $assignment->unit, 'id', 'code' );
			
			$email = get_name_by_id( 'sif_admission', $assignment->doc_id, 'id', 'email' );
			
			$company = $this->data['company'];
			$data    = [
				'module_name'  => $module_name,
				'unit_name'    => $unit_name,
				'teacher_name' => $teacher_name,
				'desc'         => $desc,
				'company'      => $company,
			];
			$subject = "{$company->name} - {$unit_code} - Assignment feedback by {$teacher_name}";
			
			$msg = $this->load->view( 'emails/assignment-feedback', $data );

//			return $this->Mod_email->SendGmailEmail( $email, $subject, $msg );
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

        $this->db->where( "A.status", "1" );
        $this->db->group_by( 'A.id' );
        $this->db->join( 'assigned_teacher_doctors TD', 'A.id = TD.doc_id', 'LEFT' );
        $query = $this->db->get( 'sif_admission A' );
        return $query->num_rows();
    }

    function get_admission_list( $limit = 15, $row = 0, $tid = NULL )
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

        $this->db->where( "A.status", "1" );
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
	
}
