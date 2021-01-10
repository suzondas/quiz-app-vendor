<?php

/**
 * Created by PhpStorm.
 * User: Bigm
 * Date: 16/11/16
 * Time: 4:27 PM
 * @property Mod_admission $Mod_admission
 * @property common_lib    $common_lib
 */
class Landing extends CI_Controller
{
	protected $data;
	
	public function __construct()
	{
		parent::__construct();
		$this->data['module_name'] = 'Landing Page';
		
		$this->load->model( 'Mod_setting' );
		$this->load->model( 'Mod_file_upload' );
		$this->load->model( 'Mod_admission' );
		$this->load->model( 'Mod_common' );
		$this->load->library( 'pagination' );
		$this->load->helper( 'date' );
//        $this->data['session_list'] = $this->Mod_common->get_session_list();
		$this->data['division_list']          = $this->Mod_common->get_division_list();
		$this->data['mai_district_list']      = $this->Mod_common->get_district_list_div();
		$this->data['mai_upazilla_list']      = $this->Mod_common->get_upazila_list_dist();
		$this->data['institute_list']         = $this->Mod_setting->get_institue_list_array();
		$this->data['collage_list']           = $this->Mod_setting->get_collage_list_array();
		$this->data['course_list']            = $this->Mod_setting->get_course_list_array();
		$this->data['faculty_list']           = $this->Mod_setting->get_faculty_list_array();
		$this->data['batch_list']             = $this->Mod_setting->get_batch_list_array();
		$this->data['batch_list_for_profile'] = $this->Mod_setting->get_batch_list_array_for_profile();
//        $this->data[ 'subject_list' ]           = $this->Mod_setting->get_subject_list_array();
		$this->data['session_list']     = $this->Mod_setting->get_session_list_array();
		$this->data['stu_type_list']    = $this->common_lib->get_student_type_list_array();
		$this->data['ssc_exam_array']   = $this->common_lib->get_ssc_exam_array();
		$this->data['hsc_exam_array']   = $this->common_lib->get_hsc_exam_array();
		$this->data['mbbs_exam_array']  = $this->common_lib->get_mbbs_exam_array();
		$this->data['fc_exam_array']    = $this->common_lib->get_fcps_exam_array();
		$this->data['md_exam_array']    = $this->common_lib->get_mdentrance_exam_array();
		$this->data['year_array']       = $this->common_lib->get_year_array();
		$this->data['current_fut_year'] = $this->common_lib->get_current_future_year();
		$this->data['hsc_result_array'] = $this->common_lib->get_ssc_hsc_result_array();
		$this->data['group']            = $this->common_lib->get_group_array();
		$this->data['blood_group']      = $this->common_lib->get_blood_group_array();
		$this->data['collage_type']     = $this->common_lib->get_collage_type_array();
//        $this->data[ 'answer_type' ]            = $this->Mod_setting->get_answer_type_array();
		$this->data['edu_board'] = $this->common_lib->edu_board();
		$this->data['admi_type'] = $this->common_lib->admission_type();
//        $this->data[ 'service_package' ]        = $this->Mod_setting->get_service_package_list_array();
		$this->data['sex_array']            = $this->common_lib->get_sex_array();
		$this->data['religion_array']       = $this->common_lib->get_religion_array();
		$this->data['marital_status_array'] = $this->common_lib->get_marital_status_array();
		
		$this->data['company'] = $this->Mod_setting->get_general_info();
	}
	
	public function index()
	{
		$this->data['title'] = "";
		$this->load->view( 'landing/view_landing', $this->data );
	}
	
	public function admission()
	{
		$this->data['title']       = "Admission Form";
		$this->data['form_action'] = "add";
		$this->load->view( 'landing/view_add_admission', $this->data );
	}
	
	function save()
	{
		$return_data = [ 'success' => FALSE, 'msg' => '', 'redirect' => NULL ];
		$this->form_validation->set_rules( 'year', 'year', 'trim|required' );
		$this->form_validation->set_rules( 'session', 'session', 'trim|required' );
		$this->form_validation->set_rules( 'doc_name', 'Fellow Name', 'trim|required' );
		$this->form_validation->set_rules( 'blood_gro', 'Blood Group', 'trim|required' );
		$this->form_validation->set_rules( 'father_name', 'Father Name', 'trim|required' );
		$this->form_validation->set_rules( 'mother_name', 'Mother Name', 'trim|required' );
		$this->form_validation->set_rules( 'n_id', 'National ID', 'trim|required|min_length[10]|max_length[17]' );
		
		$this->form_validation->set_rules( 'phone', 'phone No', 'trim|required|max_length[11]' );
		$this->form_validation->set_rules( 'email', 'Email', 'trim|required|valid_email|is_unique[sif_doc_master.user_name]' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$return_data['msg'] = validation_errors( '', '' );
		} else {
			
			$res_flag = $this->Mod_admission->save_file_data();
			
			if ( $res_flag['success'] ) {
				$this->session->set_userdata( 'reg_success', $res_flag );
				$return_data['success'] = TRUE;
				$return_data['reset']   = TRUE;
				$return_data['msg']     = "Your Application Submitted Successfully.";
				// $return_data[ 'redirect' ] = site_url( 'landing/success' );

//                redirect( 'landing/success' );
			} else {
				$return_data['msg'] = $res_flag['msg'];
//                $this->session->set_flashdata( 'flashError', $res_flag[ 'msg' ] );
//                redirect( 'landing/admission' );
			}
		}
		
		echo json_encode( $return_data );
	}
	
