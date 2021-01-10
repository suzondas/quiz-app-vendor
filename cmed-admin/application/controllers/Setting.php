<?php

/**
 * Description of featured
 *
 * @author jnahian
 * @property Mod_setting   $Mod_setting
 * @property Mod_admission $Mod_admission
 * @property Mod_common    $Mod_common
 * @property common_lib    $common_lib
 */
class Setting extends My_Controller
{

    private $record_per_page  = 20;
    private $record_num_links = 5;

    public function __construct()
    {
        parent::__construct();

        $this->data['module_name'] = "Setting";

        $this->load->model( 'Mod_setting' );
        $this->load->model( 'Mod_admission' );
        $this->load->model( 'Mod_common' );
        $this->load->library( 'pagination' );
        $this->load->library( 'common_lib' ); /*  load pagination library */
        $this->load->library( 'form_validation' ); /* load validation library */
        $this->data['status_array'] = $this->common_lib->get_status_array();
        $this->data['teacher_list'] = $this->Mod_common->get_teachers_array();
        $this->data['evaluate_value'] = $this->common_lib->evaluation_value();
        //$this->data['eval_doctor'] = $this->Mod_setting->get_evaluation_user_array();
        $this->data['month_array'] = $this->common_lib->get_month_array();
        $this->data['collage_type'] = $this->common_lib->get_collage_type_array();
        $this->data['fee_type_code_array'] = $this->common_lib->get_fee_type_code_array();
        // $this->data[ 'course_list' ] = $this->Mod_setting->get_course_list_array();
        // $this->data[ 'faculty_list' ] = $this->Mod_setting->get_faculty_list_array();
        // $this->data[ 'subject_list' ] = $this->Mod_setting->get_batch_list_array();
//        $this->data['sub_list'] = $this->Mod_setting->get_subject_list_array();
//        $this->data['package_des_list'] = $this->Mod_setting->get_package_des_list_array();
        // $this->data[ 'service_package' ] = $this->Mod_setting->get_service_package_list_array();
        $this->data['current_fut_year'] = $this->common_lib->get_current_future_year();
        $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
//        $this->data['batch_list'] = $this->Mod_setting->get_batch_list_array();
//        $this->data['topic_list'] = $this->Mod_setting->get_topic_list_array();

        $this->data['breadcrumb'] = array($this->data['module_name']);
    }

    function index()
    {
        redirect( 'setting/add_class' );
    }

    public function general_info()
    {
        array_push( $this->data['breadcrumb'], 'General Information' );
        // $this->data['income_head_list'] = $this->Mod_common->get_acct_head_list('I');
        // $this->data['expanse_head_list'] = $this->Mod_common->get_acct_head_list('E');
        $this->data['record'] = $this->Mod_setting->get_general_info();
        $this->load->view( 'setting/view_general_info', $this->data );
    }

    public function save_general_info()
    {
        $this->form_validation->set_rules( 'name', 'Company Name', 'trim|required' );
        $this->form_validation->set_rules( 'tagline', 'Company Tagline', 'trim' );
        $this->form_validation->set_rules( 'address', 'Company Address', 'trim' );
        $this->form_validation->set_rules( 'email', 'Company Email', 'trim|valid_email' );
        $this->form_validation->set_rules( 'fb_id', 'Facebook Id', 'trim' );
        $this->form_validation->set_rules( 'phone', 'Company Phone', 'trim' );
        $this->form_validation->set_rules( 'website', 'Company Website', 'trim' );
        // $this->form_validation->set_rules('ah_tec_payment', 'Faculty Payment Head', 'trim|required');
        // $this->form_validation->set_rules('ah_stu_fee', 'Student Fee Head', 'trim|required');
        if ( $this->form_validation->run() ) {
            $this->Mod_setting->save_general_info();
        }
        redirect( 'setting/general_info' );
    }

    function add_faculty()
    {
        $this->data['form_action'] = "add";

        $get_list = $this->Mod_setting->get_faculty_list();

        $this->data['record'] = $get_list;
        $this->load->view( 'setting/view_faculty', $this->data );
    }

