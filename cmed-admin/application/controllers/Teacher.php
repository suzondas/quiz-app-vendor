<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of teacher
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_common $Mod_common
 * @property Mod_teacher $Mod_teacher
 * @property common_lib $common_lib
 * @property Mod_email $Mod_email
 * @property Mod_student $Mod_student
 * @property Mod_admission $Mod_admission
 */
class Teacher extends My_Controller
{
	private $record_per_page = 24;
	private $record_num_links = 5;

//    private $data = '';

	public function __construct()
	{
		parent::__construct();

		$this->data['module_name'] = "Faculty";
		$this->load->library('pagination');
		$this->load->library('common_lib');
		$this->load->model('Mod_teacher');
		$this->load->model('Mod_setting');
		$this->load->model('Mod_student');
		$this->load->model('Mod_common');
		$this->load->model('Mod_admission');
		$this->load->model('Mod_file_upload');
		$this->load->model('Mod_email');
		$this->load->helper('string');
		$this->load->helper('utility');
		$this->data['ssc_exam_array'] = $this->common_lib->get_ssc_exam_array();
		$this->data['year_array'] = $this->common_lib->get_year_array();
		$this->data['group'] = $this->common_lib->get_group_array();
		$this->data['edu_board'] = $this->common_lib->edu_board();
		$this->data['hsc_exam_array'] = $this->common_lib->get_hsc_exam_array();
		$this->data['mbbs_exam_array'] = $this->common_lib->get_mbbs_exam_array();
		$this->data['fc_exam_array'] = $this->common_lib->get_fcps_exam_array();
		$this->data['md_exam_array'] = $this->common_lib->get_mdentrance_exam_array();
		$this->data['evaluate_value'] = $this->common_lib->evaluation_value();
		$this->data['blood_group'] = $this->common_lib->get_blood_group_array();
		$this->data['type_list'] = $this->common_lib->add_type();
		$this->data['faculty_type_list'] = $this->common_lib->faculty_type();
		$this->data['division_list'] = $this->Mod_common->get_division_list();
		$this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
		$this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
		$this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
		$this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */
		$this->data['current_fut_year'] = $this->common_lib->get_current_future_year();
		// $this->data[ 'course_list' ] = $this->Mod_teacher->get_course_list_array();
//        $this->data['faculty_list'] = $this->Mod_teacher->get_faculty_list_array();
		// $this->data[ 'subject_list' ] = $this->Mod_setting->get_subject_list_array();
		$this->data['collage_list'] = $this->Mod_setting->get_collage_list_array();
		$this->data['n_year'] = $this->common_lib->getYearList();
		$this->data['session_list'] = $this->Mod_setting->get_session_list_array();
		$this->data['module_list'] = $this->Mod_setting->getModuleList();
		$this->data['unit_list'] = $this->Mod_setting->getUnitList();
//        $this->data['status_array'] = $this->common_lib->get_status_array();
//        // $this->data[ 'subject_list' ] = $this->Mod_common->get_subject_list();
		// $this->data[ 'room_list' ] = $this->Mod_common->get_rooms_array();

		$this->data['teacher_list'] = $this->Mod_teacher->getTeacherList();
//        $this->data['doc_list'] = $this->Mod_admission->getDocList();
		$this->data['teacher_auto_id'] = $this->Mod_teacher->get_auto_id($this->teacher_id);
		//print_r($this->data['teacher_auto_id']);exit;
		$this->data['breadcrumb'] = array($this->data['module_name']);

		$this->data['company'] = $this->Mod_setting->get_general_info();
	}

	function index()
	{
		$this->data['form_action'] = "add";     //add new line
		array_push($this->data['breadcrumb'], 'Add Faculty');
		$this->load->view('teacher/view_add_teacher', $this->data);
	}

	/**
	 *
	 */
	function save()
	{

		$this->form_validation->set_rules('tec_name', 'Faculty Name', 'required');
		// $this->form_validation->set_rules('tec_type', 'Faculty Type', 'required');
		// $this->form_validation->set_rules('fath_name', 'Father Name', 'required');
		// $this->form_validation->set_rules('mother_name', 'Mother Name', 'required');
		// $this->form_validation->set_rules('dob', 'Date Of Birth', 'required');
		// $this->form_validation->set_rules('joining_date', 'Joining Date', 'required');
		// $this->form_validation->set_rules('gender', 'Gender', 'required');
		// $this->form_validation->set_rules('religion', 'Religion', 'required');
		$this->form_validation->set_rules('mobile', 'Mobile', 'required');
		$this->form_validation->set_rules('email', 'Email', 'required|is_unique[sif_teacher.email]');


		if ($this->form_validation->run() == FALSE) {
			$this->data['form_action'] = "add";     //add new line
			$this->load->view('teacher/view_add_teacher', $this->data);
		} else {
			$res_flag = $this->Mod_teacher->save_data();
			if ($res_flag['status']) {
				$this->session->set_flashdata('flashOK', 'Faculty Information saved successfully');
			} else {
				$this->session->set_flashdata('flashError', $res_flag['msg']);
			}
			redirect('teacher');
		}
	}

