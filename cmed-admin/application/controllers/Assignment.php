<?php
/**
 * Created by PhpStorm.
 * User: Nahian
 * Date: 10/13/2017
 * Time: 11:56 PM
 * @property Mod_admission $Mod_admission
 * @property Mod_teacher $Mod_teacher
 */

class Assignment extends My_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->data['module_name'] = "Assignment";
        $this->data['breadcrumb'] = array($this->data['module_name']);
        $this->data['year_array'] = $this->common_lib->getYearList();
        $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
        $this->data['module_list'] = $this->Mod_setting->getModuleList();
        $this->data['unit_list'] = $this->Mod_setting->getUnitList();

        $this->load->model('Mod_admission');
        $this->load->model('Mod_teacher');
    }

    public function index()
    {
        $this->data['doctors_list'] = $this->Mod_admission->get_assigned_doc_list();
        $this->data['teacher_list'] = $this->Mod_teacher->getTeacherList();
        $this->load->view('assignments/view_assignment_list', $this->data);
    }
}