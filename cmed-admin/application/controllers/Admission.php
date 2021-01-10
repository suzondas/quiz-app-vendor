<?php

/**
 * Class Admission
 * @property Mod_setting     $Mod_setting
 * @property Mod_admission   $Mod_admission
 * @property Mod_common      $Mod_common
 * @property Mod_file_upload $Mod_file_upload
 * @property common_lib      $common_lib
 */
class Admission extends My_Controller
{
	
	private $record_per_page  = 30;
	private $record_num_links = 5;

//    private $data = '';
	
	public function __construct()
	{
		parent::__construct();
		
		if ( !$this->ion_auth->is_admin() ) {
			redirect( 'dashboard' );
		}
		
		$this->data['module_name'] = "Admssion";
		$this->load->model( 'Mod_setting' );
		$this->load->model( 'Mod_file_upload' );
		$this->load->model( 'Mod_admission' );
		$this->load->model( 'Mod_common' );
		$this->load->library( 'pagination' );
		$this->load->library( 'user_agent' );
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
		// $this->data[ 'subject_list' ]           = $this->Mod_setting->get_subject_list_array();
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
		// $this->data[ 'answer_type' ]            = $this->Mod_setting->get_answer_type_array();
		$this->data['edu_board']            = $this->common_lib->edu_board();
		$this->data['admi_type']            = $this->common_lib->admission_type();
		$this->data['sex_array']            = $this->common_lib->get_sex_array();
		$this->data['religion_array']       = $this->common_lib->get_religion_array();
		$this->data['marital_status_array'] = $this->common_lib->get_marital_status_array();
		$this->data['status_list']          = $this->common_lib->get_status_complete_array();
		// $this->data[ 'service_package' ]        = $this->Mod_setting->get_service_package_list_array();
		
		$this->data['breadcrumb'] = array( $this->data['module_name'] );
	}
	
	function index()
	{
		array_push( $this->data['breadcrumb'], 'Form' );
		$this->data['form_action'] = "add";
		$this->load->view( 'admission/view_add_admission', $this->data );
	}
	
