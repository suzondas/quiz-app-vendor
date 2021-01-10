<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of application_form
 *
 * @author jnahian
 * Date : 02-March-2014
 * @property Mod_application $Mod_application
 */
class Application_form extends My_Controller{
    
    private $record_per_page = 20;
    private $record_num_links = 5;
//    private $data = '';
        
    public function __construct() {
        parent::__construct();
               
        $this->data['module_name']= "Application Form";
             
        $this->load->model('Mod_application');
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
        $this->data['session_list'] = $this->Mod_common->get_session_list();
        $this->data['shift_list'] = $this->Mod_common->get_shift_list();
        $this->data['medium_list'] = $this->Mod_common->get_medium_list();
    }
    
    function index(){
        $this->load->view('application_form/view_add_application_form',$this->data);      
    }
    
    function save(){        
        
        $photo_file_name = "";
        $this->form_validation->set_rules('first_name','First Name','required');
        /*$this->form_validation->set_rules('customer_name','Customer Name','required');
        $this->form_validation->set_rules('company_name','Company Name','required');
        $this->form_validation->set_rules('contact_person_name','Contact Person Name','required');
        $this->form_validation->set_rules('customer_email','Customer Email','required');
        $this->form_validation->set_rules('company_phone','Company Phone','required');
        $this->form_validation->set_rules('customer_mobile','Contact Person Mobile','required');
        $this->form_validation->set_rules('customer_address','Connectivity Address','required');
        $this->form_validation->set_rules('customer_billing_address','Billing Address','required');
        $this->form_validation->set_rules('price','Price','required');
        $this->form_validation->set_rules('duration','Customer Duration','required');
        $this->form_validation->set_rules('no_of_connection','No of Connection','required');
        $this->form_validation->set_rules('billing_plan','Billing Plan','required');
        $this->form_validation->set_rules('bandwith_limit','Bandwidth Limit','required');
        $this->form_validation->set_rules('bandwidth_type','Bandwidth Type','required');
        $this->form_validation->set_rules('ip_address','IP Address','required');
        $this->form_validation->set_rules('connection_type','Connection Type','required');*/
        
        if ($this->form_validation->run() == FALSE){
            $this->load->view('application_form/view_add_application_form',$this->data);
        }else{

            $res_flag = $this->Mod_application->save_data();

            if(!empty($res_flag)){
                $this->session->set_flashdata('flashOK', 'Data created successfully');
            }else{
                $this->session->set_flashdata('flashError', 'Failed to create data');
            }
            
            redirect('application_form');					
        }      
    }
    