	function records()
	{
		array_push($this->data['breadcrumb'], 'Facultys List');
		$row = 0;
		$temp_record_postion = $this->uri->segment(3);

		if (!empty ($temp_record_postion)) {
			$row = $temp_record_postion;
		} else {
			$this->session->unset_userdata('sql_where_session');
		}

		$config = config_item('pagination');
		$config['base_url'] = current_url();
		$config['total_rows'] = $this->Mod_teacher->count_records();
		$config['per_page'] = $this->record_per_page;
		$config['num_links'] = $this->record_num_links;
		$this->pagination->initialize($config);

		$this->data['record_pos'] = $row;
		$this->data['total_rows'] = $config['total_rows'];
		$this->data['links'] = $this->pagination->create_links();

		$this->data['rec'] = $this->Mod_teacher->get_records_list($this->record_per_page, $row);
//        echo '<pre>';
//        print_r($this->data['rec']); exit;
		$this->load->view('teacher/view_teacher_list', $this->data);
	}

	public function doctors()
	{
		$this->data['doctors_list'] = $this->Mod_admission->get_unassigned_doc_list();
		$this->data['teacher_list'] = $this->Mod_teacher->getTeacherList();
		$this->load->view('teacher/view_teacher_doc_list', $this->data);
	}

	public function fellow_list()
	{
		$this->data['doctors_list'] = $this->Mod_admission->get_assigned_doc_list();
		$this->data['teacher_list'] = $this->Mod_teacher->getTeacherList();
		$this->load->view('teacher/view_assigned_doc_list', $this->data);
	}

	public function doc_list()
	{
		array_push($this->data['breadcrumb'], 'Fellow List');

		$temp_record_postion = $this->input->get('per_page');
		$row = $temp_record_postion ? $temp_record_postion : 0;

		$config = config_item('pagination'); // for bootstrap style
		$config['base_url'] = base_url("teacher/doc_list");
		$config['total_rows'] = $this->Mod_teacher->count_admmission_list($this->teacher_id);
		$config['per_page'] = $this->record_per_page;
		$config['num_links'] = $this->record_num_links;
		$config['page_query_string'] = TRUE;
		$config['reuse_query_string'] = TRUE;
		$this->pagination->initialize($config);

		$this->data['record_pos'] = $row;
		$this->data['total_rows'] = $config['total_rows'];
		$this->data['links'] = $this->pagination->create_links();

		$this->data['rec'] = $this->Mod_teacher->get_admission_list($this->record_per_page, $row, $this->teacher_id);
		//$this->data['rec'] = $this->Mod_admission->get_doctor_list();
		$this->load->view('admission/view_admission_list', $this->data);
	}

	function assign_doctors()
	{
		$this->form_validation->set_rules('year', 'Year', 'required');
		$this->form_validation->set_rules('session', 'Session', 'required');
		$this->form_validation->set_rules('module', 'Module', 'required');
		$this->form_validation->set_rules('unit', 'Unit', 'required');
		$this->form_validation->set_rules('teacher', 'Faculty', 'required');
		$this->form_validation->set_rules('doctors[]', 'Fellow', 'required');

		if ($this->form_validation->run()) {
			$status = $this->Mod_teacher->assign_doc();
			if ($status) {
				$this->session->set_flashdata('flashOK', 'Assigned Successfully!');
			}
		} else {
			$this->session->set_flashdata('flashError', validation_errors());
		}
		redirect('teacher/doctors');
	}

	function profile()
	{
		array_push($this->data['breadcrumb'], 'Profile');
		$teacher_id = $this->uri->segment(3);
		$get_details = $this->Mod_teacher->get_details($teacher_id);
		$this->data['res'] = $get_details;
		$this->data['edu_record'] = $this->Mod_teacher->get_education_record($teacher_id);
		$this->load->view('teacher/view_teacher_profile', $this->data);
	}