	function save()
	{
		//$this->form_validation->set_rules('institute', 'Institute Name', 'trim|required');
		$this->form_validation->set_rules( 'year', 'year', 'trim|required' );
		//$this->form_validation->set_rules('course_code', 'Course', 'trim|required');
		//$this->form_validation->set_rules('faculty_code', 'Faculty', 'trim');
		//$this->form_validation->set_rules('batch_code', 'Batch', 'trim|required');
		//$this->form_validation->set_rules('subject', 'subject', 'trim|required');
		//$this->form_validation->set_rules('service_pack_id', 'service pack', 'trim|required');
		//$this->form_validation->set_rules('admi_type', 'Admission type', 'trim|required');
		$this->form_validation->set_rules( 'session', 'session', 'trim|required' );
		
		$this->form_validation->set_rules( 'doc_name', 'Fellow Name', 'trim|required' );
		$this->form_validation->set_rules( 'blood_gro', 'Blood Group', 'trim|required' );
		$this->form_validation->set_rules( 'father_name', 'Father Name', 'trim|required' );
		$this->form_validation->set_rules( 'mother_name', 'Mother Name', 'trim|required' );
		$this->form_validation->set_rules( 'n_id', 'National ID', 'trim|required' );
		
		$this->form_validation->set_rules( 'phone', 'phone No', 'trim|required|max_length[11]' );
		//$this->form_validation->set_rules('mail_address', 'Address', 'trim|required');
		//$this->form_validation->set_rules('phone', 'phone', 'trim|required');
		$this->form_validation->set_rules( 'email', 'Email', 'trim|required|valid_email' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->data['form_action'] = "add";
			$this->load->view( 'admission/view_add_admission', $this->data );
		} else {
			
			$res_flag = $this->Mod_admission->save_file_data();
			
			if ( $res_flag['success'] ) {
				$this->session->set_flashdata( 'flashOK', 'Data added successfully' );
			} else {
				$this->session->set_flashdata( 'flashError', $res_flag['msg'] );
			}
			redirect( 'admission' );
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
	
	public function doc_list_pdf()
	{
		$this->data['rec'] = $this->Mod_admission->get_admission_list();
		$pdf_data          = $this->load->view( 'admission/view_admission_list_pdf', $this->data, TRUE );
//		echo $pdf_data;
//		exit;
		$pdf = new Mpdf\Mpdf( [ 'format' => 'A4-L' ] );
		$pdf->WriteHTML( $pdf_data );
		$pdf->Output( 'doc-list-' . date( 'Y-m-d' ) . '.pdf', 'D' );
	}
	
	public function doc_emails()
	{
		$records = $this->Mod_admission->get_admission_list();
		if ( $records ) {
			foreach ( $records as $record ) {
				echo "{$record->email},";
			}
		}
	}
	
	
	function doc_list()
	{
		array_push( $this->data['breadcrumb'], 'Fellow List' );
		
		$temp_record_postion = $this->input->get( 'per_page' );
		$row                 = $temp_record_postion ? $temp_record_postion : 0;
		
		$config                       = config_item( 'pagination' ); // for bootstrap style
		$config['base_url']           = base_url( "admission/doc_list" );
		$config['total_rows']         = $this->Mod_admission->count_admmission_list();
		$config['per_page']           = $this->record_per_page;
		$config['num_links']          = $this->record_num_links;
		$config['page_query_string']  = TRUE;
		$config['reuse_query_string'] = TRUE;
		$this->pagination->initialize( $config );
		
		$this->data['record_pos'] = $row;
		$this->data['total_rows'] = $config['total_rows'];
		$this->data['links']      = $this->pagination->create_links();
		$this->data['pdf_url']    = site_url( "admission/doc_list_pdf" ) . '?' . http_build_query( array_merge( $_GET ) );
		$this->data['rec']        = $this->Mod_admission->get_admission_list( $this->record_per_page, $row );
		//$this->data['rec'] = $this->Mod_admission->get_doctor_list();
		$this->load->view( 'admission/view_admission_list', $this->data );
	}
	
	function doc_profile()
	{
		array_push( $this->data['breadcrumb'], 'Fellow Profile' );
		$profile_id           = $this->uri->segment( 3 );
		$this->data['record'] = $this->Mod_admission->get_doctor_profile_info( $profile_id );
		
		$this->data['edu_record'] = $this->Mod_admission->get_doctor_education_info( $profile_id );
		$this->data['training']   = $this->Mod_admission->get_doctor_training_info( $profile_id );
		$this->data['experience'] = $this->Mod_admission->get_doctor_experience_info( $profile_id );
		//echo print_r($this->data['reference']);exit;
		$this->load->view( 'admission/view_doctor_profile', $this->data );
	}
	
	public function approve()
	{
		$profile_id            = $this->uri->segment( 3 );
		$doc_id                = $this->Mod_admission->get_doctor_master_id( $profile_id );
		$user                  = $this->Mod_admission->get_doctor_master_info( $doc_id );
		$subject               = "Application Approved";
		$this->data['subject'] = $subject;
		$this->data['user']    = $user;
		$msg                   = $this->load->view( 'emails/approve', $this->data, TRUE );
		$this->load->model( 'Mod_email' );

        $flag = $this->Mod_email->SendGmailEmail($user->email, $subject, $msg);
//		$flag = TRUE;
		if ( $flag == TRUE ) {
			$status = [ 'status' => 1, 'updated_at' => database_formatted_date(), 'updated_by' => AUTH_EMAIL ];
			
			$current_month = date( 'm' );
			$session       = [ 'session' => 1 ];
			
			if ( $current_month > 5 && $current_month < 11 ) {
				$session = [ 'session' => 7 ];
			}
			
			// update admission table
			$this->db->update( 'sif_admission', $status + $session, [ 'id' => $profile_id ] );
			
			// update master table
			$this->db->update( 'sif_doc_master', $status, [ 'id' => $doc_id ] );
			$this->session->set_flashdata( 'flashOK', 'Application Approved. Username and Password sent to email.' );
		} else {
			$this->session->set_flashdata( 'flashError', $flag );
		}
		$redirect_url = $this->agent->referrer();
		redirect( $redirect_url );
	}
	
	public function completed()
	{
		$redirect_url = $this->agent->referrer();
		$profile_id   = $this->uri->segment( 3 );
		$doc_id       = $this->Mod_admission->get_doctor_master_id( $profile_id );
//		$user = $this->Mod_admission->get_doctor_master_info($doc_id);
//        $subject = "Application Approved";
//        $this->data['subject'] = $subject;
//        $this->data['user'] = $user;
//        $msg = $this->load->view( 'emails/approve', $this->data, TRUE );
//        $this->load->model( 'Mod_email' );
//
//        $flag = $this->Mod_email->SendGmailEmail( $user->email, $subject, $msg );
//
//        if ( $flag == TRUE ) {
		$status = [ 'status' => 2, 'updated_at' => database_formatted_date(), 'updated_by' => AUTH_EMAIL ];
		$this->db->update( 'sif_admission', $status, [ 'id' => $profile_id ] );
		$this->db->update( 'sif_doc_master', $status, [ 'id' => $doc_id ] );
		$this->session->set_flashdata( 'flashOK', 'Course Completed. The Applicant will not be able to login.' );
//        } else {
//            $this->session->set_flashdata( 'flashError', $flag );
//        }
		redirect( $redirect_url );
	}
	
	function outlier()
	{
		array_push( $this->data['breadcrumb'], 'Form OUTLIER' );
		$this->data['form_action'] = "add";
		$this->load->view( 'admission/view_add_outlier_admission', $this->data );
	}
	
	function save_outlier()
	{
		$this->form_validation->set_rules( 'institute', 'Institute Name', 'trim|required' );
		$this->form_validation->set_rules( 'year', 'year', 'trim|required' );
		$this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
		$this->form_validation->set_rules( 'faculty_code', 'Faculty', 'trim' );
		$this->form_validation->set_rules( 'batch_code', 'Batch', 'trim|required' );
		$this->form_validation->set_rules( 'subject', 'subject', 'trim|required' );
		$this->form_validation->set_rules( 'service_pack_id', 'service pack', 'trim|required' );
		$this->form_validation->set_rules( 'admi_type', 'Admission type', 'trim|required' );
		
		$this->form_validation->set_rules( 'session', 'session', 'trim|required' );
		$this->form_validation->set_rules( 'medical_col', 'Medical collage', 'trim|required' );
		
		$this->form_validation->set_rules( 'doc_name', 'Fellow Name', 'trim|required' );
		$this->form_validation->set_rules( 'blood_gro', 'Blood Group', 'trim|required' );
		$this->form_validation->set_rules( 'father_name', 'Father Name', 'trim|required' );
		$this->form_validation->set_rules( 'mother_name', 'Mother Name', 'trim|required' );
		$this->form_validation->set_rules( 'n_id', 'National ID', 'trim|required' );
		
		$this->form_validation->set_rules( 'phone', 'phone No', 'trim|required' );
		//$this->form_validation->set_rules('mail_address', 'Address', 'trim|required');
		//$this->form_validation->set_rules('phone', 'phone', 'trim|required');
		$this->form_validation->set_rules( 'email', 'Email', 'trim|required|valid_email' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->data['form_action'] = "add";
			$this->load->view( 'admission/view_add_outlier_admission', $this->data );
		} else {
			
			if ( $this->input->post( 'readmission' ) ) {
				
				$res_flag = $this->Mod_admission->readmission_outlier();
			} else {
				$res_flag = $this->Mod_admission->save_outlier_data();
			}
			if ( $res_flag['success'] ) {
				$this->session->set_flashdata( 'flashOK', 'Data added successfully' );
			} else {
				$this->session->set_flashdata( 'flashError', $res_flag['msg'] );
			}
			redirect( 'admission/outlier' );
		}
	}
	
	
	function print_profile()
	{
		$profile_id                 = $this->uri->segment( 3 );
		$this->data['record']       = $this->Mod_admission->get_doctor_profile_info( $profile_id );
		$this->data['edu_record']   = $this->Mod_admission->get_doctor_education_info( $profile_id );
		$this->data['reference']    = $this->Mod_admission->get_doctor_ref_info( $profile_id );
		$doctor_reg_no              = $this->data['record']->reg_no;
		$this->data['payment_info'] = $this->Mod_admission->get_payment_info_doctor( $doctor_reg_no );
		//echo print_r($this->data['reference']);exit;
		$this->load->view( 'admission/view_doctor_profile_print', $this->data );
	}
	
	
	public function institute_roll_no()
	{
		array_push( $this->data['breadcrumb'], 'Institute Roll No' );
		
		if ( $this->input->post() ) {
			$this->data['rec'] = $this->Mod_admission->get_admission_list_for_settiong_serarch();
		}
		$this->load->view( 'admission/view_admission_list_search', $this->data );
	}
	
	public function save_institute_roll_number()
	{
		$this->form_validation->set_rules( 'ids', 'ID', 'required' );
		
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->load->view( 'admission/view_admission_list_search', $this->data );
		} else {
			$res_flag = $this->Mod_admission->save_doc_ins_roll_no();
			if ( $res_flag['success'] ) {
				$this->session->set_flashdata( 'flashOK', 'Data Updated successfully!' );
			} else {
				$this->session->set_flashdata( 'flashError', $res_flag['msg'] );
			}
			redirect( 'admission/institute_roll_no' );
		}
	}
	
	public function delete_fellow( $id )
	{
		if ( $id ) {
			$query = $this->db->select( [ 'id', 'master_id' ] )->where( 'id', $id )->get( 'sif_admission' );
			
			if ( $query->num_rows() == 1 ) {
				$user = $query->row();
				
				$this->db->trans_start();
				$this->db->where( 'id', $id )->delete( 'sif_admission' );
				$this->db->where( 'id', $user->master_id )->delete( 'sif_doc_master' );
				
				if ( $this->db->trans_status() ) {
					$this->db->trans_commit();
					$this->session->set_flashdata( 'flashOK', 'Fellow deleted successfully!' );
				} else {
					$this->db->trans_rollback();
					$this->session->set_flashdata( 'flashError', 'Sorry! Cannot delete fellow.' );
				}
				redirect( $this->agent->referrer() );
			}
		}
		
		show_404();
	}
	
	public function edit( $admission_id )
	{
		$this->data['form_action'] = "edit";
//        $admission_id              = $this->uri->segment( 3 );
		$this->data['res']        = $this->Mod_admission->get_doctor_data( $admission_id );
		$this->data['edu_record'] = $this->Mod_admission->get_doctor_education_info( $admission_id );
		$this->data['reference']  = $this->Mod_admission->get_doctor_ref_info( $admission_id );
		array_push( $this->data['breadcrumb'], 'Edit Form GENESIS' );
		$this->load->view( 'admission/view_add_admission', $this->data );
	}
	
	public function reset_pass( $admission_id )
	{
		$user              = $this->Mod_admission->get_doctor_data( $admission_id );
		$this->data['res'] = $user;
		array_push( $this->data['breadcrumb'], 'Reset Password' );
		
		if ( !$this->input->post() ) {
			$this->load->view( 'admission/change_password', $this->data );
		} else {
			$this->form_validation->set_rules( 'master_id', 'Name', 'required' );
			$this->form_validation->set_rules( 'new', 'New Password', 'required|min_length[6]|matches[new_confirm]' );
			$this->form_validation->set_rules( 'new_confirm', 'Confirm Password', 'required' );
			if ( $this->form_validation->run() == FALSE ) {
				$this->load->view( 'admission/change_password', $this->data );
			} else {
				
				$this->load->model( 'Mod_student' );
				
				$status = $this->Mod_student->change_password();
				
				if ( $status ) {
					
					$this->data['user'] = $user;
					$subject            = "CMEDBD - Password Reset";
					$msg                = $this->load->view( 'emails/reset-password', $this->data, TRUE );
					$this->load->model( 'Mod_email' );

                    $flag = $this->Mod_email->SendGmailEmail($user->email, $subject, $msg);
					
					$this->session->set_flashdata( 'flashOK', 'Password Reset Successfully.' );
				} else {
					$this->session->set_flashdata( 'flashError', 'Cannot Reset the Password.' );
				}
				redirect( 'admission/doc_list' );
			}
		}
	}
	
	
	public function readmission()
	{
		$this->data['form_action'] = "readmission";
		$admission_id              = $this->uri->segment( 3 );
		$this->data['res']         = $this->Mod_admission->get_doctor_data( $admission_id );
		$this->data['edu_record']  = $this->Mod_admission->get_doctor_education_info( $admission_id );
		$this->data['reference']   = $this->Mod_admission->get_doctor_ref_info( $admission_id );
		//echo $this->data['res']->reg_type;exit;
		if ( $this->data['res']->reg_type == 'outlier' ) {
			array_push( $this->data['breadcrumb'], 'Readmission Form OUTLIER' );
			$this->load->view( 'admission/view_add_outlier_admission', $this->data );
		} else {
			array_push( $this->data['breadcrumb'], 'Readmission Form GENESIS' );
			$this->load->view( 'admission/view_add_admission', $this->data );
		}
	}
	
	
	public function update_admission()
	{
		$auto_id              = $this->input->post( 'auto_id', TRUE );
		$master_table_auto_id = $this->input->post( 'master_table_auto_id', TRUE );
		
		$this->form_validation->set_rules( 'year', 'year', 'trim|required' );
		$this->form_validation->set_rules( 'session', 'session', 'trim|required' );
		$this->form_validation->set_rules( 'doc_name', 'Fellow Name', 'trim|required' );
		$this->form_validation->set_rules( 'blood_gro', 'Blood Group', 'trim|required' );
		$this->form_validation->set_rules( 'father_name', 'Father Name', 'trim|required' );
		$this->form_validation->set_rules( 'mother_name', 'Mother Name', 'trim|required' );
		$this->form_validation->set_rules( 'n_id', 'National ID', 'trim|required|min_length[10]|max_length[17]' );
		
		$this->form_validation->set_rules( 'phone', 'phone No', 'trim|required|max_length[11]' );
		$this->form_validation->set_rules( 'email', 'Email', 'trim|required|valid_email' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->edit( $auto_id );
		} else {
			
			$res_flag = $this->Mod_admission->update_admission_data( $auto_id, $master_table_auto_id );
			
			if ( $res_flag['success'] ) {
				$this->session->set_flashdata( 'flashOK', 'Data update successfully' );
			} else {
				$this->session->set_flashdata( 'flashError', $res_flag['msg'] );
			}
			redirect( 'admission/doc_list' );
		}
	}
	
	
	public function update_outlier()
	{
		
		$auto_id              = $this->input->post( 'auto_id', TRUE );
		$master_table_auto_id = $this->input->post( 'master_table_auto_id', TRUE );
		
		$this->form_validation->set_rules( 'institute', 'Institute Name', 'trim|required' );
		$this->form_validation->set_rules( 'year', 'year', 'trim|required' );
		$this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
		$this->form_validation->set_rules( 'faculty_code', 'Faculty', 'trim' );
		$this->form_validation->set_rules( 'batch_code', 'Batch', 'trim|required' );
		$this->form_validation->set_rules( 'subject', 'subject', 'trim|required' );
		$this->form_validation->set_rules( 'service_pack_id', 'service pack', 'trim|required' );
		$this->form_validation->set_rules( 'admi_type', 'Admission type', 'trim|required' );
		
		$this->form_validation->set_rules( 'session', 'session', 'trim|required' );
		$this->form_validation->set_rules( 'medical_col', 'Medical collage', 'trim|required' );
		
		$this->form_validation->set_rules( 'doc_name', 'Fellow Name', 'trim|required' );
		$this->form_validation->set_rules( 'blood_gro', 'Blood Group', 'trim|required' );
		$this->form_validation->set_rules( 'father_name', 'Father Name', 'trim|required' );
		$this->form_validation->set_rules( 'mother_name', 'Mother Name', 'trim|required' );
		$this->form_validation->set_rules( 'n_id', 'National ID', 'trim|required' );
		
		$this->form_validation->set_rules( 'phone', 'phone No', 'trim|required' );
		//$this->form_validation->set_rules('mail_address', 'Address', 'trim|required');
		//$this->form_validation->set_rules('phone', 'phone', 'trim|required');
		$this->form_validation->set_rules( 'email', 'Email', 'trim|required|valid_email' );
		
		if ( $this->form_validation->run() == FALSE ) {
			$this->data['form_action'] = "add";
			$this->load->view( 'admission/view_add_outlier_admission', $this->data );
		} else {
			
			$res_flag = $this->Mod_admission->update_outlier_data( $auto_id, $master_table_auto_id );
			
			if ( $res_flag['success'] ) {
				$this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
			} else {
				$this->session->set_flashdata( 'flashError', $res_flag['msg'] );
			}
			redirect( 'admission/doc_list' );
		}
	}
	
	
}
