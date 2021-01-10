<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dashboard
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_admission $Mod_admission
 * @property Mod_notice $Mod_notice
 * @property Mod_common $Mod_common
 * @property common_lib $common_lib
 * @property Mod_teacher $Mod_teacher
 * @property Mod_email $Mod_email
 */
class Dashboard extends My_Controller
{
    private $record_per_page  = 50;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();
        $this->data['module_name'] = "Dashboard";
        $this->load->model('Mod_notice');
        $this->load->model('Mod_admission');
        $this->load->model('Mod_teacher');
        $this->load->model('Mod_common');
        $this->load->model('Mod_email');
        $this->load->model('Mod_student');
        $this->load->library('pagination');
        $this->load->library('user_agent');

        $this->data['teacher_auto_id'] = $this->Mod_teacher->get_auto_id($this->teacher_id);
        $this->data['breadcrumb']      = array($this->data['module_name']);
    }

    function index()
    {
        $this->data['notices'] = $this->Mod_notice->get_all_notice($this->data['teacher_auto_id']);
        $this->load->view('dashboard/view_admin_dashboard', $this->data);
    }

    public function fellow_login_log()
    {
        array_push($this->data['breadcrumb'], 'Fellow Login Attempts');

        $temp_record_postion = $this->input->get('per_page');
        $row                 = $temp_record_postion ? $temp_record_postion : 0;

        $config                       = config_item('pagination'); // for bootstrap style
        $config['base_url']           = current_url();
        $config['total_rows']         = $this->Mod_setting->count_fellow_login_attempts();
        $config['per_page']           = $this->record_per_page;
        $config['num_links']          = $this->record_num_links;
        $config['page_query_string']  = TRUE;
        $config['reuse_query_string'] = TRUE;
        $this->pagination->initialize($config);

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $config['total_rows'];
        $this->data['links']      = $this->pagination->create_links();

        $this->data['logs'] = $this->Mod_setting->get_fellow_login_attempts($this->record_per_page, $row);

        $this->load->view('dashboard/view_fellow_login_attempts', $this->data);
    }


    function course_details()
    {
        $current = $this->Mod_common->getCurrentModuleUnit();

        $current_mod = $this->Mod_student->get_current_status($current->doc_id);

        $this->data['current'] = $current_mod;
//		$this->data['doc'] = $this->Mod_student->get_details_doctor_addmission( $this->data['authUser']->user_name, $id );
        $this->data['current_module'] = $this->Mod_common->getDocModuleDetails($current->doc_id, $current->module);
//		die( json_encode( $this->data['current_module'] ) );
        $this->data['all_modules'] = $this->Mod_common->getDocModuleDetails($current->doc_id);
        $this->data['prev_module'] = $this->Mod_common->getDocModuleDetails(($current->module - 1));
        $this->load->view('doctor/view_course_details', $this->data);
    }
}