	function print_profile()
	{
		$teacher_id = $this->uri->segment(3);
		$get_details = $this->Mod_teacher->get_details($teacher_id);
		$this->data['record'] = $get_details;
		$this->data['edu_record'] = $this->Mod_teacher->get_education_record($teacher_id);
		$this->load->view('teacher/view_teacher_profile_print', $this->data);
	}

	public function schedule()
	{
		array_push($this->data['breadcrumb'], 'Schedule');
		$teacher_id = $this->uri->segment(3);
		$this->data['schedules'] = $this->Mod_teacher->get_schedules_data($teacher_id);
		$this->load->view('schedule/view_teacher_class_schedule', $this->data);
	}

	public function evaluation_result()
	{
		array_push($this->data['breadcrumb'], 'Evaluation');
		$schedule_id = $this->uri->segment(3);
		$this->data['schedule_id'] = $schedule_id;
		$this->data['t_eva_list'] = $this->common_lib->teacher_evalution_list();
		$this->data['evaluation_results'] = $this->Mod_teacher->get_evaluation_result($schedule_id);
		$this->load->view('schedule/view_evaluation_result', $this->data);
	}

	function doc_profile()
	{
		array_push($this->data['breadcrumb'], 'Fellow Profile');
		$profile_id = $this->uri->segment(3);
		$this->data['record'] = $this->Mod_admission->get_doctor_profile_info($profile_id);

		$this->data['edu_record'] = $this->Mod_admission->get_doctor_education_info($profile_id);
		$this->data['training'] = $this->Mod_admission->get_doctor_training_info($profile_id);
		$this->data['experience'] = $this->Mod_admission->get_doctor_experience_info($profile_id);
		//echo print_r($this->data['reference']);exit;
		$this->load->view('admission/view_doctor_profile', $this->data);
	}

	public function edit($teacher_id)
	{
		array_push($this->data['breadcrumb'], 'Fellow Profile Edit');
		$this->data['form_action'] = 'edit';
		$get_details = $this->Mod_teacher->get_details($teacher_id);
		$this->data['res'] = $get_details;
		$this->data['edu_record'] = $this->Mod_teacher->get_education_record($teacher_id);
		$this->load->view('teacher/view_add_teacher', $this->data);
	}

	public function update_teacher_info()
	{
		$this->form_validation->set_rules('tec_name', 'Faculty Name', 'required');
		// $this->form_validation->set_rules('tec_type', 'Faculty Type', 'required');
		// $this->form_validation->set_rules('fath_name', 'Father Name', 'required');
		// $this->form_validation->set_rules('mother_name', 'Mother Name', 'required');
		// $this->form_validation->set_rules('dob', 'Date Of Birth', 'required');
		// $this->form_validation->set_rules('joining_date', 'Joining Date', 'required');
		// $this->form_validation->set_rules('gender', 'Gender', 'required');
		// $this->form_validation->set_rules('religion', 'Religion', 'required');
		$this->form_validation->set_rules('mobile', 'Mobile', 'required');
//        $this->form_validation->set_rules('email', 'Email', 'required|is_unique[sif_teacher.email]');

		$auto_id = $this->input->post('auto_id');
		if ($this->form_validation->run() == FALSE) {
			$this->edit($auto_id);
		} else {
			$res_flag = $this->Mod_teacher->update_data($auto_id);
			if (!empty($res_flag)) {
				$this->session->set_flashdata('flashOK', 'Information Update successfully');
			} else {
				$this->session->set_flashdata('flashError', 'Failed to Update information');
			}
			redirect("teacher/profile/$auto_id");
		}
	}

	function assignments()
	{
		array_push($this->data['breadcrumb'], 'Assign');
		$id = $this->uri->segment(3);
		$teacher_id = $this->Mod_teacher->get_teacher_id($id);
		$this->data['doctors_list'] = $this->Mod_admission->get_assigned_doc_list($teacher_id);
		$this->data['assignments'] = $this->Mod_teacher->get_assignmnets($teacher_id);
//		die(json_encode($this->data['assignments']));
		$this->data['msg'] = $this->Mod_setting->get_messages();
		$this->load->view('teacher/view_assignments', $this->data);
//        $this->load->view( 'teacher/view_assigned_doc_list', $this->data );
	}

	function send_assignment()
	{
		array_push($this->data['breadcrumb'], 'Send Assignment');
		$id = $this->uri->segment(3);
		$this->data['doc'] = $this->Mod_admission->get_doctor_data($id);

		$this->data['unit_list'] = $this->Mod_setting->getUnitList($this->data['doc']->module);

		$this->load->view('teacher/view_send_assignment', $this->data);
	}

