<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_teacher
 *
 * @author jnahian
 */
class Mod_visitor extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        //$this->load->model('mod_file_upload');
    }



    function save_data($user_email){

        $data_visitor = array(
            'name' => $this->input->post('name',TRUE),
            'visitor_type' => $this->input->post('visitor_type',TRUE),
            'purpose'      => $this->input->post('purpose',TRUE),
            'med_coll'     => $this->input->post('med_coll',TRUE),
            'course'       => $this->input->post('course',TRUE),
            'subject'      => $this->input->post('subject',TRUE),
            'degree'       => $this->input->post('degree',TRUE),
            'mobile'       => $this->input->post('mobile',TRUE),
            'email'        => $this->input->post('email',TRUE),
            'created_by'   => $user_email,
            'created_at'   => database_formatted_date(),
            'status'       => '1',
        );

        $result = $this->db->insert('sif_visitor',$data_visitor);
        if($result)
        {
            return TRUE;
        }else{
            return FALSE;
        }
    }


    function get_records_list($limit = 20, $row = 0)
    {

        $sql_where = "";
        $name = "";
        $mobile = "";
        $from_date_time = "";
        $to_date_time = "";
        $visitor_type = "";

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            $name = $this->security->xss_clean($this->input->post('name'));
            $mobile = $this->security->xss_clean($this->input->post('mobile'));

            $from_date_time = $this->security->xss_clean($this->input->post('from_date_time'));
            $to_date_time = $this->security->xss_clean($this->input->post('to_date_time'));
            
            $visitor_type = $this->security->xss_clean($this->input->post('visitor_type'));

            $sql_where .= "id != ''";

            if (!empty($name)) {
                $sql_where .= " and name = '$name'";
            }
            if (!empty($mobile)) {
                $sql_where .= " and mobile = '$mobile'";
            }
            
            if (!empty($visitor_type)) {
                $sql_where .= " and visitor_type = '$visitor_type'";
            }
            
            if (!empty($from_date_time) and !empty($to_date_time)) {
                $final_date_from = date('Y-m-d', strtotime($from_date_time)) . " 00:00:00";
                $final_date_to = date('Y-m-d', strtotime($to_date_time)) . " 23:59:59";
                $sql_where .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
            }
//            if (!empty($status)) {
//                $sql_where .= " and status = '$status'";
//            }
            $this->session->unset_userdata('sql_where_session');
            $this->session->set_userdata('sql_where_session', $sql_where);

        } else {
            $sql_where = $this->session->userdata('sql_where_session');
        }

        if ($sql_where != "") {
            $this->db->where($sql_where);
        }
        $query = $this->db->order_by("id", 'DESC');
        $query = $this->db->get('sif_visitor', $limit, $row);

        if ($query->num_rows() > 0) {
            $results = $query->result();
            return $results;
        }
        //echo $read_db->last_query();
        return FALSE;
    }

    function count_records()
    {
        //$read_db = $this->load->database('read', TRUE); /* database conection for read operation */

        $sql_where = "";
        $name = "";
        $mobile = "";
        $from_date_time = "";
        $to_date_time = "";
        // $status = "";

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            $name = $this->security->xss_clean($this->input->post('name'));
            $mobile = $this->security->xss_clean($this->input->post('mobile'));

            $from_date_time = $this->security->xss_clean($this->input->post('from_date_time'));
            $to_date_time = $this->security->xss_clean($this->input->post('to_date_time'));

            $sql_where .= "id != ''";

            if (!empty($name)) {
                $sql_where .= " and name = '$name'";
                //echo $tec_name;exit;
            }
            if (!empty($mobile)) {
                $sql_where .= " and mobile = '$mobile'";
            }
            if (!empty($from_date_time) and !empty($to_date_time)) {
                $final_date_from = date('Y-m-d', strtotime($from_date_time)) . " 00:00:00";
                $final_date_to = date('Y-m-d', strtotime($to_date_time)) . " 23:59:59";
                $sql_where .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
            }
//            if (!empty($status)) {
//                $sql_where .= " and status = '$status'";
//            }
            $this->session->unset_userdata('sql_where_session');
            $this->session->set_userdata('sql_where_session', $sql_where);

        } else {
            $sql_where = $this->session->userdata('sql_where_session');
        }

        if ($sql_where != "") {
            $this->db->where($sql_where);
        }

        $query = $this->db->select('id');
        $query = $this->db->get('sif_visitor');
        if($query){
            return $query->num_rows();
        }else{
            return FALSE;
        }
    }

    public function get_details($id){
        $this->db->select('*');
        $this->db->where('id',$id);
        $query = $this->db->get('sif_visitor');
        if($query->num_rows()>0)
        {
            return $query->row();
        }else{
            return FALSE;
        }
    }

    public function update_data($user_email,$auto_id){

        $data_visitor = array(
            'name' => $this->input->post('name',TRUE),
            'visitor_type' => $this->input->post('visitor_type',TRUE),
            'purpose' => $this->input->post('purpose',TRUE),
            'med_coll' => $this->input->post('med_coll',TRUE),
            'course' => $this->input->post('course',TRUE),
            'subject' => $this->input->post('subject',TRUE),
            'degree' => $this->input->post('degree',TRUE),
            'mobile' => $this->input->post('mobile',TRUE),
            'email' => $this->input->post('email',TRUE),
            'updated_by' => $user_email,
            'status' => '1',
        );
        $this->db->where('id',$auto_id);
        $query = $this->db->update('sif_visitor',$data_visitor);
        if($query){
            return TRUE;
        }else{
            return FALSE;
        }
    }

}

