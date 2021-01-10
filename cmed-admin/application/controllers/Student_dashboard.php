<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dashboard
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_auth_student $Mod_auth_student
 * @property Mod_payment      $Mod_payment
 * @property Mod_common       $Mod_common
 * @property common_lib       $common_lib
 * @property Mod_notice       $Mod_notice
 * @property Mod_routine      $Mod_routine
 * @property Mod_student      $Mod_student
 */
class Student_Dashboard extends CI_Controller
{
	public $data, $authEmail, $id, $authUser;
	private                        $record_per_page  = 20;
	private                        $record_num_links = 5;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->data['module_name'] = "Fellow Panel";
		
		if ( $this->session->userdata( 'login_type' ) == 'P' ) {
			$this->data['module_name'] = "Parent Panel";
		}
		
		$this->load->model( 'Mod_auth_student' );
		
		if ( $this->session->userdata( 'logged_in' ) == FALSE ) {
			redirect( 'doctor_login' );
		}
		$this->data['authUser'] = $this->Mod_auth_student->get_auth_student_info();
		$this->authUser         = $this->data['authUser'];
		//print_r($this->data['authUser']->user_name);exit;
		$this->authEmail = $this->data['authUser']->email;
		$this->id        = $this->data['authUser']->id;
		
		$this->load->model( 'Mod_student' );
		$this->load->model( 'Mod_setting' );
		$this->load->model( 'Mod_admission' );
		// $this->load->model('Mod_payment');
		$this->load->model( 'Mod_notice' );
		$this->load->model( 'Mod_common' );
		$this->load->helper( 'utility' );
//        //$this->load->model('Mod_routine');
		$this->load->library( 'form_validation' ); /* load validation library*/
		$this->load->library( 'pagination' );/*  load pagination library */
		$this->load->library( 'common_lib' );/*  load pagination library */
		
		$this->data['company'] = $this->Mod_setting->get_general_info();
		
		$this->data['district_list']                = $this->common_lib->district_list();
		$this->data['sex_array']                    = $this->common_lib->get_sex_array(); /* get sex as array */
		$this->data['religion_array']               = $this->common_lib->get_religion_array(); /* get Religion as array */
		$this->data['status_array']                 = $this->common_lib->get_status_array();
		$this->data['position_in_family_array']     = $this->common_lib->get_position_in_family_array(); /* get sex as array */
		$this->data['proficiency_in_english_array'] = $this->common_lib->get_proficiency_in_english_array(); /* get sex as array */
		$this->data['app_status_array']             = $this->common_lib->get_app_status_array();
		$this->data['year_array']                   = $this->common_lib->get_year_array();
		/**************************/
		// $this->data[ 'room_list' ] = $this->Mod_common->get_rooms_array();
		$this->data['teacher_list']   = $this->Mod_common->get_teachers_array();
		$this->data['institute_list'] = $this->Mod_setting->get_institue_list_array();
		$this->data['session_list']   = $this->Mod_setting->get_session_list_array();
		// $this->data[ 'course_list' ] = $this->Mod_setting->get_course_list_array();
		// $this->data[ 'faculty_list' ] = $this->Mod_setting->get_faculty_list_array();
		// $this->data['batch_list'] = $this->Mod_setting->get_batch_list_array();
		$this->data['batch_list_for_profile'] = $this->Mod_setting->get_batch_list_array_for_profile();
		// $this->data[ 'subject_list' ] = $this->Mod_setting->get_subject_list_array();
		// $this->data[ 'service_package' ] = $this->Mod_setting->get_service_package_list_array();
		$this->data['collage_list']      = $this->Mod_setting->get_collage_list_array();
		$this->data['blood_group']       = $this->common_lib->get_blood_group_array();
		$this->data['evaluate_value']    = $this->common_lib->evaluation_value();
		$this->data['division_list']     = $this->Mod_common->get_division_list();
		$this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
		$this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
		$this->data['module_list']       = $this->Mod_setting->getModuleList();
		$this->data['unit_list']         = $this->Mod_setting->getUnitList();
		
		$get_details = $this->Mod_student->get_details( $this->data['authUser']->id );
		
		$current = $this->Mod_student->get_current_status( $get_details->id );
		