	public function save_doctors_assignment()
	{
		$this->form_validation->set_rules('teacher_id', 'Faculty ID', 'required');
		$this->form_validation->set_rules('doc_id', 'Fellow\'s ID', 'required');
		$this->form_validation->set_rules('module', 'Module', 'required');
		$this->form_validation->set_rules('unit', 'Unit', 'required');
		$this->form_validation->set_rules('subject', 'Subject', 'required');
		$this->form_validation->set_rules('desc', 'Details', 'required');

		$this->form_validation->set_rules('mark', 'Mark', 'required|numeric');
		$id = $this->input->post('doc_id');
		if ($this->form_validation->run() == FALSE) {
			redirect("teacher/send_assignment/$id");
		} else {
			$status = $this->Mod_teacher->check_fellows_assignment();
			if ($status) {
				$res_flag = $this->Mod_teacher->save_assignment();
				if ($res_flag) {
					$this->session->set_flashdata('flashOK', '<strong>Success!</strong> Assignment sent to fellow.');
				} else {
					$this->session->set_flashdata('flashError', '<strong>Error!</strong> Failed to Save information');
				}
			} else {
				$this->session->set_flashdata('flashWarning', '<strong>Warning!</strong> Assignment already sent to this fellow');
			}
		}
		redirect("teacher/doc_list/$this->teacher_id");
	}

	function send_assignment_fellows()
	{
		array_push($this->data['breadcrumb'], 'Send Assignment');
		$this->data['doctors_list'] = $this->Mod_student->get_teacher_doctor_list();
		$this->load->view('assignments/view_send_assignment_fellows', $this->data);
	}

	public function save_assignment_fellows()
	{
		$this->form_validation->set_rules('teacher_id', 'Faculty ID', 'required');
		$this->form_validation->set_rules('doc_id[]', 'Fellow\'s ID', 'required');
		$this->form_validation->set_rules('module', 'Module', 'required');
		$this->form_validation->set_rules('unit', 'Unit', 'required');
		$this->form_validation->set_rules('subject', 'Title', 'required');
		$this->form_validation->set_rules('desc', 'Details', 'required');
		$this->form_validation->set_rules('mark', 'Mark', 'required|numeric');

		if ($this->form_validation->run() == FALSE) {
			$this->session->set_flashdata('flashError', validation_errors());
		} else {
			$status = $this->Mod_teacher->check_fellows_assignment();
			if ($status) {
				$res_flag = $this->Mod_teacher->save_fellows_assignment($status);
				if ($res_flag) {
					$this->session->set_flashdata('flashOK', '<strong>Success!</strong> Assignment sent to fellows.');
				} else {
					$this->session->set_flashdata('flashError', '<strong>Error!</strong> Failed to Save information');
				}
			} else {
				$this->session->set_flashdata('flashWarning', '<strong>Warning!</strong> Assignment already sent to these fellows');
			}
		}
		redirect("teacher/send_assignment_fellows");
	}

	function assignment_replies()
	{
		$id = $this->uri->segment(3);
		$assignment = $this->Mod_student->getAssignment($id);
		$this->data['assignment'] = $assignment;
		$this->data['replies'] = $this->Mod_student->getAssignmentReplies($id);
		$this->load->view('assignments/view_doctor_assignments_replies', $this->data);
	}

	function view_assignment()
	{
//        $doc_id                      = $this->Mod_setting->getIdByMasterId( $id );
		$id = $this->uri->segment(3);
		$this->data['doc'] = $this->Mod_admission->get_doctor_data($id);
		$this->data['assignments'] = $this->Mod_student->getAssignments($id);
		$this->load->view('assignments/view_doctor_assignments', $this->data);
	}

	function assignment_details()
	{
		array_push($this->data['breadcrumb'], 'Feedback Assignment');
		$id = $this->uri->segment(3);
		$reply = $this->Mod_student->getAssignmentReply($id);
		$this->data['reply'] = $reply;
		$this->load->view('teacher/view_assignment_details', $this->data);
	}

	function assignment_feedback()
	{
		array_push($this->data['breadcrumb'], 'Feedback Assignment');
		$id = $this->uri->segment(3);
		$reply = $this->Mod_student->getAssignmentReply($id);
		$this->data['reply'] = $reply;
		$this->load->view('teacher/view_feedback_assignment', $this->data);
	}

