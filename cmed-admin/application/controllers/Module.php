<?php
/**
 * Created by PhpStorm.
 * User: Nahian
 * Date: 10/13/2017
 * Time: 11:05 PM
 * @property Mod_module $Mod_module
 * @property common_lib $common_lib
 */

class Module extends My_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Module";
        $this->data['breadcrumb'] = array($this->data['module_name']);

        $this->load->model( 'Mod_module' );
        $this->load->library( 'form_validation' );
    }

    public function index()
    {
        array_push( $this->data['breadcrumb'], 'Add Module' );
        $this->data['form_action'] = 'add';
        $this->load->view( 'modules/view_add_module', $this->data );
    }

    public function records()
    {
        array_push( $this->data['breadcrumb'], "Module List" );
        $this->data['modules'] = $this->Mod_module->get_modules();
        $this->load->view( 'modules/view_module_list', $this->data );
    }

    public function save()
    {
        $this->form_validation->set_rules( 'course_id', 'Course ID', 'required' );
        $this->form_validation->set_rules( 'name', 'Module Name', 'required' );
        $this->form_validation->set_rules( 'duration', 'Duration', 'required' );
        $this->form_validation->set_rules( 'sl', 'SL', 'required' );

        if ( $this->form_validation->run() ) {
            $flag = $this->Mod_module->save_data();

            if ( $flag ) {
                $this->session->set_flashdata( 'flashOK', 'Information Saved Successfully!' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Information Cannot be Saved!' );
            }
            redirect( 'module/records' );
        } else {
            $this->session->set_flashdata( 'flashError', validation_errors() );
            redirect( 'module' );
        }
    }

    public function edit()
    {
        array_push( $this->data['breadcrumb'], 'Edit Module' );
        $id = $this->uri->segment( 3 );
        $this->data['form_action'] = 'edit';
        $this->data['res'] = $this->Mod_module->get_module( $id );
        $this->load->view( 'modules/view_add_module', $this->data );
    }

    public function set_current()
    {
        if ( $this->input->post() ) {
            $this->form_validation->set_rules( 'year', 'Year', 'required' );
            $this->form_validation->set_rules( 'session', 'Session', 'required' );
            $this->form_validation->set_rules( 'module', 'Module', 'required' );

            if ( $this->form_validation->run() ) {
                $flag = $this->Mod_module->save_current_module();

                if ( $flag ) {
                    $this->session->set_flashdata( 'flashOK', 'Current Module Saved Successfully!' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Current Module Cannot be Saved!' );
                }
                redirect( 'module/set_current' );
            } else {
                $this->set_current();
            }
        } else {
            array_push( $this->data['breadcrumb'], 'Current Module' );
            $this->data['n_year'] = $this->common_lib->getYearList();
            $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
            $this->data['module_list'] = $this->Mod_setting->getModuleList();
            $this->load->view( 'modules/view_add_current_module', $this->data );
        }
    }


    public function update()
    {
        $this->form_validation->set_rules( 'auto_id', 'Module ID', 'required' );
        $this->form_validation->set_rules( 'course_id', 'Course ID', 'required' );
        $this->form_validation->set_rules( 'name', 'Module Name', 'required' );
        $this->form_validation->set_rules( 'duration', 'Duration', 'required' );
        $this->form_validation->set_rules( 'sl', 'SL', 'required' );

        $id = $this->input->post( 'auto_id', TRUE );
        if ( $this->form_validation->run() ) {

            $flag = $this->Mod_module->update_data( $id );
            if ( $flag ) {
                $this->session->set_flashdata( 'flashOK', 'Information updated Successfully!' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Information Cannot be updated!' );
            }
            redirect( 'module/records' );
        } else {
            $this->session->set_flashdata( 'flashError', validation_errors() );
            redirect( "module/edit/$id" );
        }
    }
}