    function save_faculty()
    {

        $this->form_validation->set_rules( 'faculty_name', 'Faculty', 'trim|required' );
        $this->form_validation->set_rules( 'course_code', 'Course Code', 'trim|required' );
        $this->form_validation->set_rules( 'faculty_code', 'Faculty id', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_faculty', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_faculty_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_faculty' );
        }
    }

    function edit_faculty()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_faculty_details( $auto_id );
        $this->data['res'] = $get_details;

        $this->data['record'] = // $this->data[ 'course_list' ]; //$get_list;

        $get_list = $this->Mod_setting->get_faculty_list();
        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_faculty', $this->data );
    }

    function update_faculty()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'faculty_name', 'Faculty', 'trim|required' );
            $this->form_validation->set_rules( 'course_code', 'Course Code', 'trim|required' );
            $this->form_validation->set_rules( 'faculty_code', 'Course', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_faculty', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_faculty_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Data updated successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_faculty' );
            }
        } else {
            redirect( 'setting/edit_faculty/' . $auto_id );
        }
    }

    function add_course()
    {
        $this->data['form_action'] = "add";
        $get_list = $this->Mod_setting->get_course_list();
        $this->data['record'] = $get_list;
        $this->load->view( 'setting/view_course', $this->data );
    }

    function save_course()
    {
        $this->form_validation->set_rules( 'course_name', 'Course Name', 'trim|required' );
        $this->form_validation->set_rules( 'course_code', 'Course Code', 'trim|required|length[1]' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_course', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_course_info( $this->authEmail );
            if ( $res_flag ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_course' );
        }
    }

    function edit_course()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_course_details( $auto_id );
        $this->data['res'] = $get_details;
//        echo '<pre>';
//        print_r($this->data['res']);
//        exit;

        $get_list = $this->Mod_setting->get_course_list();

        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_course', $this->data );
    }

    function update_course()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'course_name', 'Course Name', 'trim|required' );
            $this->form_validation->set_rules( 'course_code', 'Course Code', 'trim|required|length[1]' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_course', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_course_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Data update successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed update data' );
                }
                redirect( 'setting/add_course' );
            }
        } else {
            redirect( 'setting/edit_course/' . $auto_id );
        }
    }

    function add_institute()
    {

        $this->data['form_action'] = "add";
        $get_list = $this->Mod_setting->get_institute_list();
        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_institute', $this->data );
    }

    function save_institute()
    {
        $this->form_validation->set_rules( 'institute_name', 'Institute', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_institute', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_institute_list( $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_institute' );
        }
    }

    function edit_institute_list()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_institute_details( $auto_id );
        $this->data['res'] = $get_details;
//        echo '<pre>';
//        print_r($this->data['res']);
//        exit;

        $get_list = $this->Mod_setting->get_institute_list();

        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_institute', $this->data );
    }

    function update_institute()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'institute_name', 'Institute', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_institute', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_institute_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Data update successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed update data' );
                }
                redirect( 'setting/add_institute' );
            }
        } else {
            redirect( 'setting/edit_institute_list/' . $auto_id );
        }
    }

    function add_batch()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_batch_list();
        $this->load->view( 'setting/view_batch', $this->data );
    }

    function save_batch()
    {
//        $this->form_validation->set_rules('faculty_code', 'Faculty', 'trim|required');
        $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
        $this->form_validation->set_rules( 'subject', 'Subject', 'trim|required' );
        $this->form_validation->set_rules( 'batch_code', 'Batch Code', 'trim|required|length[1]' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_batch', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_batch_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_batch' );
        }
    }

    function edit_batch()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_batch_details( $auto_id );
        $this->data['res'] = $get_details;


        $this->data['record'] = $this->Mod_setting->get_batch_list();
        $this->load->view( 'setting/view_batch', $this->data );
    }

    function update_batch()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
