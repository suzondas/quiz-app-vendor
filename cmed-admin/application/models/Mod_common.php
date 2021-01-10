<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of mod_common
 *
 * @author jnahian
 */
class Mod_common extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		
	}
	
	function get_accounts_group_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 'active' );
		$query      = $this->db->order_by( 'name', 'ASC' );
		$query      = $this->db->get( 'accounts_group' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_expense_type_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'accounts_group_id', '2' );
		$query      = $this->db->where( 'status', 'active' );
		$query      = $this->db->order_by( 'name', 'ASC' );
		$query      = $this->db->get( 'accounts_name' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	
	function get_income_type_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'accounts_group_id', '1' );
		$query      = $this->db->where( 'status', 'active' );
		$query      = $this->db->order_by( 'name', 'ASC' );
		$query      = $this->db->get( 'accounts_name' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	/*
     * return accounts total balance
     */
	function get_acounts_balance()
	{
		$this->db    = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$res_income  = "";
		$res_expense = "";
		$res_balance = "";
		
		$query_income = $this->db->query( 'select SUM(`amount`) as `total_income` from `accounts_transaction` where accounts_group_id = "1"', FALSE );
		$res_income   = $query_income->row()->total_income;
		
		$query_expense = $this->db->query( 'select SUM(`amount`) as `total_expense` from `accounts_transaction` where accounts_group_id = "2"', FALSE );
		$res_expense   = $query_expense->row()->total_expense;
		
		return $res_balance = $res_income - $res_expense;
	}
	
	function get_class_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'class' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_session_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name,start_month' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'name', 'ASC' );
		$query      = $this->db->get( 'session' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_fee_type_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'fee_type' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_student_details( $student_id )
	{
		$this->db = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		
		$query = $this->db->where( "student_id", $student_id );
		//$query = $this->db->where("status",1);
		$query = $this->db->get( 'student_info_master' );
		
		if ( $query->num_rows() > 0 ) {
			$record            = $query->row();
			$full_name         = array( $record->first_name, $record->middle_name, $record->last_name );
			$record->full_name = implode( ' ', $full_name );
			return $record;
		} else {
			return NULL;
		}
	}
	
	function get_fee_details_by_class_fee_type_id( $fee_type_id = NULL, $class_id = NULL )
	{
		
		$this->db = $this->load->database( 'read', TRUE );
		$res      = "";
		//$query = $this->db->select('id,fee_amount');
		$query = $this->db->where( "fee_type_id", $fee_type_id );
		$query = $this->db->where( "class_id", $class_id );
		$query = $this->db->where( "status", 1 );
		$query = $this->db->get( 'academic_fee_details' );
		
		if ( $query->num_rows() > 0 ) {
			$res = $query->row();
			return $res;
		} else {
			return NULL;
		}
	}
	
	function get_student_list_by_class_id( $class_id = NULL )
	{
		
		$this->db = $this->load->database( 'read', TRUE );
		$res      = "";
		$query    = $this->db->select( 'id,student_id' );
		$query    = $this->db->where( "candidate_for_class", $class_id );
		$query    = $this->db->where( "status", 1 );
		$query    = $this->db->get( 'student_info_master' );
		
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			return $res;
		} else {
			return NULL;
		}
	}
	
	function get_exam_term_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'exam_term' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		return $data_arry;
	}
	
	function get_exam_type_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'exam_type' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		return $data_arry;
	}
	
	function get_subject_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'subject' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_section_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'section' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_group_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'group' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_subject_array()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'subject' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_exam_info_list()
	{
		
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'exams' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_exam_info_list_part_2()
	{
		
		$data_arry  = '';
		$query      = $this->db->select( 'id,exam_name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'sif_exam_fcps_part2' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->exam_name;
			}
		}
		
		return $data_arry;
	}
	
	function get_session_details( $auto_id )
	{
		
		
		$query = $this->db->where( "id", $auto_id );
		$query = $this->db->get( 'session' );
		
		if ( $query->num_rows() > 0 ) {
			$record = $query->row();
			return $record;
		} else {
			return NULL;
		}
	}
	
	public function get_doc_year_session( $auto_id )
	{
		$this->db->select( 'id, year, session' );
		$this->db->where( "id", $auto_id );
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$record = $query->row();
			return $record;
		} else {
			return NULL;
		}
	}
	
	function get_auto_data_by_exam_id( $exam_auto_id )
	{
		$this->db = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$query    = $this->db->select( 'id,exam_name,full_marks' );
		$query    = $this->db->where( "id", $exam_auto_id );
		
		$query = $this->db->get( 'examination_info' );
		
		if ( $query->num_rows() > 0 ) {
			$record = $query->row();
			return $record;
		} else {
			return NULL;
		}
	}
	
	function get_fee_code_by_fee_type_id( $id = NULL )
	{
		
		$this->db = $this->load->database( 'read', TRUE );
		$res      = "";
		$query    = $this->db->select( 'id,code' );
		$query    = $this->db->where( "id", $id );
		$query    = $this->db->where( "status", 1 );
		$query    = $this->db->get( 'fee_type' );
		
		if ( $query->num_rows() > 0 ) {
			$res = $query->row()->code;
			return $res;
		}
	}
	
	function get_shift_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'short_name,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'shift' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->short_name] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_medium_list()
	{
		$this->db   = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry  = '';
		$query      = $this->db->select( 'id,name' );
		$query      = $this->db->where( 'status', 1 );
		$query      = $this->db->order_by( 'id', 'ASC' );
		$query      = $this->db->get( 'medium' );
		$data_array = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->name;
			}
		}
		
		return $data_arry;
	}
	
	function get_student_list()
	{
		$this->db  = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry = '';
		$query     = $this->db->select( 'id,first_name,middle_name,last_name' );
		$query     = $this->db->where( 'status', 'A' );
		$query     = $this->db->order_by( 'first_name', 'ASC' );
		$query     = $this->db->get( 'student_info_master' );
		if ( $query->num_rows() > 0 ) {
			$res = $query->result();
			//$data_array = ['' => 'Select'];
			foreach ( $res as $item ) {
				$data_arry[$item->id] = $item->first_name . " " . $item->middle_name . " " . $item->last_name;
			}
		}
		
		return $data_arry;
	}
	
	function get_student_list2()
	{
		$this->db  = $this->load->database( 'read', TRUE ); /* database conection for read operation */
		$data_arry = '';
		$query     = $this->db->select( 'id,first_name,middle_name,last_name, student_id' );
		$query     = $this->db->where( 'status', 'A' );
		$query     = $this->db->order_by( 'first_name', 'ASC' );
		$query     = $this->db->get( 'student_info_master' );
		if ( $query->num_rows() > 0 ) {
			$res        = $query->result();
			$data_array = [ '' => 'Select' ];
			foreach ( $res as $item ) {
				$data_arry[$item->student_id] = $item->first_name . " " . $item->middle_name . " " . $item->last_name;
			}
		}
		
		return $data_arry;
	}
	
	function get_cwstuid( $student_id )
	{
		$this->db = $this->load->database( 'read', TRUE );
		$this->db->select( 'class_wise_student_id' );
		$this->db->where( 'student_id', $student_id );
		$this->db->order_by( 'class', 'DESC' );
		$this->db->order_by( 'updated_at', 'DESC' );
		$qr = $this->db->get( 'student_class_info' );
		
		if ( $qr->num_rows() > 0 ) {
			return $qr->row()->class_wise_student_id;
		}
		
		return FALSE;
	}
	
	public function get_sent_to_list( $value = '' )
	{
		$list = array(
			'A' => 'ALL',
			'S' => 'Students',
			'P' => 'Parents',
			'T' => 'Teachers',
		);
		
		if ( $value ) {
			$list = $list[$value];
		}
		
		return $list;
	}
	
	public function get_teachers_array( $select = TRUE )
	{
		$this->db->select( 'id,tec_name' );
		$this->db->where( 'status', 1 );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			if ( $select ) {
				$return = array( '' => 'Select' );
			} else {
				$return = [];
			}
			foreach ( $results as $result ) {
				$return[$result->id] = $result->tec_name;
			}
			
			return $return;
		}
		return FALSE;
	}
	
	public function get_executive_array( $type = 1 )
	{
		$this->db->select( 'id,name' );
		$this->db->where( 'status', 1 );
		$type ? $this->db->where( 'emp_type', $type ) : '';
		$query = $this->db->get( 'sif_exe_stuff' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			$return  = array( '' => 'Select' );
			foreach ( $results as $result ) {
				$return[$result->id] = $result->name;
			}
			
			return $return;
		}
		return FALSE;
	}
	
	public function get_module_array( $course = 1 )
	{
		$this->db->select( 'id,name' );
		$course ? $this->db->where( 'course_id', $course ) : '';
		$this->db->order_by( 'sl', 'ASC' );
		$query = $this->db->get( 'modules' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			$return  = array( '' => 'Select' );
			foreach ( $results as $result ) {
				$return[$result->id] = $result->name;
			}
			
			return $return;
		}
		return FALSE;
	}
	
	public function get_room_list()
	{
		$data = array( '' => 'Select' );
		return $data;
	}
	
	function get_division_list()
	{
		$data_arry = '';
		$query     = $this->db->select( 'DIVISION_ID,DIVISION_NAME' );
		$query     = $this->db->order_by( 'DIVISION_NAME', 'ASC' );
		$query     = $this->db->get( 'divisions' );
		if ( $query->num_rows() > 0 ) {
			$res        = $query->result();
			$data_array = [ '' => 'Select' ];
			foreach ( $res as $item ) {
				$data_arry[$item->DIVISION_ID] = $item->DIVISION_NAME;
			}
		}
		
		return $data_arry;
	}
	
	function get_district_list_div( $division_id = NULL )
	{
		
		
		$query = $this->db->select( 'DISTRICT_ID,DISTRICT_NAME' );
		$query = $this->db->order_by( 'DISTRICT_NAME', 'ASC' );
		if ( $division_id ) {
			$query = $this->db->where( 'DIVISION_ID', $division_id );
		}
		$query  = $this->db->get( 'districts' );
		$result = $query->result();
		//echo $this->db->last_query();
		//$url = base_url().'collegeregistration/';
		$options = array( '' => 'Select' );
		foreach ( $result as $item ) {
			$options[$item->DISTRICT_ID] = $item->DISTRICT_NAME;
			//$options .= '<option value="'.$item->DISTRICT_ID.'">'.$item->DISTRICT_NAME.'</option>';
		}
		
		return $options;
	}
	
	function get_upazila_list_dist( $dis_id = NULL )
	{
		
		$query = $this->db->select( 'THANA_ID,THANA_NAME' );
		$query = $this->db->order_by( 'THANA_NAME', 'ASC' );
		if ( $dis_id ) {
			$query = $this->db->where( 'DISTRICT_ID', $dis_id );
		}
		$query  = $this->db->get( 'thanas' );
		$result = $query->result();
		//echo $this->db->last_query();
		
		$options = array( '' => 'Select' );
		foreach ( $result as $item ) {
//            $options .= '<option value="' . $item->THANA_ID . '">' . $item->THANA_NAME . '</option>';
			$options[$item->THANA_ID] = $item->THANA_NAME;
		}
		return $options;
	}
	
	public function get_class_topic_list()
	{
		$query  = $this->db->select( 'id,class_topic_name' );
		$query  = $this->db->order_by( 'course_code,faculty_code,class_topic_name', 'ASC' );
		$query  = $this->db->get( 'sif_class_topic' );
		$result = $query->result();
		
		$options = array( ' ' => 'Select' );
		foreach ( $result as $item ) {
			$options[$item->id] = $item->class_topic_name;
		}
		return $options;
	}
	
	public function get_rooms_array()
	{
		$query  = $this->db->select( 'id,floor,room_name' );
		$query  = $this->db->order_by( 'floor,room_name', 'ASC' );
		$query  = $this->db->get( 'sif_room_type' );
		$result = $query->result();
		
		$options = array( '' => 'Select' );
		foreach ( $result as $item ) {
			$options[$item->id] = "$item->floor-$item->room_name";
		}
		return $options;
	}
	
	
	public function get_batch_wise_doc_list( $where_array = NULL )
	{
//        $this->db->select('id,reg_no');
		if ( !$where_array ) {
			$where_array = array(
				'year'         => $this->input->post( 'year', TRUE ),
				'session'      => $this->input->post( 'session', TRUE ),
				'course_code'  => $this->input->post( 'course_code', TRUE ),
				'faculty_code' => $this->input->post( 'faculty_code', TRUE ),
				'batch_code'   => $this->input->post( 'batch_code', TRUE ),
			);
		}
		if ( $where_array || $this->input->post() ) {
			$this->db->where( $where_array );
		}
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_row_data_by_id( $tablename, $id )
	{
		$this->db->where( 'id', $id );
		$query = $this->db->get( $tablename );
		if ( $query->num_rows() == 1 ) {
			return $query->row();
		}
		return FALSE;
	}
	
	public function get_teacher_id( $id )
	{
		$this->db->where( 'id', $id );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() == 1 ) {
			return $query->row()->teacher_id;
		}
		return FALSE;
	}
	
	public function get_results_reg( $year, $session, $reg )
	{
		return date( 'y', strtotime( $year ) ) . $session . $reg;
	}
	
	public function get_group_array()
	{
		$data   = array( '' => 'Select' );
		$groups = $this->ion_auth->groups()->result();
		foreach ( $groups as $group ) {
			$data[$group->id] = $group->description;
		}
		return $data;
	}
	
	public function get_acct_head_list( $type = NULL )
	{
		$data  = array( '' => 'Select' );
		$heads = $this->get_acct_heads( $type );
		
		if ( $heads ) {
			foreach ( $heads as $head ) {
				$data[$head->CTRLCODE . "." . $head->SUBCODE] = $head->ACCHEAD;
			}
		}
		return $data;
	}
	
	public function get_acct_heads( $type = NULL )
	{
		$this->db->where( 'ACTIVE', 'T' );
		$type ? $this->db->where( 'ACCTYPE', $type ) : '';
		$query = $this->db->get( 'acct_head' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_acct_head( $id = NULL )
	{
		$this->db->where( 'ACTIVE', 'T' );
		$id ? $this->db->where( 'AH_ID', $id ) : '';
		$query = $this->db->get( 'acct_head' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		return FALSE;
	}
	
	public function get_acct_head_from_code( $code = NULL )
	{
		$this->db->where( 'ACTIVE', 'T' );
		$code ? $this->db->where( 'CONCAT("CTRLCODE",".","SUBCODE")', $code ) : '';
		$query = $this->db->get( 'acct_head' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		return FALSE;
	}
	
	public function getDocModuleDetails( $doc_id = NULL, $module_id = NULL )
	{
		$where = [];
		if ( $module_id ) $where['id'] = $module_id;
		$query = $this->db->where( $where )->get( 'modules' );
		
		if ( $query->num_rows() == 1 ) {
			$data = [
				'module' => $query->row(),
				'units'  => $this->get_module_units( $module_id, $doc_id ),
			];
			
			return $data;
		} elseif ( $query->num_rows() > 1 ) {
			$data = [];
			foreach ( $query->result() as $row ) {
				$data[] = [
					'module' => $row,
					'units'  => $this->get_module_units( $row->id, $doc_id ),
				];
			}
			return $data;
		}
		
		return FALSE;
	}
	
	public function get_module_units( $module_id, $doc_id = NULL )
	{
		$this->db->select( [ 'units.id', 'units.course_id', 'units.module_id', 'units.code', 'units.name', 'units.duration', 'units.status' ] );
		$this->db->where( 'module_id', $module_id );
		$q2 = $this->db->get( 'module_units units' );
		
		if ( $q2->num_rows() > 0 ) {
			$results = $q2->result();
			foreach ( $results as $result ) {
				$result->teacher = $this->get_module_unit_teacher( $doc_id, $result->module_id, $result->id );
			}
			return $results;
		} else {
			return FALSE;
		}
		
	}
	
	public function get_module_unit_teacher( $doc_id, $module_id, $unit_id, $year = '2018', $session = '7' )
	{
		$this->db->select( 'T.id, T.teacher_id, T.tec_name name,T.gender,T.mobile, T.email,T.photo,T.status' );
		$this->db->where( 'TD.doc_id', $doc_id );
		$this->db->where( 'TD.module', $module_id );
		$this->db->where( 'TD.unit', $unit_id );
//        $this->db->where( 'TD.year', $year );
//        $this->db->where( 'TD.session', $session );
		$this->db->where( 'T.status', 1 );
//        $this->db->join( 'sif_admission A', 'TD.doc_id = A.id' );
		$this->db->join( 'sif_teacher T', 'TD.teacher_id = T.teacher_id' );
		$this->db->order_by( 'TD.unit', 'desc' );
		$query = $this->db->get( 'assigned_teacher_doctors TD', 1 );
		if ( $query->num_rows() == 1 ) {
			return $query->row();
		}
		return FALSE;
	}
	
	public function get_module_teacher( $doc_id, $module_id )
	{
		$this->db->select( 'T.id, T.teacher_id, T.tec_name,T.gender,T.mobile, T.email,T.photo,T.status' );
		$this->db->where( 'TD.doc_id', $doc_id );
		$this->db->where( 'TD.module', $module_id );
		$this->db->where( 'T.status', 1 );
//        $this->db->join( 'sif_admission A', 'TD.doc_id = A.id' );
		$this->db->join( 'sif_teacher T', 'TD.teacher_id = T.teacher_id' );
		$this->db->order_by( 'TD.unit', 'desc' );
		$query = $this->db->get( 'assigned_teacher_doctors TD', 1 );
		if ( $query->num_rows() == 1 ) {
			return $query->row();
		}
		return FALSE;
	}
	
	public function getUnitDetails( $id )
	{
		
		$q2 = $this->db->where( 'id', $id )->get( 'module_units' );
		
		if ( $q2->num_rows() > 0 ) {
			return $q2->row();
		}
		
		return FALSE;
	}
	
	public function getUnitAttachments( $id )
	{
		
		$q2 = $this->db->where( 'unit_id', $id )->get( 'unit_attachments' );
		
		if ( $q2->num_rows() > 0 ) {
			return $q2->result();
		}
		
		return FALSE;
	}
	
	public function get_question_anserws( $id, $where = [] )
	{
		if ( count( $where ) ) $this->db->where( $where );
		$this->db->where( 'master_ref_id', $id );
		$this->db->order_by( 'index_seqn' );
		$query = $this->db->get( 'oe_qsn_bnk_ans' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	public function exam_time_validation( $doc_exam )
	{
		$duration = floatval( $doc_exam->duration ) + 30; // add more 30 sec to auto-submit form
		$now      = time();
		$time     = strtotime( $doc_exam->start_time );
		
		$diff = abs( $now - $time ) / 60;
		
		if ( $duration >= $diff ) {
			return TRUE;
		}
		
		return FALSE;
	}
	
	public function get_exam_rules()
	{
		$query = $this->db->where( [ 'status' => 1, 'slug' => 'exam-rules' ] )->get( 'pages' );
		
		if ( $query->num_rows() > 0 ) {
			$row = $query->last_row();
			return $row->details;
		}
		
		return FALSE;
	}
	
	public function getCurrentModuleUnit()
	{
		$query = $this->db
			->select( [ 'module', 'unit', 'doc_id' ] )
			->order_by( 'year, session, created_at', 'desc' )
			->get( 'assigned_teacher_doctors' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		
		return FALSE;
	}
	
	public function get_doc_dropdown( $all = FALSE )
	{
		$where = [];
		if ( !$all ) {
			$where['status'] = 1;
		} else {
			$this->db->where_in( 'status', [ 1, 2 ] );
		}
		$year    = $this->input->post( 'year', TRUE );
		$session = $this->input->post( 'session', TRUE );
		$year ? $where['year'] = $year : NULL;
		$session ? $where['session'] = $session : NULL;
		$query = $this->db->select( 'id, doc_name' )->where( $where )->order_by( 'reg_no' )->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$results = $query->result_array();
			
			return array_column( $results, 'doc_name', 'id' );
		}
		return FALSE;
	}
	
	public function make_dropdown( $tablename, $where, $name = 'name', $id = 'id' )
	{
		$this->db->select( "$id, $name" );
		$where ? $this->db->where( $where ) : NULL;
		$this->db->where( 'status', 1 );
		$query = $this->db->get( $tablename );
		
		$options = [ '' => 'Select' ];
		if ( $query->num_rows() > 0 ) {
			$results = $query->result_array();
			
			$options += array_column( $results, $name, $id );
		}
		
		return $options;
	}
	
	
}//end class