    /*
     * admit card
     * pdf generate function
     */
    function pdf(){
        $this->load->helper('pdf_helper');   
        $auto_id =  $this->uri->segment(3);
        $application_no =  $this->uri->segment(4);
        
        if(!empty($auto_id)){
            $this->data['res'] = $this->Mod_application->get_app_form_details($auto_id);
            
            tcpdf();
            $obj_pdf = new TCPDF('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
            //$obj_pdf->SetCreator(PDF_CREATOR);
            $title = "School Management Software";
            $obj_pdf->SetTitle($title);
            // remove default header/footer
            $obj_pdf->SetTopMargin(5);
            $obj_pdf->SetLeftMargin(5);
            $obj_pdf->SetRightMargin(5);
            $obj_pdf->SetFont('helvetica', '', 10);
            $obj_pdf->setPrintHeader(false);
            $obj_pdf->setPrintFooter(false);
            $obj_pdf->AddPage();

            ob_start();
            //we can have any view part here like HTML, PHP etc
            //$this->load->view('application_form/view_admit_card_1', $this->data);
            $this->load->view('application_form/view_admit_card', $this->data);
            $content = ob_get_contents();
            ob_end_clean();
            $obj_pdf->writeHTML($content, true, false, true, false, '');

            $obj_pdf->Output($application_no.'.pdf', 'I');
        }
    }
    
    function edit(){
        $customer_id =  $this->uri->segment(3);
        $record_pos =  $this->uri->segment(4);
        $get_details =  $this->Mod_customer->get_details($customer_id);
        
        $this->data['res'] = $get_details;
        $this->data['record_pos'] = $record_pos;
        $this->load->view('customer/view_edit_customer',$this->data);      
    }
    
   
    function update(){
        $record_pos_hidden = $this->security->xss_clean($this->input->post('record_pos_hidden'));
        $customer_hidden_id = $this->security->xss_clean($this->input->post('customer_hidden_id'));
        $this->form_validation->set_rules('customer_id','Customer ID','required');
        $this->form_validation->set_rules('customer_name','Customer Name','required');
        $this->form_validation->set_rules('company_name','Company Name','required');
        $this->form_validation->set_rules('contact_person_name','Contact Person Name','required');
        $this->form_validation->set_rules('customer_email','Customer Email','required');
        $this->form_validation->set_rules('company_phone','Company Phone','required');
        $this->form_validation->set_rules('customer_mobile','Contact Person Mobile','required');
        $this->form_validation->set_rules('customer_address','Connectivity Address','required');
        $this->form_validation->set_rules('customer_billing_address','Billing Address','required');
        $this->form_validation->set_rules('price','Price','required');
        $this->form_validation->set_rules('duration','Customer Duration','required');
        $this->form_validation->set_rules('no_of_connection','No of Connection','required');
        $this->form_validation->set_rules('billing_plan','Billing Plan','required');
        $this->form_validation->set_rules('bandwidth_type','Bandwidth Type','required');
        $this->form_validation->set_rules('bandwith_limit','Bandwidth Limit','required');
        $this->form_validation->set_rules('ip_address','IP Address','required');
        $this->form_validation->set_rules('connection_type','Connection Type','required');
        
        if ($this->form_validation->run() == FALSE){
            
            $get_details =  $this->Mod_customer->get_details($customer_hidden_id);
        
            $this->data['res'] = $get_details;
            $this->data['record_pos'] = $record_pos_hidden;
            $this->load->view('customer/view_edit_customer',$this->data);
        }else{
            $res_flag = $this->Mod_customer->update_data();
            if(!empty($res_flag)){
                $this->session->set_flashdata('flashOK', 'Customer updated successfully');
            }else{
                $this->session->set_flashdata('flashError', 'Failed to update customer');
            }
            redirect('customer/customer_list/'.$record_pos_hidden);					
        }      
    }
    
    
    function records(){        
        $row = 0;
        $temp_record_postion = $this->uri->segment(3);
		
        if(!empty ($temp_record_postion)){
            $row = $temp_record_postion;
        }else{
            $this->session->unset_userdata('sql_where_session');
        }
        
        $config['base_url'] = base_url().'application_form/paging';        
        $config['total_rows'] = $this->Mod_application->count_application();
        $config['per_page'] =  $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $config['full_tag_open'] = '<p>';
        $config['full_tag_close'] = '</p>';
        $this->pagination->initialize($config);
        
        $this->data['record_pos'] = $row;    
        $this->data['total_rows'] = $this->Mod_application->count_application();
        $this->data['links']=$this->pagination->create_links();  
          
        $this->data['rec'] = $this->Mod_application->get_application_list($this->record_per_page,$row);
        $this->load->view('application_form/view_app_form_list',$this->data);
    }
    
    function paging() {
        $row = 0;
        $temp_record_postion = $this->uri->segment(3);
		
        if(!empty ($temp_record_postion)){
            $row = $temp_record_postion;
        }
        
        $config['base_url'] = base_url().'application_form/paging';        
        $config['total_rows'] = $this->Mod_application->count_application();
        $config['per_page'] =  $this->record_per_page;
        $config['num_links'] = $this->record_num_links;
        $config['full_tag_open'] = '<p>';
        $config['full_tag_close'] = '</p>';
        $this->pagination->initialize($config);
        
        $this->data['record_pos'] = $row;
        $this->data['total_rows'] = $this->Mod_application->count_application();
        $this->data['links']=$this->pagination->create_links();  
          
        $this->data['rec'] = $this->Mod_application->get_application_list($this->record_per_page,$row);
        $this->load->view('application_form/view_app_form_list',$this->data);
    }
    
    function view(){
        $auto_id =  $this->uri->segment(3);
        $get_details =  $this->Mod_customer->get_details($auto_id);
        
        $this->data['res'] = $get_details;
        $this->load->view('customer/view_details_customer',$this->data);  
    }
    
}