//            $this->form_validation->set_rules('faculty_code', 'Faculty', 'trim|required');
            $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
            $this->form_validation->set_rules( 'subject', 'Subject', 'trim|required' );
            $this->form_validation->set_rules( 'batch_code', 'Batch Code', 'trim|required|length[1]' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_batch', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_batch_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data added successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_batch' );
            }
        } else {
            redirect( 'setting/edit_batch/' . $auto_id );
        }
    }

    function add_subject()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_subject_list();
        $this->load->view( 'setting/view_subject', $this->data );
    }

    function save_subject()
    {
        $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
//        $this->form_validation->set_rules('faculty_code', 'Faculty', 'trim|required');
        $this->form_validation->set_rules( 'subject', 'Faculty', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_subject', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_subject_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_subject' );
        }
    }

    function edit_subject()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_subject_details( $auto_id );
        $this->data['res'] = $get_details;


        $this->data['record'] = $this->Mod_setting->get_subject_list();
        $this->load->view( 'setting/view_subject', $this->data );
    }

    function update_subject()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
//            $this->form_validation->set_rules('faculty_code', 'Faculty', 'trim|required');
            $this->form_validation->set_rules( 'subject', 'Faculty', 'trim|required' );

            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_subject', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_subject_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data added successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_subject' );
            }
        } else {
            redirect( 'setting/edit_subject/' . $auto_id );
        }
    }

    function add_fee()
    {
        //$code = 13;
        //var_dump(get_name_by_auto_id('sif_course',$code,'course_name'));
        //exit;
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_fee_list();
        // echo print_r($this->data['record']);exit;
        $this->load->view( 'setting/view_fee', $this->data );
    }

    function save_fee()
    {
        $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
        $this->form_validation->set_rules( 'ser_pack_id', 'Service Pack', 'trim|required' );
        $this->form_validation->set_rules( 'fee_amount', 'Fee Amount', 'trim|required' );
        $this->form_validation->set_rules( 'old_fee_amount', 'Old Fee Amount', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_fee', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_fee_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_fee' );
        }
    }

    function edit_fee()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_fee_details( $auto_id );
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_fee_list();
        $this->load->view( 'setting/view_fee', $this->data );
    }

    function update_fee()
    {
        $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
        $this->form_validation->set_rules( 'ser_pack_id', 'Service Pack', 'trim|required' );
        $this->form_validation->set_rules( 'fee_amount', 'Fee Amount', 'trim|required' );
        $this->form_validation->set_rules( 'old_fee_amount', 'Old Fee Amount', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_fee', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_fee_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_fee' );
            }
        } else {
            redirect( 'setting/edit_fee/' . $auto_id );
        }
    }


    function add_session()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_session_list();

        $this->load->view( 'setting/view_session_list', $this->data );
    }

    function save_session()
    {
        $this->form_validation->set_rules( 'ses_name', 'Session', 'trim|required' );
        $this->form_validation->set_rules( 'ses_id', 'Session Id', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_session_list', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_session_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_session' );
        }
    }

    function edit_session()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_session_details( $auto_id );
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_session_list();
        $this->load->view( 'setting/view_session_list', $this->data );
    }

    function update_session()
    {
        $this->form_validation->set_rules( 'ses_name', 'Session', 'trim|required' );
        $this->form_validation->set_rules( 'ses_id', 'Session Id', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_session_list', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_session_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_session' );
            }
        } else {
            redirect( 'setting/edit_session/' . $auto_id );
        }
    }

    function add_class_topic()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_class_topic_list();
        $this->load->view( 'setting/view_class_topic', $this->data );
    }

    function save_class_totic()
    {
        $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
//        $this->form_validation->set_rules('faculty_code', 'Faculty', 'trim|required');
        $this->form_validation->set_rules( 'subject_id', 'Subject', 'trim|required' );
        $this->form_validation->set_rules( 'class_topic_name', 'Topic Name', 'required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_class_topic', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_class_topic_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_class_topic' );
        }
    }

    function edit_class_topic()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_class_topic_details( $auto_id );
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_class_topic_list();
        $this->load->view( 'setting/view_class_topic', $this->data );
    }

    function update_class_totic()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'course_code', 'Course', 'trim|required' );
            $this->form_validation->set_rules( 'faculty_code', 'Faculty', 'trim|required' );
            //$this->form_validation->set_rules('subject_id', 'Faculty', 'trim|required');
            $this->form_validation->set_rules( 'class_topic_name', 'Subject', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_class_topic', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_class_topic_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_class_topic' );
            }
        } else {
            redirect( 'setting/edit_class_topic/' . $auto_id );
        }
    }

    public function add_topics()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_topics_list();
        $this->load->view( 'setting/view_topics', $this->data );
    }

    public function save_topics()
    {
        $this->form_validation->set_rules( 'name', 'name', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_topics', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_topics_info();

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_topics' );
        }
    }

    public function edit_topics()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( '3' );
        $get_details = $this->Mod_setting->get_topics_value( $auto_id );
        $this->data['res'] = $get_details;

        $this->data['record'] = $this->Mod_setting->get_topics_list();
        $this->load->view( 'setting/view_topics', $this->data );
    }

    public function update_topic()
    {
        $auto_id = $this->input->post( 'auto_id' );
        $this->form_validation->set_rules( 'name', 'name', 'trim|required' );

        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_topics', $this->data );
        } else {
            $res_flag = $this->Mod_setting->update_topics_info( $auto_id );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data Updated successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to Updated data' );
            }
            redirect( 'setting/add_topics' );
        }
    }

    function add_exam_type()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_exam_type_list();
        $this->load->view( 'setting/view_exam_type', $this->data );
    }

    function save_exam()
    {
        $this->form_validation->set_rules( 'exam_name', 'Eaxm Name', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_exam_type', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_exam_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_exam_type' );
        }
    }

    function edit_exam_type()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_exam_details( $auto_id );
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_exam_type_list();
        $this->load->view( 'setting/view_exam_type', $this->data );
    }

    function update_exam()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'exam_name', 'Eaxm Name', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_exam_type', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_exam_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_exam_type' );
            }
        } else {
            redirect( 'setting/edit_exam_type/' . $auto_id );
        }
    }

    function add_room_type()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_room_type_info();
        $this->load->view( 'setting/view_room_type', $this->data );
    }

    function save_room_type()
    {
        $this->form_validation->set_rules( 'floor', 'Floor', 'trim|required' );
        $this->form_validation->set_rules( 'room_name', 'Room Name', 'trim|required' );
        $this->form_validation->set_rules( 'capacity', 'Capacity', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_room_type', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_room_type_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_room_type' );
        }
    }

    function edit_room_type()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_room_type_details( $auto_id );
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_room_type_info();
        $this->load->view( 'setting/view_room_type', $this->data );
    }

    function update_room_type()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'floor', 'Floor', 'trim|required' );
            $this->form_validation->set_rules( 'room_name', 'Room Name', 'trim|required' );
            $this->form_validation->set_rules( 'capacity', 'Capacity', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_room_type', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_room_type_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_room_type' );
            }
        } else {
            redirect( 'setting/edit_room_type/' . $auto_id );
        }
    }

    function add_med_collage()
    {
        $this->data['form_action'] = "add";
        $get_list = $this->Mod_setting->get_collages_list();
        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_medical_collage', $this->data );
    }

    function save_med_collage()
    {
        $this->form_validation->set_rules( 'collage_name', 'Collage Name', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_medical_collage', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_collage_list( $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_med_collage' );
        }
    }

    function edit_med_collage_list()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_med_collage_details( $auto_id );
        $this->data['res'] = $get_details;
