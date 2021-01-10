<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of teacher
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_common $Mod_common
 * @property Mod_schedule $Mod_schedule
 * @property common_lib $common_lib
 * @property Mod_setting $Mod_setting
 * @property Mod_teacher $Mod_teacher
 */
class Schedule extends My_Controller
{

    private $record_per_page = 20;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Master Schedule";
        $this->load->library('pagination');
        $this->load->library('common_lib');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_common');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_schedule');
        $this->load->model('Mod_teacher');

        $this->data['division_list'] = $this->Mod_common->get_division_list();
        $this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
        $this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
        $this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
        $this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */

        $this->data['year_array'] = $this->common_lib->get_year_array();
        $this->data['days_list'] = $this->common_lib->get_days_array();
        $this->data['schedule_type'] = $this->common_lib->get_schedule_type_array();
        $this->data['paper_list'] = $this->common_lib->get_paper_array();
        $this->data['current_fut_year'] = $this->common_lib->get_current_future_year();
        $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
        // $this->data[ 'course_list' ] = $this->Mod_setting->get_course_list_array();
        // $this->data[ 'faculty_list' ] = $this->Mod_setting->get_faculty_list_array();
        // $this->data['batch_list'] = $this->Mod_setting->get_batch_list_array();
        // $this->data[ 'subject_list' ] = $this->Mod_setting->get_subject_list_array();
        // $this->data[ 'service_package' ] = $this->Mod_setting->get_service_package_list_array();
        // $this->data['topic_list'] = $this->Mod_common->get_class_topic_list();
        // $this->data[ 'room_list' ] = $this->Mod_common->get_rooms_array();
        $this->data['teacher_list'] = $this->Mod_common->get_teachers_array();
        // $this->data[ 'executive_list' ] = $this->Mod_common->get_executive_array();
        // $this->data['support_stuff_list'] = $this->Mod_common->get_executive_array(2);

        $this->data['breadcrumb'] = array($this->data['module_name']);
    }

    function index()
    {
        $this->data['action'] = 'Add';
        array_push($this->data['breadcrumb'], 'Add Schedule');
        $this->load->view('schedule/view_add_schedule', $this->data);
    }

    public function edit()
    {
        $id = $this->uri->segment(3);
        $this->data['action'] = 'Edit';
        array_push($this->data['breadcrumb'], 'Edit Schedule');
        $this->data['schedule'] = $this->Mod_schedule->get_details($id);

        $this->load->view('schedule/view_add_schedule', $this->data);
    }


    /**
     * Save Schedule
     */
    function save()
    {
        $this->form_validation->set_rules('schedule_type', 'Schedule Type', 'required');
        $this->form_validation->set_rules('year', 'Year', 'required');
        $this->form_validation->set_rules('session', 'Session', 'required');
        $this->form_validation->set_rules('course_code', 'Course', 'required');
//        $this->form_validation->set_rules('faculty_code', 'Faculty', 'required');
        $this->form_validation->set_rules('batch_code', 'Batch/Subject', 'required');
//        $this->form_validation->set_rules('topic_id', 'Topic', 'required');
//        $this->form_validation->set_rules('service_pack_id', 'Service Package', 'required');
        $this->form_validation->set_rules('date', 'Date', 'required');
        $this->form_validation->set_rules('time_from', 'Time From', 'required');
        $this->form_validation->set_rules('time_to', 'Time To', 'required');
        $this->form_validation->set_rules('room_id', 'Room Name', 'required');
        $this->form_validation->set_rules('teacher_id', 'Faculty', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('schedule/view_add_schedule', $this->data);
        } else {
            $available = $this->Mod_schedule->check_schedule_availability();
            if ($available) {
                $res_flag = $this->Mod_schedule->save_data();
                if (!empty($res_flag)) {
                    $this->session->set_flashdata('flashOK', 'Information saved successfully');
                } else {
                    $this->session->set_flashdata('flashError', 'Failed to save information');
                }
            } else {
                $this->session->set_flashdata('flashError', 'The time slot you\'ve selected is not available.');
            }
            redirect('schedule');
        }
    }


    /**
     * Update Schedule
     */
    function update()
    {
        $id = $this->uri->segment(3);
        $this->form_validation->set_rules('schedule_type', 'Schedule Type', 'required');
        $this->form_validation->set_rules('year', 'Year', 'required');
        $this->form_validation->set_rules('session', 'Session', 'required');
        $this->form_validation->set_rules('course_code', 'Course', 'required');
//        $this->form_validation->set_rules('faculty_code', 'Faculty', 'required');
        $this->form_validation->set_rules('batch_code', 'Batch/Subject', 'required');
//        $this->form_validation->set_rules('topic_id', 'Topic', 'required');
//        $this->form_validation->set_rules('service_pack_id', 'Service Package', 'required');
        $this->form_validation->set_rules('date', 'Date', 'required');
        $this->form_validation->set_rules('time_from', 'Time From', 'required');
        $this->form_validation->set_rules('time_to', 'Time To', 'required');
        $this->form_validation->set_rules('room_id', 'Room Name', 'required');
        $this->form_validation->set_rules('teacher_id', 'Faculty', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->edit();
        } else {
            $available = $this->Mod_schedule->check_schedule_availability($id);
            if ($available) {
                $res_flag = $this->Mod_schedule->update_data($id);
                if (!empty($res_flag)) {
                    $this->session->set_flashdata('flashOK', 'Information Updated successfully');
                } else {
                    $this->session->set_flashdata('flashError', 'Failed to Update information');
                }
            } else {
                $this->session->set_flashdata('flashError', 'The time slot you\'ve selected is not available.');
            }
            redirect('schedule/all_schedules');
        }
    }

    function records()
    {
        array_push($this->data['breadcrumb'], 'Schedule List');
        $row = 0;
        $temp_record_postion = $this->uri->segment(3);

        if (!empty ($temp_record_postion)) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata('sql_where_session');
        }

        $config = $this->config->item('pagination');
        $config['base_url'] = base_url() . 'schedule/records';
        $config['total_rows'] = $this->Mod_schedule->count_records();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $this->pagination->initialize($config);

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_schedule->count_records();
        $this->data['links'] = $this->pagination->create_links();

        $this->data['rec'] = $this->Mod_schedule->get_records_list($this->record_per_page, $row);
        $this->load->view('schedule/view_schedule_list', $this->data);
    }

    public function report()
    {
        if ($this->input->post()) {
            $return = $this->Mod_schedule->get_search_data();
            $this->data['rec'] = isset($return['results']) ? $return['results'] : '';
            $this->data['schedule_name'] = $return['schedule_name'];
            $this->load->view('schedule/' . $return['view'], $this->data);
        } else {
            $this->load->view('schedule/view_schedule_report', $this->data);
        }
    }

    public function all_schedules()
    {
        array_push($this->data['breadcrumb'], 'Schedules');
        $this->data['schedules'] = $this->Mod_schedule->get_schedules_data();
        $this->load->view('schedule/view_teacher_class_schedule', $this->data);
    }

    public function room_schedules()
    {
        array_push($this->data['breadcrumb'], 'Room Schedules');
        if ($this->input->post()) {
            $schedules = $this->Mod_schedule->get_room_schedules();
        }
        $this->data['schedules'] = isset($schedules) ? $schedules : false;
        $this->load->view('schedule/view_room_schedule', $this->data);
    }
}