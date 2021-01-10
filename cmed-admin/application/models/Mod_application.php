<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_application
 *
 * @author jnahian
 */
class Mod_application extends CI_Model
{

    public function __construct()
    {
        parent::__construct();

    }

    function save_data()
    {
        $write_db = $this->load->database('write', TRUE); /* database conection for write operation */
        $current_month = date('m');
        $current_date_time = date('Y-m-d H:i:s');
        $created_by = $this->session->userdata('admin_login_email');
        $app_id = "";
        $app_sl = "";
        $res_app_id = $this->common_lib->get_app_id();

        $app_id = $res_app_id['app_id'];
        $app_sl = $res_app_id['app_sl'];

        $data_arry = array(
            'app_sl' => $app_sl,
            'app_id' => $app_id,
            'first_name' => $this->security->xss_clean($this->input->post('first_name')),
            'middle_name' => $this->security->xss_clean($this->input->post('middle_name')),
            'last_name' => $this->security->xss_clean($this->input->post('last_name')),
            'dob' => $this->security->xss_clean($this->input->post('dob')),
            'gender' => $this->security->xss_clean($this->input->post('gender')),
            'nationality' => $this->security->xss_clean($this->input->post('nationality')),
            'religion' => $this->security->xss_clean($this->input->post('religion')),
            'candidate_for_class' => $this->security->xss_clean($this->input->post('candidate_for_class')),
            'year' => $this->security->xss_clean($this->input->post('year')),
            'month' => $current_month,
            'session' => $this->security->xss_clean($this->input->post('session')),
            'shift' => $this->security->xss_clean($this->input->post('shift')),
            'medium' => $this->security->xss_clean($this->input->post('medium')),
            'email' => $this->security->xss_clean($this->input->post('email')),
            'cell_no' => $this->security->xss_clean($this->input->post('cell_no')),
            'f_name' => $this->security->xss_clean($this->input->post('f_name')),
            'f_cell_no' => $this->security->xss_clean($this->input->post('f_cell_no')),
            'f_edu_qua' => $this->security->xss_clean($this->input->post('f_edu_qua')),
            'f_occupation' => $this->security->xss_clean($this->input->post('f_occupation')),
            'f_designation' => $this->security->xss_clean($this->input->post('f_designation')),
            'f_home_add' => $this->security->xss_clean($this->input->post('f_home_add')),
            'f_tele_no' => $this->security->xss_clean($this->input->post('f_tele_no')),
            'm_name' => $this->security->xss_clean($this->input->post('m_name')),
            'm_cell_no' => $this->security->xss_clean($this->input->post('m_cell_no')),
            'm_edu_qua' => $this->security->xss_clean($this->input->post('m_edu_qua')),
            'm_occupation' => $this->security->xss_clean($this->input->post('m_occupation')),
            'm_designation' => $this->security->xss_clean($this->input->post('m_designation')),
            'm_home_add' => $this->security->xss_clean($this->input->post('m_home_add')),
            'm_tele_no' => $this->security->xss_clean($this->input->post('m_tele_no')),
            'created_by' => $created_by,
            'created_date_time' => $current_date_time,
            'status' => 'P',
        );

        $db_res_flag = $write_db->insert('application', $data_arry); /* call active record functio to save information  */

        if (!empty($db_res_flag)) {
            return true;
        } else {
            return false;
        }
    }

    function get_app_form_details($app_form_auto_id)
    {
        $read_db = $this->load->database('read', TRUE); /* database connection for read operation */

        $query = $read_db->where("id", $app_form_auto_id);
        $query = $read_db->get('application');

        if ($query->num_rows() > 0) {
            $record = $query->row();

            return $record;
        } else {
            return null;
        }
    }

