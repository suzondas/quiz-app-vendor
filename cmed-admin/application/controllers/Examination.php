<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of admsission
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property mod_unit    $mod_unit
 * @property Mod_payment $Mod_payment
 * @property Mod_common  $Mod_common
 * @property common_lib  $common_lib
 * @property Mod_exam    $Mod_exam
 * @property Mod_setting $Mod_setting
 */
class Examination extends My_Controller
{
	private $record_per_page  = 24;
	private $record_num_links = 5;
	
	public function __construct()
	{
		parent::__construct();
		
		if ( !$this->ion_auth->is_admin() || !$this->ion_auth->in_group( 3 ) ) {
			// redirect('dashboard');
		}
		
		$this->data['module_name'] = "Examination";
		$this->load->model( 'Mod_setting' );
		$this->load->model( 'Mod_exam' );
		$this->load->model( 'Mod_file_upload' );
		$this->load->model( 'mod_unit' );
		$this->load->model( 'Mod_common' );
		$this->load->library( 'pagination' );
		$this->load->helper( 'date' );
		$this->load->helper( 'utility' );
		
		$this->data['status_list']  = $this->common_lib->get_status_array();
		$this->data['n_year']       = $this->common_lib->getYearList();
		$this->data['session_list'] = $this->Mod_setting->get_session_list_array();
		$this->data['module_list']  = $this->Mod_setting->getModuleList();
		$this->data['unit_list']    = $this->Mod_setting->getUnitList();
		$this->data['msg']          = $this->Mod_setting->get_messages();
		
		$this->data['breadcrumb'] = array( $this->data['module_name'] );
	}
	
	public function index()
	{
		array_push( $this->data['breadcrumb'], 'Examination List' );
		
		$temp_record_postion = $this->input->get( 'per_page' );
		$row                 = $temp_record_postion ? $temp_record_postion : 0;
		
		$config                       = config_item( 'pagination' );
		$config['base_url']           = base_url( 'examination' );
		$config['total_rows']         = $this->Mod_exam->count_exam_records();
		$config['per_page']           = $this->record_per_page;
		$config['num_links']          = $this->record_num_links;
		$config['page_query_string']  = TRUE;
		$config['reuse_query_string'] = TRUE;
		$this->pagination->initialize( $config );
		
		$this->data['record_pos'] = $row;
		$this->data['total_rows'] = $config['total_rows'];
		$this->data['links']      = $this->pagination->create_links();
		//$this->data['exam_list'] = $this->Mod_exam->get_exam_list_array();
		$this->data['rec'] = $this->Mod_exam->get_exam_records( $this->record_per_page, $row );
		$this->load->view( 'examination/view_examination_list', $this->data );
	}
	
	public function add_exam( $id )
	{
		array_push( $this->data['breadcrumb'], 'Add Exam' );
		$this->data['msg']           = $this->Mod_setting->get_messages();
		$unit                        = $this->mod_unit->get_unit_details( $id );
		$this->data['unit']          = $unit;
		$this->data['question_list'] = $this->Mod_exam->get_question_list( $unit->module_id, $unit->id );
		$this->load->view( 'examination/view_add_exam', $this->data );
	}
	
	public function save_exam()
	{
		$this->form_validation->set_rules( 'module_id', 'Module', 'required|integer' );
		$this->form_validation->set_rules( 'unit_id', 'Unit', 'required|integer' );
		$this->form_validation->set_rules( 'name', 'Exam Name', 'required' );
		$this->form_validation->set_rules( 'year', 'Year', 'required|integer' );
		$this->form_validation->set_rules( 'session', 'session', 'required|integer' );
		$this->form_validation->set_rules( 'from_date_time', 'From Date', 'required' );
		$this->form_validation->set_rules( 'to_date_time', 'To Date', 'required' );
		$this->form_validation->set_rules( 'ques[]', 'Question', 'required' );
		if ( $this->form_validation->run() == FALSE ) {
			$id = $this->input->post( 'unit_id', TRUE );
			$this->add_exam( $id );
		} else {
			$this->load->model( 'Mod_exam' );
			$res_flag = $this->Mod_exam->save_exam_data();
			if ( !empty( $res_flag ) ) {
				$this->session->set_flashdata( 'flashOK', 'Exam Saved Successfully!' );
			} else {
				$this->session->set_flashdata( 'flashError', 'Sorry! Failed to save Information.' );
			}
			redirect( 'unit/records' );
		}
	}
	
	public function edit_exam( $id )
	{
		array_push( $this->data['breadcrumb'], 'Edit Exam' );
		$this->data['msg']  = $this->Mod_setting->get_messages();
		$exam               = $this->Mod_exam->get_exam_details( $id );
		$this->data['exam'] = $exam;
//		$this->data['unit'] = $this->mod_unit->get_unit_details( $id );
		$this->data['question_list'] = $this->Mod_exam->get_question_list( $exam->module_id, $exam->unit_id );
//		die( json_encode( $this->data['question_list'] ) );
		$this->load->view( 'examination/view_edit_exam', $this->data );
	}
	
