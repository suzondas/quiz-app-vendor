<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of student
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_student $Mod_student
 * @property Mod_common $Mod_common
 * @property common_lib $common_lib
 */
class Student extends My_Controller{
    private $record_per_page = 20;
    private $record_num_links = 5;
//    private $data = '';
        
    public function __construct() {
        parent::__construct();
               
        $this->data['module_name']= "Admssion Form";
             
        $this->load->model('Mod_student');
        $this->load->model('Mod_common');
        $this->load->library('form_validation'); /* load validation library*/
        $this->load->library('pagination');/*  load pagination library */ 
        $this->load->library('common_lib');/*  load pagination library */ 
        
        $this->data['district_list'] = $this->common_lib->district_list();
        $this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
        $this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */
        $this->data['status_array'] = $this->common_lib->get_status_array();        
        $this->data['position_in_family_array'] = $this->common_lib->get_position_in_family_array(); /* get sex as array */
        $this->data['proficiency_in_english_array'] = $this->common_lib->get_proficiency_in_english_array(); /* get sex as array */
        $this->data['app_status_array'] = $this->common_lib->get_app_status_array();
        $this->data['year_array'] = $this->common_lib->get_year_array();
        
        $this->data['class_list'] = $this->Mod_common->get_class_list();
        $this->data['section_list'] = $this->Mod_common->get_section_list();
        $this->data['group_list'] = $this->Mod_common->get_group_list();
        $this->data['session_list'] = $this->Mod_common->get_session_list();
    }
    
    function index(){
        redirect('student/profile');     
    }
    
    
    function profile(){
        $sim_auto_id =  $this->uri->segment(3);
        
        $get_details =  $this->Mod_student->get_details($sim_auto_id);        
        $this->data['res'] = $get_details;
        
        $get_details_pre_schools =  $this->Mod_student->get_details_pre_schools($sim_auto_id);        
        $this->data['res_pre_schools'] = $get_details_pre_schools;
        
        $get_details_siblings =  $this->Mod_student->get_details_siblings($sim_auto_id);        
        $this->data['res_siblings'] = $get_details_siblings;
        
        $this->load->view('student/view_student_profile',$this->data);      
    }
    
}