    function count_application()
    {
        $read_db = $this->load->database('read', TRUE); /* database conection for read operation */

        $sql_where = "";
        $name = "";
        $candidate_for_class = "";
        $session = "";
        $f_name = "";
        $m_name = "";
        $from_date_time = "";
        $to_date_time = "";
        $status_type = "P";

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            $name = $this->security->xss_clean($this->input->post('name'));
            $candidate_for_class = $this->security->xss_clean($this->input->post('candidate_for_class'));
            $session = $this->security->xss_clean($this->input->post('session'));
            $f_name = $this->security->xss_clean($this->input->post('f_name'));
            $m_name = $this->security->xss_clean($this->input->post('m_name'));

            $from_date_time = $this->security->xss_clean($this->input->post('from_date_time'));
            $to_date_time = $this->security->xss_clean($this->input->post('to_date_time'));
            $status_type = $this->security->xss_clean($this->input->post('status_type'));

            $sql_where .= "id != ''";

            if (!empty($name)) {
                $sql_where .= " and first_name like '%$name%'";
            }
            if (!empty($candidate_for_class)) {
                $sql_where .= " and candidate_for_class = '$candidate_for_class'";
            }
            if (!empty($session)) {
                $sql_where .= " and session = '$session'";
            }
            if (!empty($f_name)) {
                $sql_where .= " and f_name like '%$f_name%'";
            }
            if (!empty($m_name)) {
                $sql_where .= " and m_name like '%$m_name%'";
            }
            if (!empty($from_date_time) and !empty($to_date_time)) {
                $final_date_from = $from_date_time . " 00:00:00";
                $final_date_to = $to_date_time . " 23:59:59";
                $sql_where .= " and created_date_time BETWEEN '$final_date_from' AND '$final_date_to'";
            }
            if (!empty($status_type)) {
                $sql_where .= " and status = '$status_type'";
            }
            $this->session->unset_userdata('sql_where_session');
            $this->session->set_userdata('sql_where_session', $sql_where);

        } else {
            $sql_where = $this->session->userdata('sql_where_session');
        }

        if ($sql_where != "") {
            $read_db->where($sql_where);
        }

        $read_db->where('status !=', $status_type);
        $query = $read_db->select('id');
        $query = $read_db->get('application');

        return $query->num_rows();
    }

    function get_application_list($limit = 20, $row = 0)
    {
        $read_db = $this->load->database('read', TRUE); /* database conection for read operation */

        $result = "";
        $sql_where = "";
        $name = "";
        $candidate_for_class = "";
        $session = "";
        $f_name = "";
        $m_name = "";
        $from_date_time = "";
        $to_date_time = "";
        $status_type = "A";

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            $name = $this->security->xss_clean($this->input->post('name'));
            $candidate_for_class = $this->security->xss_clean($this->input->post('candidate_for_class'));
            $session = $this->security->xss_clean($this->input->post('session'));
            $f_name = $this->security->xss_clean($this->input->post('f_name'));
            $m_name = $this->security->xss_clean($this->input->post('m_name'));

            $from_date_time = date('Y-m-d', strtotime($this->security->xss_clean($this->input->post('from'))));
            $to_date_time = $this->security->xss_clean($this->input->post('to'));
            $status_type = $this->security->xss_clean($this->input->post('status_type'));

            $sql_where .= "id != '' and status != 'A'";

            if (!empty($name)) {
                $sql_where .= " and first_name like '%$name%'";
            }
            if (!empty($candidate_for_class)) {
                $sql_where .= " and candidate_for_class = '$candidate_for_class'";
            }
            if (!empty($session)) {
                $sql_where .= " and session = '$session'";
            }
            if (!empty($f_name)) {
                $sql_where .= " and f_name like '%$f_name%'";
            }
            if (!empty($m_name)) {
                $sql_where .= " and m_name like '%$m_name%'";
            }

            if (!empty($from_date_time) and !empty($to_date_time)) {
                $final_date_from = $from_date_time . " 00:00:00";
                $final_date_to = $to_date_time . " 23:59:59";
                $sql_where .= " and created_date_time BETWEEN '$final_date_from' AND '$final_date_to'";
            }
            if (!empty($status_type)) {
                $sql_where .= " and status != '$status_type'";
            }
            $this->session->unset_userdata('sql_where_session');
            $this->session->set_userdata('sql_where_session', $sql_where);
        } else {
            $sql_where = $this->session->userdata('sql_where_session');
        }
        if ($sql_where != "") {
            $read_db->where($sql_where);
        }
        $read_db->where('status !=', $status_type);
        $query = $read_db->order_by("id", 'DESC');
        $query = $read_db->get('application', $limit, $row);

        if ($query->num_rows() > 0) {
            $result = $query->result();
        }

        return $result;
    }

}