	function success()
	{
		$this->data['title'] = "Registration Success";
		$this->data['ret']   = $this->session->userdata( 'reg_success' );
		if ( $this->data['ret'] ) {
			$this->load->view( 'landing/view_reg_success', $this->data );
		} else {
			show_404();
		}
	}
	
	function ajax_get_faculty_by_course()
	{
		$course_id = $this->input->post( 'course_id' );
		$result    = $this->Mod_setting->get_faculty_by_course_id( $course_id );
		$options   = "<option value=''>Select</option>";
		if ( $result ) {
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->id . "'>{$res->faculty_name}</option>";
			}
		}
		
		echo $options;
	}
	
	function ajax_get_course_by_faculty_id()
	{
		$faculty_id = $this->input->post( 'faculty_id' );
		$course_id  = $this->input->post( 'course_id' );
		$result     = $this->Mod_setting->get_subject_by_faculty_id( $faculty_id, $course_id );
//        echo '<pre>';
//        print_r($result);
//        exit;
		$options = "<option value=''>Select</option>";
		if ( $result ) {
			
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->id . "'>{$res->subject}</option>";
			}
		}
		
		echo $options;
	}
	
	function get_district_by_division()
	{
		$division_id = $this->input->post( 'division_id' );
		
		$result  = $this->Mod_admission->get_district_by_division_val( $division_id );
		$options = "<option value=''>Select</option>";
		if ( $result ) {
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->DISTRICT_ID . "'>{$res->DISTRICT_NAME}</option>";
			}
		}
		echo $options;
	}
	
	function get_district_by_division2()
	{
		$division_id = $this->input->post( 'division_id2' );
		
		$result  = $this->Mod_admission->get_district_by_division_val2( $division_id );
		$options = "<option value=''>Select</option>";
		if ( $result ) {
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->DISTRICT_ID . "'>{$res->DISTRICT_NAME}</option>";
			}
		}
		echo $options;
		//echo json_encode($division_id);
	}
	
	function get_thana_by_district()
	{
		$district_id = $this->input->post( 'district_id' );
		
		$result  = $this->Mod_admission->get_thana_by_district_val( $district_id );
		$options = "<option value=''>Select</option>";
		if ( $result ) {
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->THANA_ID . "'>{$res->THANA_NAME}</option>";
			}
		}
		echo $options;
	}
	
	function get_thana_by_district2()
	{
		$district_id = $this->input->post( 'district_id2' );
		
		$result  = $this->Mod_admission->get_thana_by_district_val2( $district_id );
		$options = "<option value=''>Select</option>";
		if ( $result ) {
			foreach ( $result as $res ) {
				$options .= "<option value='" . $res->THANA_ID . "'>{$res->THANA_NAME}</option>";
			}
		}
		echo $options;
		//echo json_encode($district_id);
	}
	
	
	public function importDoctorInfo()
	{
		set_time_limit( 0 );
		echo "<pre>";
		$imp_datas = $this->db->select( 'reg_no,doc_name,mobile phone' )->get( 'import_doc' )->result_array();
		foreach ( $imp_datas as $i => $imp_data ) {
			$i++;
			if ( $imp_data['doc_name'] ) {
				if ( $this->db->insert( 'sif_admission', $imp_data ) ) {
					echo "$i) Data Imported Successfully of {$imp_data['doc_name']}! \r\n";
				} else {
					echo "$i) Data Import Error!";
				}
			}
		}
	}
	
	function ajax_check_reg()
	{
		$reg_no = $this->input->post( 'reg_no' );
		$year   = $this->input->post( 'year' );
		$reg_no = substr( $year, 2, 2 ) . $reg_no;
		$query  = $this->db->get_where( 'sif_admission', [ 'reg_no' => $reg_no ] );
		if ( $query->num_rows() == 0 ) {
			echo TRUE;
		} else {
			echo FALSE;
		}
	}
	
	function getUnitByModule()
	{
		$option = '<option value="">Select Unit</option>';
		if ( $this->input->post() ) {
			$module = $this->input->post( 'module', TRUE );
			
			$query = $this->db->select( [ 'id', 'CONCAT(code, " - ", name) as name' ] )->where( 'module_id', $module )->get( 'module_units' );
			if ( $query->num_rows() ) {
				foreach ( $query->result() as $item ) {
					$option .= '<option value="' . $item->id . '">' . $item->name . '</option>';
				}
			}
		}
		
		echo $option;
	}
	
}
