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
 * @property Mod_payment $Mod_payment
 * @property common_lib $common_lib
 */
class payment extends My_Controller
{

    private $record_per_page = 20;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Payment";
        $this->load->library('pagination');
        $this->load->library('common_lib');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_common');
        $this->load->model('Mod_setting');
        $this->load->model('Mod_payment');

        $this->data['division_list'] = $this->Mod_common->get_division_list();
        $this->data['mai_district_list'] = $this->Mod_common->get_district_list_div();
        $this->data['mai_upazilla_list'] = $this->Mod_common->get_upazila_list_dist();
        $this->data['sex_array'] = $this->common_lib->get_sex_array(); /* get sex as array */
        $this->data['religion_array'] = $this->common_lib->get_religion_array(); /* get Religion as array */

        $this->data['year_array'] = $this->common_lib->get_year_array();
        $this->data['days_list'] = $this->common_lib->get_days_array();
        $this->data['teacher_pay_type'] = $this->common_lib->get_teacher_pay_type_array();
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
        $this->data['stu_type_list'] = $this->common_lib->get_student_type_list_array();

        $this->data['breadcrumb'] = array($this->data['module_name']);
    }

    function index()
    {
        array_push($this->data['breadcrumb'], 'Receive');
        $this->load->view('payment/view_add_payment', $this->data);
    }

    function discount()
    {
        array_push($this->data['breadcrumb'], 'Discount');
        if ($this->input->post()) {
            $return = $this->Mod_payment->get_search_data();
            if ($return) {
                $payments = $this->Mod_payment->get_payment_details($return['results']->id);
                $this->data['rec'] = $return['results'];
                $this->data['payments'] = $payments;
                $this->load->view('payment/view_add_discount', $this->data);
            } else {
                $this->session->set_flashdata('flashError', 'Please check the Registration No / BMDC no.');
                redirect('payment/discount');
            }
        }
        $this->load->view('payment/view_add_discount', $this->data);
    }

    /**
     *
     */
    function save()
    {
        $this->form_validation->set_rules('doc_id', 'Fellow\'s Id', 'required');
        $this->form_validation->set_rules('doc_reg_no', 'Fellow\'s Reg No', 'required');
        $this->form_validation->set_rules('date', 'Date', 'required');
        $this->form_validation->set_rules('amount', 'Amount', 'required');
        $this->form_validation->set_rules('auth_by', 'Auth By', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('payment/view_add_payment', $this->data);
        } else {
            $res_flag = $this->Mod_payment->save_data();
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Information saved successfully');
            } else {
                $this->session->set_flashdata('flashError', 'Failed to save information');
            }
            redirect('payment');
        }
    }

    public function save_discount()
    {
        $this->form_validation->set_rules('doc_id', 'Fellow\'s Id', 'required');
        $this->form_validation->set_rules('amount', 'Amount', 'required');
        $this->form_validation->set_rules('auth_by', 'Auth By', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('payment/view_add_discount', $this->data);
        } else {
            $res_flag = $this->Mod_payment->save_discount();
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Information saved successfully');
            } else {
                $this->session->set_flashdata('flashError', 'Failed to save information');
            }
            redirect('payment/discount');
        }
    }

    function records()
    {
        array_push($this->data['breadcrumb'], 'Received Payments');
        $this->data['total_rows'] = $this->Mod_payment->count_records();

        $this->data['rec'] = $this->Mod_payment->get_records_list($this->record_per_page);

        $this->load->view('payment/view_payment_list', $this->data);
    }

    function teacher_payment()
    {
        array_push($this->data['breadcrumb'], 'Facultys Payments');

        $this->data['rec'] = $this->Mod_payment->get_teacher_payment_list();

        //var_dump($this->data['rec']); exit;

        $this->load->view('payment/view_teacher_payment_list', $this->data);
    }

    public function search()
    {
        $return = $this->Mod_payment->get_search_data();
        if ($return) {
            $payments = $this->Mod_payment->get_payment_details($return['results']->id);
            $this->data['rec'] = $return['results'];
            $this->data['payments'] = $payments;
            $type = $this->input->post('type');
            if ($type == 'D') {
                $this->load->view('payment/view_add_discount', $this->data);
            } elseif ($type == 'P') {
                $this->load->view('payment/view_add_payment', $this->data);
            } else {
                $this->session->set_flashdata('flashError', 'Please check the Form.');
                redirect('payment');
            }
        } else {
            $this->session->set_flashdata('flashError', 'Please check the Registration No / BMDC no.');
            redirect('payment');
        }
    }

    /**
     *
     */
    function teacher()
    {
        array_push($this->data['breadcrumb'], 'Faculty Payment');
        if ($this->input->post()) {
            $this->form_validation->set_rules('teacher_id', 'Faculty ID', 'trim|required');
            if ($this->form_validation->run()) {
                $return = $this->Mod_payment->get_teacher_search_data();
                $payments = $this->Mod_payment->get_teacher_payment_details($return['results']->teacher_id);
                $this->data['rec'] = $return['results'];
                $this->data['payments'] = $payments;
            }
        }
        $this->load->view('payment/view_teacher_payment', $this->data);
    }

    public function save_teacher_payment()
    {
        $this->form_validation->set_rules('teacher_id', 'Faculty ID', 'trim|required');
        $this->form_validation->set_rules('date', 'Date', 'trim|required');
        $this->form_validation->set_rules('amount', 'Amount', 'trim|required|numeric');
        $this->form_validation->set_rules('auth_by', 'Auth By', 'trim|required');
        $this->form_validation->set_rules('pay_for', 'Pay For', 'trim|required');
        $this->form_validation->set_rules('note', 'Note', 'trim|required');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('payment/view_teacher_payment', $this->data);
        } else {
            $res_flag = $this->Mod_payment->save_teacher_payment($this->data['company']);
            if (!empty($res_flag)) {
                $this->session->set_flashdata('flashOK', 'Information saved successfully');
            } else {
                $this->session->set_flashdata('flashError', 'Failed to save information');
            }
            redirect('payment/teacher');
        }
    }

}
