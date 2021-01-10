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
 * @property Mod_teacher $Mod_teacher
 * @property common_lib $common_lib
 */
class Visitor extends My_Controller
{

    private $record_per_page = 20;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Visitor";
        $this->load->library('pagination');
        $this->load->library('common_lib');
        $this->load->model('Mod_teacher');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_common');
        $this->load->model('Mod_admission');
        $this->load->model('Mod_visitor');

        $this->data['division_list'] = $this->Mod_common->get_division_list();
        $this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
        $this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
        $this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
        $this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */
        // $this->data[ 'course_list' ] = $this->Mod_teacher->get_course_list_array();
        // $this->data[ 'faculty_list' ] = $this->Mod_teacher->get_faculty_list_array();
        // $this->data[ 'subject_list' ] = $this->Mod_setting->get_subject_list_array();
        $this->data['status_array'] = $this->common_lib->get_status_array();
        $this->data['collage_list'] = $this->Mod_setting->get_collage_list_array();

        $this->data['breadcrumb'] = array($this->data['module_name']);
    }

    function index()
    {
        array_push($this->data['breadcrumb'], 'Add Visitor');
        $this->data['form_action'] = "add";
        $this->load->view('visitor/view_visitor', $this->data);
    }

    /**
     *
     */
    function save_visitor()
    {

        $this->form_validation->set_rules('name', 'Name', 'trim|required');
        
        $this->form_validation->set_rules('course', 'Course', 'trim|required');
        $this->form_validation->set_rules('mobile', 'mobile', 'trim|required');
        //$this->form_validation->set_rules('email', 'Email', 'trim|required');
        
        
        if ($this->form_validation->run() == FALSE) {
             $this->data['form_action'] = "add";
            $this->load->view('visitor/view_visitor', $this->data);
        } else {
            $res_flag = $this->Mod_visitor->save_data($this->authEmail);
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Information saved successfully');
            } else {
                $this->session->set_flashdata('flashError', 'Failed to save information');
            }
            redirect('visitor');
        }
    }
    function record()
    {
        array_push($this->data['breadcrumb'], 'Visitors List');
        $row = 0;
        $temp_record_postion = $this->uri->segment(3);

        if (!empty ($temp_record_postion)) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata('sql_where_session');
        }

        $config['base_url'] = base_url() . 'visitor/record';
        $config['total_rows'] = $this->Mod_visitor->count_records();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $config['full_tag_open'] = '<p>';
        $config['full_tag_close'] = '</p>';
        $this->pagination->initialize($config);

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_visitor->count_records();
        $this->data['links'] = $this->pagination->create_links();

        $this->data['rec'] = $this->Mod_visitor->get_records_list($this->record_per_page, $row);
        //echo '<pre>';
       // print_r($this->data['rec']); exit;
        $this->load->view('visitor/view_visitor_list', $this->data);
    }


    function edit()
    {
        array_push($this->data['breadcrumb'], 'Edit Visitor');
        $id = $this->uri->segment(3);
        $this->data['form_action'] = 'edit';
        $this->data['res'] = $this->Mod_visitor->get_details($id);
        //echo '<pre>';
        //print_r($this->data['res']); exit;
        $this->load->view('visitor/view_visitor', $this->data);
    }

    public function update_visitor(){
        $auto_id = $this->input->post('auto_id');

        $this->form_validation->set_rules('name', 'Name', 'trim|required');
       
        $this->form_validation->set_rules('course', 'Course', 'trim|required');
        $this->form_validation->set_rules('subject', 'subject', 'trim|required');
        $this->form_validation->set_rules('degree', 'Degree', 'trim|required');

        $this->form_validation->set_rules('mobile', 'mobile', 'trim|required');
        //$this->form_validation->set_rules('email', 'Email', 'trim|required');


        if ($this->form_validation->run() == FALSE) {
            $this->data['form_action'] = "add";
            $this->load->view('visitor/view_visitor', $this->data);
        } else {
            $res_flag = $this->Mod_visitor->update_data($this->authEmail,$auto_id);

            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Information update successfully');
            } else {
                $this->session->set_flashdata('flashError', 'Failed to update information');
            }
            redirect('visitor/record');
        }
    }
}