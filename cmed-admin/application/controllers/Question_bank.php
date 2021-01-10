<?php

/**
 * Class Question Bank
 * @property Mod_setting      $Mod_setting
 * @property Mod_admission    $Mod_admission
 * @property Mod_common       $Mod_common
 * @property Mod_file_upload  $Mod_file_upload
 * @property common_lib       $common_lib
 * @property Mod_questionbank $Mod_questionbank
 */
class Question_bank extends My_Controller
{

    private $record_per_page  = 15;
    private $record_num_links = 5;

//    private $data = '';

    public function __construct()
    {
        parent::__construct();

        if ( !$this->ion_auth->is_admin() ) {
            redirect( 'dashboard' );
        }

        $this->data['module_name'] = "Question Bank";
        $this->load->model( 'Mod_common' );
        $this->load->model( 'Mod_questionbank' );
        $this->load->library( 'pagination' );
        $this->load->helper( 'date' );
        $this->load->helper( 'utility' );
//        $this->data['session_list'] = $this->Mod_common->get_session_list();

        $this->data['breadcrumb'] = array($this->data['module_name']);
        $this->data['status_array'] = $this->common_lib->get_status_array();
        $this->data['n_year'] = $this->common_lib->getYearList();
        $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
        $this->data['module_list'] = $this->Mod_setting->getModuleList();
        $this->data['unit_list'] = $this->Mod_setting->getUnitList();
//        $this->data['answer_array'] = $this->common_lib->get_answer_array();

    }

    /*mcq exam question*/

    function add_mcq_question()
    {
        $this->data['form_action'] = "add";
        array_push( $this->data['breadcrumb'], 'Add MCQ Question' );
        $this->data['mcq_answer_array'] = $this->Mod_questionbank->get_mcq_answer_array();
        $this->load->view( 'question_bank/mcq/view_add_question', $this->data );
    }

    function save_mcq_question()
    {
        $this->form_validation->set_rules( 'module', 'Module', 'trim|required' );
        $this->form_validation->set_rules( 'unit', 'Unit', 'trim|required' );
        $this->form_validation->set_rules( 'question_name', 'Question', 'trim|required' );
        $this->form_validation->set_rules( 'ans_a', 'A', 'trim|required' );
        $this->form_validation->set_rules( 'ans_b', 'B', 'trim|required' );
        $this->form_validation->set_rules( 'ans_c', 'C', 'trim|required' );
        $this->form_validation->set_rules( 'ans_d', 'D', 'trim|required' );
        $this->form_validation->set_rules( 'ans_e', 'E', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->add_mcq_question();
        } else {
            $res_flag = $this->Mod_questionbank->save_mcq_question( $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Question Added Successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add Question.' );
            }
            redirect( 'question_bank/add_mcq_question' );
        }
    }

    function mcq_question_list()
    {
        array_push( $this->data['breadcrumb'], 'MCQ Question List' );
        $row = 0;
        $temp_record_postion = $this->uri->segment( 3 );

        if ( !empty ( $temp_record_postion ) ) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata( 'sql_where_session' );
        }