	public function update_exam( $id = NULL )
	{
		$this->form_validation->set_rules( 'module_id', 'Module', 'required|integer' );
		$this->form_validation->set_rules( 'unit_id', 'Unit', 'required|integer' );
		$this->form_validation->set_rules( 'name', 'Exam Name', 'required' );
		$this->form_validation->set_rules( 'year', 'Year', 'required|integer' );
		$this->form_validation->set_rules( 'session', 'session', 'required|integer' );
		$this->form_validation->set_rules( 'from_date_time', 'From Date', 'required' );
		$this->form_validation->set_rules( 'to_date_time', 'To Date', 'required' );
		$this->form_validation->set_rules( 'ques[]', 'Question', 'required' );
		if ( $this->form_validation->run() == FALSE ) {
			$this->edit_exam( $id );
		} else {
			$this->load->model( 'Mod_exam' );
			$res_flag = $this->Mod_exam->update_exam_data( $id );
			if ( !empty( $res_flag ) ) {
				$this->session->set_flashdata( 'flashOK', 'Exam Updated Successfully!' );
			} else {
				$this->session->set_flashdata( 'flashError', 'Sorry! Failed to Update Information.' );
			}
			redirect( 'examination' );
		}
	}
	
	public function on_site_exam()
	{
		array_push( $this->data['breadcrumb'], 'On Site Exam' );
		$this->data['doc_list'] = $this->Mod_exam->get_onsite_exam_doc_list();
		$this->data['msg']      = $this->Mod_setting->get_messages();
		$this->load->config( 'exam' );
		$this->data['ec'] = $this->config->item( 'exam_config' );
		$this->load->view( 'examination/view_add_on_site_exam', $this->data );
	}
	
	public function save_on_site_exam()
	{
		$this->form_validation->set_rules( 'module', 'Module', 'required|integer' );
		$this->form_validation->set_rules( 'year', 'Year', 'required|integer' );
		$this->form_validation->set_rules( 'session', 'session', 'required|integer' );
		$this->form_validation->set_rules( 'mark[]', 'Mark', 'required' );
		if ( $this->form_validation->run() == FALSE ) {
			$this->on_site_exam();
		} else {
			$this->load->model( 'Mod_exam' );
			$res_flag = $this->Mod_exam->save_on_site_exam_data();
			if ( !empty( $res_flag ) ) {
				$this->session->set_flashdata( 'flashOK', 'On Site Exam Mark Saved Successfully!' );
			} else {
				$this->session->set_flashdata( 'flashError', 'Sorry! Failed to save Information.' );
			}
			redirect( 'examination/on_site_exam' );
		}
	}
	
	public function fellow_list( $exam_id )
	{
		if ( $exam_id ) {
			array_push( $this->data['breadcrumb'], 'Exam Fellow List' );
			$this->data['msg']        = $this->Mod_setting->get_messages();
			$this->data['rec']        = $this->Mod_exam->get_exam_doc_list( $exam_id );
			$this->data['total_rows'] = count( $this->data['rec'] );
//            die(json_encode($this->data['rec']));
			$this->load->view( 'examination/view_exam_fellow_list', $this->data );
		} else {
			show_404();
		}
	}
	
	public function change_time( $exam_id )
	{
		if ( $exam_id ) {
			$exam               = $this->Mod_common->get_row_data_by_id( 'exams', $exam_id );
			$this->data['msg']  = $this->Mod_setting->get_messages();
			$this->data['exam'] = $exam;
			if ( $this->input->post() ) {
				
				$this->form_validation->set_rules( 'from_date_time', 'From Date', 'required' );
				$this->form_validation->set_rules( 'to_date_time', 'To Date', 'required' );
				
				if ( $this->form_validation->run() == FALSE ) {
					$this->session->set_flashdata( 'flashError', validation_errors() );
					redirect( "examination/change_exam/$exam_id" );
				} else {
					$this->load->model( 'Mod_exam' );
					$res_flag = $this->Mod_exam->change_exam_datetime( $exam );
					if ( !empty( $res_flag ) ) {
						$this->session->set_flashdata( 'flashOK', 'Exam Date Time Changed!' );
					} else {
						$this->session->set_flashdata( 'flashError', 'Sorry! Failed to Change Date Time.' );
					}
					redirect( 'examination' );
				}
				
			} else {
				array_push( $this->data['breadcrumb'], 'Exam Fellow List' );
				$this->load->view( 'examination/view_change_time', $this->data );
			}
		} else {
			show_404();
		}
	}
	
	
}