//        echo '<pre>';
//        print_r($this->data['res']);
//        exit;
        $get_list = $this->Mod_setting->get_collages_list();
        $this->data['record'] = $get_list;


        $this->load->view( 'setting/view_medical_collage', $this->data );
    }

    function update_med_collage()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'collage_name', 'Collage Name', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_medical_collage', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_med_collage_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Data update successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed update data' );
                }
                redirect( 'setting/add_med_collage' );
            }
        } else {
            redirect( 'setting/edit_med_collage_list/' . $auto_id );
        }
    }


    function add_holiday()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->get_holiday_info();
        $this->load->view( 'setting/view_holiday', $this->data );
    }

    function save_holiday()
    {
        $this->form_validation->set_rules( 'holiday_topic', 'Holiday', 'trim|required' );

        $this->form_validation->set_rules( 'date_from', 'Date From', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_holiday', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_holiday_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_holiday' );
        }
    }

    function edit_holiday()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_holiday_details( $auto_id );
//        echo '<pre>';
//        print_r($get_details);
//        exit;
        $this->data['res'] = $get_details;
        $this->data['record'] = $this->Mod_setting->get_holiday_info();
        $this->load->view( 'setting/view_holiday', $this->data );
    }

    function update_holiday()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'holiday_topic', 'Holiday', 'trim|required' );
            $this->form_validation->set_rules( 'date_from', 'Date From', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );

            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_holiday', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_holiday_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_holiday' );
            }
        } else {
            redirect( 'setting/edit_holiday/' . $auto_id );
        }
    }

    function service_pack()
    {
        $this->data['form_action'] = "add";
        $this->data['service_des'] = $this->Mod_setting->service_pack_description_list();

        $this->data['record'] = $this->Mod_setting->get_service_pack_des();
//        echo '<pre>';
//        print_r($this->data['record']);
//        exit;
        $this->load->view( 'setting/view_service_pack', $this->data );
    }

    function save_service_pack()
    {

        $this->form_validation->set_rules( 'ser_pack', 'Service Pack', 'trim|required' );
        //$this->form_validation->set_rules('pd_id', 'Description', 'trim|required');
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";

            $this->load->view( 'setting/view_service_pack', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_service_pack_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/service_pack' );
        }
    }

    function edit_service_pack()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_service_pack_details( $auto_id );

        $this->data['res'] = $get_details;