        $config = config_item( 'pagination' );
        $config['base_url'] = base_url( 'question_bank/mcq_question_list' );
        $config['total_rows'] = $this->Mod_questionbank->count_mcq_examquestion_list();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $this->pagination->initialize( $config );

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $config['total_rows'];
        $this->data['links'] = $this->pagination->create_links();

//        $this->data['chapter_list'] = $this->Mod_examtopics->get_chapter_dropdown();
        $this->data['rec'] = $this->Mod_questionbank->get_mcq_examquestion_list( $this->record_per_page, $row );
//        echo '<pre>';
//        print_r($this->data['rec']); exit;
        $this->load->view( 'question_bank/mcq/view_question_list', $this->data );
    }

    function edit_mcq_question( $auto_id )
    {
        array_push( $this->data['breadcrumb'], 'Edit MCQ Question' );
        $this->data['form_action'] = "edit";
        $get_details = $this->Mod_questionbank->get_exam_details( $auto_id );
        $this->data['mcq_answer_array'] = $this->Mod_questionbank->get_mcq_answer_array();
        $master_ref_id = $get_details->id;
        $this->data['options'] = $this->Mod_questionbank->get_mcq_option_list( $master_ref_id );
        $this->data['res'] = $get_details;

        $this->load->view( 'question_bank/mcq/view_add_question', $this->data );
    }


    function update_mcq_question( $id )
    {
        $this->form_validation->set_rules( 'module', 'Module', 'trim|required' );
        $this->form_validation->set_rules( 'unit', 'Unit', 'trim|required' );
        $this->form_validation->set_rules( 'question_name', 'Question', 'trim|required' );
        $this->form_validation->set_rules( 'ans_a', 'A', 'trim|required' );
        $this->form_validation->set_rules( 'ans_b', 'B', 'trim|required' );
        $this->form_validation->set_rules( 'ans_c', 'C', 'trim|required' );
        $this->form_validation->set_rules( 'ans_d', 'D', 'trim|required' );
        $this->form_validation->set_rules( 'ans_e', 'E', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->edit_mcq_question( $id );
        } else {
            $res_flag = $this->Mod_questionbank->update_mcq_question( $id, $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Question updated successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to update data' );
            }
            redirect( 'question_bank/mcq_question_list' );
        }
    }

    /*End mcq exam question*/

    function add_sba_question()
    {
        array_push( $this->data['breadcrumb'], 'Add SBA Question' );
        $this->data['form_action'] = "add";
        $this->data['chapter_lists'] = $this->Mod_examtopics->get_chapter_lists();
        //echo '<pre>';
        //print_r($this->data['chapter_lists']);exit();     
        $this->load->view( 'sba_exam_questions/view_add_exam_question', $this->data );
    }

    function save_sba_question()
    {
        $this->form_validation->set_rules( 'question_name', 'Question', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'sba_exam_questions/view_add_exam_question', $this->data );
        } else {
            $res_flag = $this->Mod_questionbank->save_question_list( $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'question_bank/add_examquestion' );
        }
    }

    function sba_question_list()
    {
        array_push( $this->data['breadcrumb'], 'SBA Question List' );
        $row = 0;
        $temp_record_postion = $this->uri->segment( 3 );

        if ( !empty ( $temp_record_postion ) ) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata( 'sql_where_session' );
        }

        $config = config_item( 'pagination' );
        $config['base_url'] = base_url() . 'question_bank/examquestion_list';
        $config['total_rows'] = $this->Mod_questionbank->count_records();
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $this->pagination->initialize( $config );

        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_questionbank->count_records();
        $this->data['links'] = $this->pagination->create_links();

        $this->data['chapter_list'] = $this->Mod_examtopics->get_chapter_dropdown();
        $this->data['rec'] = $this->Mod_questionbank->get_records_list( $this->record_per_page, $row );
        $this->load->view( 'sba_exam_questions/view_exam_question_list', $this->data );
    }

    function topic_questions( $type, $topic_id )
    {
        //array_push($this->data['breadcrumb'], 'Teachers List');
//        $topic_id = $this->uri->segment( 3 );
        $temp_record_postion = $this->uri->segment( 5 );
        $row = $temp_record_postion ? $temp_record_postion : 0;
        $this->data['type'] = $type == 2 ? 'MCQ' : 'SBA';
        $config = config_item( 'pagination' );
        $config['base_url'] = site_url( "question_bank/topic_questions/$type/$topic_id" );
        $config['total_rows'] = $this->Mod_questionbank->count_topic_questions_list( $topic_id, $type );
        $config['per_page'] = $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $config['uri_segment'] = 5;
        $this->pagination->initialize( $config );
        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $config['total_rows'];
        $this->data['links'] = $this->pagination->create_links();
        $this->data['topic'] = $this->Mod_common->get_row_data_by_id( 'oe_topics', $topic_id );
        $this->data['rec'] = $this->Mod_questionbank->get_topic_questions_list( $topic_id, $type, $this->record_per_page, $row );
//        die( json_encode( $this->data['rec'] ) );
        $this->load->view( 'exam/view_examquestion_list', $this->data );
    }

    function edit_sba()
    {
        array_push( $this->data['breadcrumb'], 'Edit SBA Question' );
        $this->data['form_action'] = "edit";
        $auto_id = $this->uri->segment( 3 );

        $get_details = $this->Mod_questionbank->get_exam_details( $auto_id );
        $this->data['chapter_lists'] = $this->Mod_examtopics->get_chapter_lists( $auto_id );
        $this->data['chapters'] = $this->Mod_examtopics->get_selected_chapter_lists( $auto_id );
        $this->data['topics'] = $this->Mod_examtopics->get_selected_topics_lists( $auto_id );
        $master_ref_id = $get_details->id;
        $this->data['results'] = $this->Mod_questionbank->get_option_list( $master_ref_id );

        $this->data['res'] = $get_details;

        $this->load->view( 'sba_exam_questions/view_edit_exam_question', $this->data );
    }

    function update_sba_question()
    {
        $id = $this->input->post( 'update_id' );

        $this->form_validation->set_rules( 'question_name', 'Question', 'trim|required' );
        if ( $this->form_validation->run() == FALSE ) {
            $this->data['form_action'] = "add";
            $this->load->view( 'sba_exam_questions/view_add_exam_question', $this->data );
        } else {
            $res_flag = $this->Mod_questionbank->update_question_list( $id, $this->authEmail );
            if ( !empty( $res_flag ) ) {
                $this->session->set_flashdata( 'flashOK', 'Data updated successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', 'Failed to add data' );
            }
            redirect( 'question_bank/examquestion_list' );
        }
    }


}
