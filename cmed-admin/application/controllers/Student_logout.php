<?php

/**
 * Description of admin_logout
 *
 * @author  jnahian
 * Date : 02-March-2014
 */
class Student_Logout extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library( ['ion_auth'] );
    }

    function index()
    {
        $this->session->sess_destroy();
        $this->session->set_flashdata( 'logout', TRUE );
        redirect( 'doctor_login' );
    }
}