		$this->data['current'] = $current;
		$this->data['msg']     = $this->Mod_setting->get_messages();
		
		$this->data['res'] = $get_details;
	}
	
	function index()
	{
		$doc                   = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $this->data['authUser']->id );
		$this->data['notices'] = $this->Mod_student->get_all_notice( $doc->id );
		$this->load->view( 'dashboard/view_doctor_dashboard', $this->data );
	}
	
	function profile()
	{
		$sim_auto_id = $this->uri->segment( 3 );
		
		$get_details_doctor       = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $sim_auto_id );
		$this->data['record']     = $get_details_doctor;
		$this->data['edu_record'] = $this->Mod_admission->get_doctor_education_info( $this->data['record']->id );
		$this->data['training']   = $this->Mod_admission->get_doctor_training_info( $this->data['record']->id );
		$this->data['experience'] = $this->Mod_admission->get_doctor_experience_info( $this->data['record']->id );
		//print_r($this->data['reference']);exit;
		
		$this->load->view( 'admission/view_doctor_profile', $this->data );
	}
	
	public function change_password()
	{
		if ( !$this->input->post() ) {
			$this->load->view( 'doctor/change_password', $this->data );
		} else {
			$this->form_validation->set_rules( 'old', 'Old Password', 'required' );
			$this->form_validation->set_rules( 'new', 'New Password', 'required|min_length[6]|matches[new_confirm]' );
			$this->form_validation->set_rules( 'new_confirm', 'Confirm Password', 'required' );
			if ( $this->form_validation->run() == FALSE ) {
				$this->load->view( 'doctor/change_password', $this->data );
			} else {
				
				$old = $this->input->post( 'old', TRUE );
				
				if ( $this->data['authUser']->password === $old ) {
					$status = $this->Mod_student->change_password( $this->id );
					
					if ( $status ) {
						$this->session->set_flashdata( 'flashOK', 'Password Changed. Please Logout and Login Again.' );
					} else {
						$this->session->set_flashdata( 'flashError', 'Cannot Change the Password.' );
					}
				} else {
					$this->session->set_flashdata( 'flashError', 'Old Password Doesn\'t Match' );
				}
				redirect( 'student_dashboard/change_password' );
			}
		}
	}
	
	
	public function show_routine()
	{
		
		$this->data['doctor_detail']         = $this->Mod_student->get_doctor_detail_for_routine( $this->data['authUser']->user_name );
		$routine_detail                      = $this->data['doctor_detail'];
		$this->data['doctor_detail_routine'] = $this->Mod_student->get_doctor_routine( $routine_detail );
		
		
		$this->load->view( 'routine/view_doctor_class_routine', $this->data );
		
	}
	
	public function evaluation()
	{
		$this->data['schedule_table_id'] = $this->uri->segment( 3 );
		
		$this->load->view( 'evaluation/view_teacher_evaluation', $this->data );
	}
	
	public function save_evaluation()
	{
		
		$schedule_id = $this->input->post( 'schedule_id' );
		
		$result_flag = $this->Mod_student->evaluation_data( $this->data['authUser']->user_name, $schedule_id );
		if ( !empty( $result_flag ) ) {
			$this->session->set_flashdata( 'flashOK', 'Your Evaluation Completed successfully!' );
		} else {
			$this->session->set_flashdata( 'flashError', 'Failed to Evaluation teacher' );
		}
		redirect( 'student_dashboard/evaluation' );
		// }
	}
	
	function assignments()
	{
		$id                        = $this->uri->segment( 3 );
		$doc_id                    = $this->Mod_setting->getIdByMasterId( $id );
		$this->data['assignments'] = $this->Mod_student->getAssignments( $doc_id );
		$this->load->view( 'assignments/view_doctor_assignments', $this->data );
	}
	
	function assignment_replies()
	{
		$id                       = $this->uri->segment( 3 );
		$assignment               = $this->Mod_student->getAssignment( $id );
		$this->data['assignment'] = $assignment;
		$this->data['resends']    = $this->Mod_student->getAssignmentResends( $id );
		$this->data['replies']    = $this->Mod_student->getAssignmentReplies( $id );
		$this->load->view( 'assignments/view_doctor_assignments_replies', $this->data );
	}
	
	function assignment_details()
	{
		$id                  = $this->uri->segment( 3 );
		$reply               = $this->Mod_student->getAssignmentReply( $id );
		$this->data['reply'] = $reply;
		$this->load->view( 'teacher/view_assignment_details', $this->data );
	}
	
	function assignment_reply()
	{
		$id                       = $this->uri->segment( 3 );
		$this->data['assignment'] = $this->Mod_student->getAssignment( $id );
		$this->load->view( 'assignments/view_reply_assignment', $this->data );
	}
	
	function save_reply_assignment()
	{
		$id = $this->uri->segment( 3 );
		$this->form_validation->set_rules( 'title', 'Title', 'required' );
//        $this->form_validation->set_rules( 'desc', 'Details', 'required' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->data['msg']        = $this->Mod_setting->get_messages();
			$this->data['assignment'] = $this->Mod_student->getAssignment( $id );
			$this->load->view( 'assignments/view_reply_assignment', $this->data );
		} else {
			$res_flag = $this->Mod_student->save_reply_assignment( $id );
			if ( $res_flag ) {
				$this->session->set_flashdata( 'flashOK', 'Replied successfully' );
			} else {
				$this->session->set_flashdata( 'flashError', 'Failed to Reply!' );
			}
			redirect( "student_dashboard/assignments/{$this->id}" );
		}
	}
	
	function course_details()
	{
		$id                           = $this->uri->segment( 3 );
		$this->data['doc']            = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $id );
		$this->data['current_module'] = $this->Mod_common->getDocModuleDetails( $this->data['doc']->id, $this->data['doc']->module );
		$this->data['all_modules']    = $this->Mod_common->getDocModuleDetails( $this->data['doc']->id );