//        echo '<pre>';
//        print_r($this->data['res']);
//        exit;
        $this->data['record'] = $this->Mod_setting->get_service_pack_des();
        $this->load->view( 'setting/view_service_pack', $this->data );
    }

    function update_service_pack()
    {
        $auto_id = $this->input->post( 'hidden_auto_id' );
        if ( $auto_id ) {
            $this->form_validation->set_rules( 'ser_pack', 'Service Pack', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_service_pack', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_service_pack_detail( $auto_id, $this->authEmail );
                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/service_pack' );
            }
        } else {
            redirect( 'setting/edit_service_pack' . $auto_id );
        }
    }

    function add_service_pack_des()
    {
        $this->data['form_action'] = "add";
        $this->data['record'] = $this->Mod_setting->service_pack_description_list();
        //$this->data['record'] = $get_list;

        $this->load->view( 'setting/view_service_pack_descrip', $this->data );
    }

    function save_service_pack_des()
    {

        $this->form_validation->set_rules( 'description', 'Description', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_service_pack_descrip', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_service_pack_des_info( $this->authEmail );
            if ( $res_flag ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_service_pack_des' );
        }
    }

    function edit_service_package_descrip()
    {
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_service_pack_descrip_details( $auto_id );

        $this->data['res'] = $get_details;

        $this->data['record'] = $this->Mod_setting->service_pack_description_list();
        $this->load->view( 'setting/view_service_pack_descrip', $this->data );
    }

    function update_service_package_description()
    {
        $auto_id = $this->input->post( 'hidden_auto_id' );
        if ( $auto_id ) {
            $this->form_validation->set_rules( 'description', 'Description', 'trim|required' );
            $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_service_pack_descrip', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_service_pack_description( $auto_id, $this->authEmail );
                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Update Data successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed to add data' );
                }
                redirect( 'setting/add_service_pack_des' );
            }
        } else {
            redirect( 'setting/edit_service_package_descrip' . $auto_id );
        }
    }

    function ajax_get_faculty_by_course()
    {
        $course_code = $this->input->post( 'course_code' );
        $result = $this->Mod_setting->get_faculty_by_course_id( $course_code );
        $options = "<option value=''>Select</option>";
        if ( $result ) {
            foreach ( $result as $res ) {
                $options .= "<option value='" . $res->faculty_code . "'>{$res->faculty_name}</option>";
            }
        }
        echo $options;
    }

    function ajax_get_course_by_faculty_id()
    {
//        $faculty_code = $this->input->post('faculty_code');
        $course_code = $this->input->post( 'course_code' );
        $result_batch = $this->Mod_setting->get_batch_by_faculty_id( $course_code );
        $result_sub = $this->Mod_setting->get_subject_by_faculty_id( $course_code );
//        echo '<pre>';
//        print_r($course_id);
//        exit;

        $options = array();
        $options['batch'] = "<option value=''>Select</option>";
        if ( $result_batch ) {

            foreach ( $result_batch as $res ) {
                $options['batch'] .= "<option value='" . $res->batch_code . "'>{$res->subject}</option>";
            }
        }
        $options['subject'] = "<option value=''>Select</option>";
        if ( $result_sub ) {

            foreach ( $result_sub as $res ) {
                $options['subject'] .= "<option value='" . $res->id . "'>{$res->subject}</option>";
            }
        }

        echo json_encode( $options );
    }


    function ajax_get_course_by_faculty_id_suject_topic()
    {
//        $faculty_code = $this->input->post('faculty_code');
        $course_code = $this->input->post( 'course_code' );
        //echo $course_code;
        $result_topic = $this->Mod_setting->get_topic_by_faculty_id( $course_code ); //$faculty_code
        $result_sub = $this->Mod_setting->get_subject_by_faculty_id( $course_code ); //$faculty_code

        $options = array();
        $options['topic'] = "<option value=''>Select</option>";
        if ( $result_topic ) {

            foreach ( $result_topic as $res ) {
                $options['topic'] .= "<option value='" . $res->id . "'>{$res->class_topic_name}</option>";
            }
        }
        $options['subject'] = "<option value=''>Select</option>";
        if ( $result_sub ) {

            foreach ( $result_sub as $res ) {
                $options['subject'] .= "<option value='" . $res->id . "'>{$res->subject}</option>";
            }
        }

        echo json_encode( $options );
    }

    function ajax_get_batch_topic()
    {
//        $faculty_code = $this->input->post('faculty_code');
        $course_code = $this->input->post( 'course_code' );
        //echo $course_code;
        $result_topic = $this->Mod_setting->get_topic_by_faculty_id( $course_code ); //$faculty_code
        $result_batch = $this->Mod_setting->get_batch_by_faculty_id( $course_code ); //$faculty_code
        $result_sub = $this->Mod_setting->get_subject_by_faculty_id( $course_code ); //$faculty_code

        $options = array();
        $options['topic'] = "<option value=''>Select</option>";
        if ( $result_topic ) {

            foreach ( $result_topic as $res ) {
                $options['topic'] .= "<option value='" . $res->id . "'>{$res->class_topic_name}</option>";
            }
        }
        $options['batch'] = "<option value=''>Select</option>";
        if ( $result_batch ) {

            foreach ( $result_batch as $res ) {
                $options['batch'] .= "<option value='" . $res->batch_code . "'>{$res->subject}</option>";
            }
        }
        $options['subject'] = "<option value=''>Select</option>";
        if ( $result_sub ) {

            foreach ( $result_sub as $res ) {
                $options['subject'] .= "<option value='" . $res->id . "'>{$res->subject}</option>";
            }
        }

        echo json_encode( $options );
    }

    function ajax_get_course_by_service_pack_fee()
    {
        $ser_pack_id = $this->input->post( 'ser_pack_id', TRUE );
        $course_code = $this->input->post( 'course_code', TRUE );
        $admi_type = $this->input->post( 'admi_type', TRUE );
        $amount = $this->Mod_admission->get_ser_pack_amount( $ser_pack_id, $course_code, $admi_type );
        echo $amount;
    }


    public function evaluation_list()
    {
        $this->data['module_name'] = "Evaluation List";
        $row = 0;
        $temp_record_postion = $this->uri->segment( 3 );

        if ( !empty ( $temp_record_postion ) ) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata( 'sql_where_session' );
        }

        $config['base_url'] = base_url() . 'setting/evaluation_list';
        $config['total_rows'] = $this->Mod_setting->count_records();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $config['full_tag_open'] = '<p>';
        $config['full_tag_close'] = '</p>';
        $this->pagination->initialize( $config );

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_setting->count_records();
        $this->data['links'] = $this->pagination->create_links();

        $this->data['evaluations'] = $this->Mod_setting->get_evaluation_result( $this->record_per_page, $row );
        $this->load->view( 'evaluation/view_evaluation_list', $this->data );
    }

    public function add_question_about_genesis()
    {
        $this->data['form_action'] = "add";
        $get_list = $this->Mod_setting->get_question_list();
        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_question_about_genesis', $this->data );
    }

    public function save_genesis_question()
    {
        $this->form_validation->set_rules( 'question', 'Question', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_question_about_genesis', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_question( $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/add_question_about_genesis' );
        }
    }

    public function edit_question_list()
    {

        $this->data['form_action'] = "edit";
        $question_id = $this->uri->segment( 3 );
        $get_details = $this->Mod_setting->get_question_details( $question_id );
        $this->data['res'] = $get_details;

        $get_list = $this->Mod_setting->get_question_list();
        $this->data['record'] = $get_list;

        $this->load->view( 'setting/view_question_about_genesis', $this->data );
    }

    public function update_question_list()
    {
        $auto_id = $this->input->post( 'hidden_auto_id', TRUE );
        if ( !empty( $auto_id ) ) {
            $this->form_validation->set_rules( 'question', 'Question', 'trim|required' );
            if ( $this->form_validation->run() == FALSE ) {
                $this->data['form_action'] = "add";
                $this->load->view( 'setting/view_question_about_genesis', $this->data );
            } else {
                $res_flag = $this->Mod_setting->update_question_info( $auto_id, $this->authEmail );

                if ( !empty( $res_flag ) ) {
                    $this->session->set_flashdata( 'flashOK', 'Data update successfully' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Failed update data' );
                }
                redirect( 'setting/add_question_about_genesis' );
            }
        } else {
            redirect( 'setting/edit_question_list/' . $auto_id );
        }
    }

    function news_notice()
    {
        array_push( $this->data['breadcrumb'], "News/Notice List" );
        $row = 0;
        $temp_record_postion = $this->uri->segment( 3 );

        if ( !empty ( $temp_record_postion ) ) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata( 'sql_where_session' );
        }
        $config = config_item( 'pagination' );
        $config['base_url'] = site_url( 'setting/news_notice' );
        $config['total_rows'] = $this->Mod_setting->count_news_notice_records();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $this->pagination->initialize( $config );
        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $config['total_rows'];
        $this->data['links'] = $this->pagination->create_links();

        $get_list = $this->Mod_setting->get_news_notice_list( $this->record_per_page, $row );
        $this->data['record'] = $get_list;
        $this->load->view( 'setting/view_news_event', $this->data );
    }

    function add_news_notice()
    {
        array_push( $this->data['breadcrumb'], "ADD NEWS/Notice" );
        $this->data['form_action'] = "add";
        $this->load->view( 'setting/view_news_event_add', $this->data );
    }

    function save_news_notice()
    {
        $this->form_validation->set_rules( 'type', 'News/Notice Type', 'trim|required' );
        $this->form_validation->set_rules( 'news_title', 'News Title', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'setting/view_news_event_add', $this->data );
        } else {
            $res_flag = $this->Mod_setting->save_news_info( $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'News/Notice added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/news_notice' );
        }
    }

    function edit_news_notice( $id )
    {
        array_push( $this->data['breadcrumb'], "Edit NEWS/Notice" );
        $this->data['form_action'] = "edit";
        $this->data['id'] = $id;
        $this->data['record'] = $this->Mod_common->get_row_data_by_id( 'oe_news', $id );
        $this->load->view( 'setting/view_news_event_add', $this->data );
    }

    function update_news_notice( $id )
    {
        $this->form_validation->set_rules( 'type', 'News/Notice Type', 'trim|required' );
        $this->form_validation->set_rules( 'news_title', 'News Title', 'trim|required' );
        $this->form_validation->set_rules( 'status', 'Status', 'trim|required' );


        if ( $this->form_validation->run() == FALSE ) {
            $this->edit_news_notice( $id );
        } else {
            $res_flag = $this->Mod_setting->update_news_info( $id, $this->authEmail );

            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'News/Notice Updated successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'setting/news_notice' );
        }
    }

}
