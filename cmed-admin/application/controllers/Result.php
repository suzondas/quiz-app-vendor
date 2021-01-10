<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of result
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_result  $Mod_result
 * @property Mod_payment $Mod_payment
 * @property Mod_common  $Mod_common
 * @property common_lib  $common_lib
 * @property Mod_user    $Mod_user
 * @property Mod_student $Mod_student
 */
class Result extends My_Controller
{
    private $record_per_page  = 50;
    private $record_num_links = 5;

//    private $data = '';
    
    public function __construct()
    {
        parent::__construct();
        
        if ( !$this->ion_auth->is_admin() ) {
            redirect( 'dashboard' );
        }
        
        $this->data['module_name'] = "Results";
        $this->load->model( 'Mod_setting' );
        $this->load->model( 'Mod_file_upload' );
        $this->load->model( 'Mod_result' );
        $this->load->model( 'Mod_common' );
        $this->load->library( 'pagination' );
        $this->load->helper( 'date' );
        
        $this->data['n_year']       = $this->common_lib->getYearList();
        $this->data['session_list'] = $this->Mod_setting->get_session_list_array();
        $this->data['module_list']  = $this->Mod_setting->getModuleList();
        $this->data['unit_list']    = $this->Mod_setting->getUnitList();
        
        $this->data['exam_list'] = $this->Mod_common->get_exam_info_list();
        
        $this->load->config( 'exam' );
        $this->data['ec'] = $this->config->item( 'exam_config' );
        
        $this->data['breadcrumb'] = array($this->data['module_name']);
    }
    
    public function index()
    {
        array_push( $this->data['breadcrumb'], 'Unit Result' );
        
        $this->data['total_rows'] = $this->Mod_result->count_records();
        
        $this->data['rec'] = $this->Mod_result->get_records_list();
        
        $this->load->view( 'result/view_unit_result', $this->data );
    }
    
    public function on_site_result()
    {
        array_push( $this->data['breadcrumb'], 'ON SITE EXAM RESULT' );
        $this->data['rec'] = $this->Mod_result->get_on_site_result();
        $this->load->view( 'result/view_on_site_result', $this->data );
    }
    
    public function module_result()
    {
        array_push( $this->data['breadcrumb'], 'Module Result' );
        $this->data['rec']        = $this->Mod_result->get_module_result();
        $this->data['unit_count'] = $this->Mod_result->get_unit_count();
        $this->data['input']      = $this->input->post();
        $this->load->view( 'result/view_module_result', $this->data );
    }
    
    public function mcq_details( $exam_id )
    {
        array_push( $this->data['breadcrumb'], 'MCQ Result' );
        $exam                     = $this->Mod_result->get_user_exam_result( $exam_id );
        $this->data['exam']       = $exam;
        $this->data['page_title'] = "Exam Answer - " . $this->data['exam']->exam_data->name;
        $this->data['title']      = $this->data['page_title'];
        $this->data['data']       = $this->Mod_result->get_user_exam_questions_with_answers( $exam->exam_id );
        $this->load->view( 'result/view_answer_details', $this->data );
    }
    
    public function mcq_result( $exam_id )
    {
        array_push( $this->data['breadcrumb'], 'MCQ Result' );
        $exam                     = $this->Mod_result->get_user_exam_result( $exam_id );
        $this->data['exam']       = $exam;
        $this->data['page_title'] = "Exam Result";
        $this->data['title']      = $this->data['page_title'];
        $this->load->view( 'result/view_mcq_result', $this->data );
    }
    
    public function assignment_details( $doc_id, $module_id, $unit_id )
    {
        $this->load->model( 'Mod_student' );
        $assignment               = $this->Mod_student->get_doc_assignment( $doc_id, $module_id, $unit_id );
        $this->data['assignment'] = $assignment;
        $this->data['resends']    = $this->Mod_student->getAssignmentResends( $assignment->id );
        $this->data['replies']    = $this->Mod_student->getAssignmentReplies( $assignment->id );
        $this->load->view( 'assignments/view_doctor_assignments_replies', $this->data );
    }
    
    public function processing()
    {
        array_push( $this->data['breadcrumb'], 'Processing' );
//        $res = $this->Mod_result->get_correct_wrong_answer('upload/D_020217_1_1_2.TXT','upload/A_020217_1_1_2.txt');
//        var_dump($res);
//        exit;
        $this->load->view( 'result/view_add_result', $this->data );
    }
    
    public function processing_part_2()
    {
        array_push( $this->data['breadcrumb'], 'Processing Part II' );
        if ( $this->input->post() ) {
            $this->data['rec'] = $this->Mod_result->get_exam_student_part_2();
        }
        $this->load->view( 'result/view_add_result_part_2', $this->data );
    }
    
    public function save()
    {
        $this->form_validation->set_rules( 'exam_id', 'Exam', 'trim|required' );
        
        if ( $this->form_validation->run() == FALSE ) {
            $this->load->view( 'result/view_add_result', $this->data );
        } else {
            $res_flag = $this->Mod_result->save_data();
            
            if ( $res_flag['success'] ) {
                $this->session->set_flashdata( 'flashOK', 'Data added successfully' );
            } else {
                $this->session->set_flashdata( 'flashError', $res_flag['msg'] );
            }
            redirect( 'result/processing' );
        }
    }
    