	function save_assignment_feedback()
	{

		$id = $this->uri->segment(3);

		$this->form_validation->set_rules('desc', 'Feedback Details', 'required');
		$aid = $this->input->post('assignment_id', TRUE);
		if ($this->form_validation->run() == FALSE) {
			$this->session->set_flashdata('flashError', validation_errors());
		} else {
			$res_flag = $this->Mod_teacher->save_assignment_feedback($id);
			if (!empty($res_flag)) {
				$this->session->set_flashdata('flashOK', 'Feedback Sent successfully');
			} else {
				$this->session->set_flashdata('flashError', 'Failed to Save Feedback');
			}
		}
		redirect("teacher/assignment_replies/$aid");
	}

	function assignment_accept()
	{
		array_push($this->data['breadcrumb'], 'Accept Assignment');
		$id = $this->uri->segment(3);
		$assignment = $this->Mod_student->getAssignment($id);
		$this->data['assignment'] = $assignment;
		$this->load->view('teacher/view_accept_assignment', $this->data);
	}

	function save_accept_assignment()
	{
		$id = $this->input->post('assignment_id', TRUE);
		$this->form_validation->set_rules('teacher_id', 'Faculty ID', 'required');
		$this->form_validation->set_rules('doc_id', 'Fellow\'s ID', 'required');
		$this->form_validation->set_rules('mark_obtained', 'Mark Obtained', 'required|numeric');

		if ($this->form_validation->run() == FALSE) {
			$this->session->set_flashdata('flashError', validation_errors());
		} else {
			$where = [
				'id' => $id,
				'doc_id' => $this->input->post('doc_id', TRUE),
				'teacher_id' => $this->input->post('teacher_id', TRUE),
			];
			$obtained = $this->input->post('mark_obtained', TRUE);
			$mark = $this->input->post('mark', TRUE);
			if ($obtained <= $mark) {
				$percent = ($obtained / $mark) * 100;
				$res_flag = $this->db
					->where($where)
					->update('assignments', ['mark_obtained' => $obtained, 'mark_percentage' => number_format($percent, 2), 'status' => 'A']);

				if ($res_flag) {
					$this->session->set_flashdata('flashOK', 'Assignment Accepted!');
					redirect("teacher/assignment_replies/{$id}");
				} else {
					$this->session->set_flashdata('flashError', 'Failed to Save information');
				}
			} else {
				$this->session->set_flashdata('flashError', 'Obtained mark Cannot be greater then total marks.');
			}

			redirect("teacher/assignment_accept/{$id}");
		}
	}

	public function ajax_get_year_session_fellow_list()
	{
		if ($this->input->is_ajax_request()) {
			$year = $this->input->get('year');
			$session = $this->input->get('session');
			$options = '';

			$this->db->select('id, doc_name name');
			$year ? $this->db->where('year', $year) : NULL;
			$session ? $this->db->where('session', $session) : NULL;
			$this->db->where('status', 1);
			$query = $this->db->get('sif_admission');

			if ($query->num_rows() > 0) {
				$results = $query->result();

				foreach ($results as $result) {
					$options .= "<option value='{$result->id}'>{$result->name}</option>";
				}
			} else {
				$options = '<option value="0">Nothing Found.</option>';
			}

			echo $options;
		} else {
			show_404();
		}
	}


	public function reading_materials()
	{
		$this->load->model('Mod_page');
//        array_push( $this->data['breadcrumb'], "Reading Material List" );
		$temp_record_postion = $this->input->get('per_page');
		$row = $temp_record_postion ? $temp_record_postion : 0;

		$config = config_item('pagination');
		$config['base_url'] = site_url('teacher/reading_materials');
		$config['total_rows'] = $this->Mod_page->count_reading_materials();
		$config['per_page'] = $this->record_per_page;
		$config['num_links'] = $this->record_num_links;
		$config['page_query_string'] = TRUE;
		$config['reuse_query_string'] = TRUE;
		$this->pagination->initialize($config);
		$this->data['record_pos'] = $row;
		$this->data['total_rows'] = $config['total_rows'];
		$this->data['reading_material_types'] = $this->Mod_common->make_dropdown('reading_material_types', NULL, 'name', 'code');

		$this->data['links'] = $this->pagination->create_links();

		$get_list = $this->Mod_page->get_reading_materials_list($this->record_per_page, $row);
		$this->data['record'] = $get_list;
		$this->load->view('teacher/view_reading_materials', $this->data);
	}
}
