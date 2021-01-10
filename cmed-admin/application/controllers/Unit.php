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
 * @property mod_unit $mod_unit
 * @property common_lib $common_lib
 * @property Mod_setting $Mod_setting
 * @property Mod_teacher $Mod_teacher
 * @property Mod_exam $Mod_exam
 */
class Unit extends My_Controller
{

    private $record_per_page = 20;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Units";
        $this->load->library('pagination');
        $this->load->library('common_lib');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_common');
        $this->load->model('mod_unit');
        $this->load->model('Mod_teacher');

        $this->data['division_list'] = $this->Mod_common->get_division_list();
        $this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
        $this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
        $this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
        $this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */

        $this->data['year_array'] = $this->common_lib->get_year_array();
        $this->data['days_list'] = $this->common_lib->get_days_array();
//        $this->data['unit_type'] = $this->common_lib->get_unit_type_array();
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
        $this->data['module_list'] = $this->Mod_common->get_module_array();
        $this->data['teacher_auto_id'] = $this->Mod_teacher->get_auto_id($this->teacher_id);
        // $this->data['support_stuff_list'] = $this->Mod_common->get_executive_array(2);

        $this->data['breadcrumb'] = array($this->data['module_name']);
    }

    function index()
    {
        $this->data['form_action'] = 'add';
        array_push($this->data['breadcrumb'], 'Add Unit');
        $this->load->view('unit/view_add_unit', $this->data);
    }

    public function edit()
    {
        $id = $this->uri->segment(3);
        $this->data['form_action'] = 'edit';
        array_push($this->data['breadcrumb'], 'Edit Unit');
        $this->data['unit'] = $this->Mod_common->getUnitDetails($id);
        $this->data['attachments'] = $this->Mod_common->getUnitAttachments($id);

        $this->load->view('unit/view_add_unit', $this->data);
    }


    /**
     * Save Unit
     */
    function save()
    {
        $this->form_validation->set_rules('module_id', 'Module', 'required');
        $this->form_validation->set_rules('code', 'Code', 'required');
        $this->form_validation->set_rules('name', 'Unit Name', 'required');
        $this->form_validation->set_rules('duration', 'Duration', 'required');
//        $this->form_validation->set_rules('details', 'Details', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->data['form_action'] = 'add';
            array_push($this->data['breadcrumb'], 'Add Unit');
            $this->load->view('unit/view_add_unit', $this->data);
        } else {
            $res_flag = $this->mod_unit->save_data();
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Unit Saved Successfully!');
            } else {
                $this->session->set_flashdata('flashError', 'Sorry! Failed to save Information.');
            }
            redirect('unit/records');
        }
    }

    /**
     * Update Unit
     */
    function update()
    {
        $this->form_validation->set_rules('module_id', 'Module', 'required');
        $this->form_validation->set_rules('code', 'Code', 'required');
        $this->form_validation->set_rules('name', 'Unit Name', 'required');
        $this->form_validation->set_rules('duration', 'Duration', 'required');
//        $this->form_validation->set_rules('details', 'Details', 'required');
        if ($this->form_validation->run() == FALSE) {
            $id = $this->input->post('auto_id', TRUE);
            redirect("unit/edit/$id");
        } else {
            $res_flag = $this->mod_unit->update_data();
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Unit Updated Successfully!');
            } else {
                $this->session->set_flashdata('flashError', 'Sorry! Failed to Update Information.');
            }
            redirect('unit/records');
        }
    }

    function records()
    {
        array_push($this->data['breadcrumb'], 'Unit List');
        $this->data['rec'] = $this->mod_unit->get_records_list();
        $this->load->view('unit/view_unit_list', $this->data);
    }

    function details()
    {
        $id = $this->uri->segment(3);
        $this->data['unit'] = $this->Mod_common->getUnitDetails($id);
        $this->data['attachments'] = $this->Mod_common->getUnitAttachments($id);
        $this->load->view('doctor/view_unit_details', $this->data);
    }

    public function report()
    {
        if ($this->input->post()) {
            $return = $this->mod_unit->get_search_data();
            $this->data['rec'] = isset($return['results']) ? $return['results'] : '';
            $this->data['unit_name'] = $return['unit_name'];
            $this->load->view('unit/' . $return['view'], $this->data);
        } else {
            $this->load->view('unit/view_unit_report', $this->data);
        }
    }

    public function all_units()
    {
        array_push($this->data['breadcrumb'], 'Units');
        $this->data['units'] = $this->mod_unit->get_units_data();
        $this->load->view('unit/view_teacher_class_unit', $this->data);
    }

    public function room_units()
    {
        array_push($this->data['breadcrumb'], 'Room Units');
        if ($this->input->post()) {
            $units = $this->mod_unit->get_room_units();
        }
        $this->data['units'] = isset($units) ? $units : FALSE;
        $this->load->view('unit/view_room_unit', $this->data);
    }
}