    public function save_part_2()
    {
        $this->form_validation->set_rules( 'ids', 'ID', 'required' );
        //$this->form_validation->set_rules('obtained_mark', 'Marks Obtained');
        
        if ( $this->form_validation->run() == FALSE ) {
            $this->load->view( 'result/view_add_result_part_2', $this->data );
        } else {
            $res_flag = $this->Mod_result->save_data_part_2();
            if ( $res_flag['success'] ) {
                $this->session->set_flashdata( 'flashOK', 'Data Updated successfully!' );
            } else {
                $this->session->set_flashdata( 'flashError', $res_flag['msg'] );
            }
            redirect( 'result/processing_part_2' );
        }
    }
    
    public function records()
    {
        array_push( $this->data['breadcrumb'], 'Result List' );
        $row                 = 0;
        $temp_record_postion = $this->uri->segment( 3 );
        
        if ( !empty ( $temp_record_postion ) ) {
            $row = $temp_record_postion;
        } else {
            $this->session->unset_userdata( 'sql_where_session' );
        }
        
        $config['base_url']       = base_url() . 'result/paging';
        $config['total_rows']     = $this->Mod_result->count_records();
        $config['per_page']       = $this->record_per_page;
        $config['num_links']      = $this->record_num_links;
        $config['full_tag_open']  = '<p>';
        $config['full_tag_close'] = '</p>';
        $this->pagination->initialize( $config );
        
        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_result->count_records();
        $this->data['links']      = $this->pagination->create_links();
        
        $this->data['rec'] = $this->Mod_result->get_records_list( $this->record_per_page, $row );
        //$this->data['rec'] = $this->Mod_result->get_doctor_list();
        $this->load->view( 'result/view_result_list', $this->data );
    }
    
    public function print_res()
    {
        $this->data['rec']  = $this->Mod_result->get_search_data();
        $this->data['exam'] = $this->Mod_result->get_search_exam_data();
        $this->load->view( 'result/view_result_print', $this->data );
    }
    
    public function individual_result()
    {
        if ( $this->input->post() ) {
            $doc_id = $this->input->post( 'doc_id', TRUE );
            $this->load->model( 'Mod_student' );
            $this->data['doc']     = $this->Mod_common->get_row_data_by_id( 'sif_admission', $doc_id );
            $this->data['results'] = $this->Mod_student->get_student_result( $this->data['doc'] );
            $this->load->view( 'doctor/view_result', $this->data );
        } else {
			$this->data['doc_list'] = [ '' => 'Select Year, Session First' ];
            $this->load->view( 'result/view_individual_result', $this->data );
        }
    }
    
    public function download_individual_result( $doc_id = NULL )
    {
        if ( $doc_id ) {
            $this->load->model( 'Mod_student' );
            $this->data['doc']        = $this->Mod_common->get_row_data_by_id( 'sif_admission', $doc_id );
            $this->data['page_title'] = "Transcript - {$this->data['doc']->reg_no}";
            $this->data['results']    = $this->Mod_student->get_student_result( $this->data['doc'] );
            $pdf_data                 = $this->load->view( 'doctor/view_result_pdf', $this->data, TRUE );
//            echo $pdf_data;exit;
            $mpdf_bangla_config = mpdf_bangla_config( ['format' => 'A4-P'] );
            $mpdf               = new Mpdf\Mpdf( $mpdf_bangla_config );
            $mpdf->WriteHTML( $pdf_data );
            $mpdf->Output( url_title( $this->data['page_title'] ) . '.pdf', 'D' );
        } else {
            show_404();
        }
    }
    
    public function get_doc_list_by_year_session()
    {
        $doc_list = $this->Mod_common->get_doc_dropdown( TRUE );
        $options  = "";
        if ( $doc_list ) {
            foreach ( $doc_list as $id => $item ) {
                $options .= "<option value={$id}>{$item}</option>";
            }
        }
        echo $options;
        exit;
    }
    
    public function raw_mcq( $year = '2018', $session = '1', $unit = NULL, $fellow = NULL )
    {
        if ( $this->ion_auth->is_admin() ) {
            
            $year ? $this->db->where( 'year', $year ) : NULL;
            $session ? $this->db->where( 'session', $session ) : NULL;
            $unit ? $this->db->where( 'unit_id', $unit ) : NULL;
            $this->db->order_by( 'year, session, unit_id, exam_id, doc_id' );
            $query = $this->db->get( 'doc_exams' );
            
            if ( $query->num_rows() > 0 ) {
                $data['results']    = $query->result_array();
                $data['total_rows'] = $query->num_rows();
                $data['year']       = $year;
                $data['session']    = isset( $this->data['session_list'][$session] ) ? $this->data['session_list'][$session] : NULL;
                $data['unit']       = get_name_by_auto_id( 'module_units', $unit );
                $this->load->view( 'result/raw_mcq', $data );
            }
            
        } else {
            show_404();
        }
    }
    
    public function status_change( $doc_exam_id = NULL, $exam_id = NULL, $status = 9 )
    {
        if ( $this->ion_auth->is_admin() ) {
            if ( $doc_exam_id && $exam_id && $status ) {
                $response = $this->Mod_result->change_individual_doc_exams_status( $doc_exam_id, $status );
                
                if ( $response ) {
                    $this->session->set_flashdata( 'flashOK', 'Exam Status Changed' );
                } else {
                    $this->session->set_flashdata( 'flashError', 'Sorry! Exam Status cannot be Changed' );
                }
                
                redirect( "examination/fellow_list/$exam_id" );
            } else {
                show_error( "Doc Exam Id and Exam ID is required to perform the action" );
            }
        } else {
            show_404();
        }
    }
    
}