//        $this->data['prev_module'] = $this->Mod_common->getDocModuleDetails( ($this->data['doc']->module - 1) );
		$this->load->view( 'doctor/view_course_details', $this->data );
	}
	
	function exams()
	{
		$id                  = $this->uri->segment( 3 );
		$this->data['doc']   = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $id );
		$this->data['exams'] = $this->Mod_student->get_student_exams( $this->data['doc'] );
		$this->load->view( 'doctor/view_exams', $this->data );
	}
	
	function unit()
	{
		$id                        = $this->uri->segment( 3 );
		$this->data['unit']        = $this->Mod_common->getUnitDetails( $id );
		$this->data['attachments'] = $this->Mod_common->getUnitAttachments( $id );
		$this->load->view( 'doctor/view_unit_details', $this->data );
	}
	
	
	public function result()
	{
		$id                    = $this->uri->segment( 3 );
		$this->data['doc']     = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $id );
		$this->data['results'] = $this->Mod_student->get_student_result( $this->data['doc'] );
		$this->load->view( 'doctor/view_result', $this->data );
	}
	
	public function notice_details()
	{
		$id                   = $this->uri->segment( 3 );
		$this->data['notice'] = $this->Mod_notice->get_std_notice( $id );
		$this->load->view( 'notice/view_notice_details', $this->data );
	}
	
	public function reading_materials()
	{
		$this->load->model( 'Mod_page' );
//        array_push( $this->data['breadcrumb'], "Reading Material List" );
		$temp_record_postion = $this->input->get( 'per_page' );
		$row                 = $temp_record_postion ? $temp_record_postion : 0;
		
		$config                       = config_item( 'pagination' );
		$config['base_url']           = site_url( 'student_dashboard/reading_materials' );
		$config['total_rows']         = $this->Mod_page->count_reading_materials();
		$config['per_page']           = $this->record_per_page;
		$config['num_links']          = $this->record_num_links;
		$config['page_query_string']  = TRUE;
		$config['reuse_query_string'] = TRUE;
		$this->pagination->initialize( $config );
		$this->data['record_pos']             = $row;
		$this->data['total_rows']             = $config['total_rows'];
		$this->data['reading_material_types'] = $this->Mod_common->make_dropdown( 'reading_material_types', NULL, 'name', 'code' );
		
		$this->data['links'] = $this->pagination->create_links();
		
		$get_list             = $this->Mod_page->get_reading_materials_list( $this->record_per_page, $row );
		$this->data['record'] = $get_list;
		$this->load->view( 'doctor/view_reading_materials', $this->data );
	}
}
