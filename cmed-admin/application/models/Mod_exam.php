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
class Mod_exam extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
		//$this->load->model('mod_file_upload');
		$this->load->model( 'Mod_common' );
	}

	function get_exam_list()
	{

		$query = $this->db->order_by( "id", 'ASC' );
		$query = $this->db->get( 'exams_type' );

		if ( $query->num_rows() > 0 ) {
			$result = $query->result();
		}

		return $result;
	}

	function get_exam_list_array()
	{
		$list = $this->get_exam_list();
		$array = array( '' => 'Select' );
		foreach ( $list as $exam ) {
			$array[$exam->id] = $exam->exam_name;
		}
		return $array;
	}

	function get_exam_list_array_2()
	{
		$list = $this->get_exam_list();
		$array = array( '' => 'Select' );
		foreach ( $list as $exam ) {
			$array[$exam->id] = $exam->exam_name;
		}
		return $array;
	}

	function get_question_list( $module_id = NULL, $unit_id = NULL )
	{
		$this->db->select( 'id, question_name name' );

		if ( $module_id ) {
			$this->db->where( 'module', $module_id );
		}
		if ( $unit_id ) {
			$this->db->where( 'unit', $unit_id );
		}

		$this->db->where( 'status', 1 );
		$query = $this->db->get( 'oe_qsn_bnk_master' );

		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			$array = array();
			foreach ( $results as $result ) {
				$array[$result->id] = strip_tags( $result->name );
			}
		} else {
			$array = array( '' => 'Select' );
		}

		return $array;
	}

	function get_exam_records( $limit = 20, $row = 0 )
	{

		$sql_where = "";

		if ( $this->input->server( 'REQUEST_METHOD' ) === 'POST' ) {
			$year = $this->security->xss_clean( $this->input->post( 'year' ) );
			$session = $this->security->xss_clean( $this->input->post( 'session' ) );
			$module_id = $this->security->xss_clean( $this->input->post( 'module_id' ) );
			$from_date_time = $this->security->xss_clean( $this->input->post( 'from_date_time' ) );
			$to_date_time = $this->security->xss_clean( $this->input->post( 'to_date_time' ) );


			$sql_where .= "id != ''";
			if ( !empty( $year ) ) {
				$sql_where .= " and year = '$year'";
			}

			if ( !empty( $session ) ) {
				$sql_where .= " and session = '$session'";
			}
			if ( !empty( $module_id ) ) {
				$sql_where .= " and module_id = '$module_id'";
			}

			if ( !empty( $from_date_time ) and !empty( $to_date_time ) ) {
				$final_date_from = date( 'Y-m-d', strtotime( $from_date_time ) ) . " 00:00:00";
				$final_date_to = date( 'Y-m-d', strtotime( $to_date_time ) ) . " 23:59:59";
				$sql_where .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
			}

			$this->session->unset_userdata( 'sql_where_session' );
			$this->session->set_userdata( 'sql_where_session', $sql_where );

		} else {
			$sql_where = $this->session->userdata( 'sql_where_session' );
		}

		if ( $sql_where != "" ) {
			$this->db->where( $sql_where );
		}
		$this->db->order_by( "year, session, module_id,unit_id", 'DESC' );
		$query = $this->db->get( 'exams', $limit, $row );

		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			return $results;
		}

		return FALSE;

	}

	function count_exam_records()
	{

		$sql_where = "";

		if ( $this->input->server( 'REQUEST_METHOD' ) === 'POST' ) {
			$year = $this->security->xss_clean( $this->input->post( 'year' ) );
			$session = $this->security->xss_clean( $this->input->post( 'session' ) );
			$module_id = $this->security->xss_clean( $this->input->post( 'module_id' ) );
			$from_date_time = $this->security->xss_clean( $this->input->post( 'from_date_time' ) );
			$to_date_time = $this->security->xss_clean( $this->input->post( 'to_date_time' ) );


			$sql_where .= "id != ''";
			if ( !empty( $year ) ) {
				$sql_where .= " and year = '$year'";
			}

			if ( !empty( $session ) ) {
				$sql_where .= " and session = '$session'";
			}
			if ( !empty( $module_id ) ) {
				$sql_where .= " and module_id = '$module_id'";
			}

			if ( !empty( $from_date_time ) and !empty( $to_date_time ) ) {
				$final_date_from = date( 'Y-m-d', strtotime( $from_date_time ) ) . " 00:00:00";
				$final_date_to = date( 'Y-m-d', strtotime( $to_date_time ) ) . " 23:59:59";
				$sql_where .= " and created_at BETWEEN '$final_date_from' AND '$final_date_to'";
			}

			$this->session->unset_userdata( 'sql_where_session' );
			$this->session->set_userdata( 'sql_where_session', $sql_where );

		} else {
			$sql_where = $this->session->userdata( 'sql_where_session' );
		}

		$this->db->select( 'id' );
		if ( $sql_where != "" ) {
			$this->db->where( $sql_where );
		}
		$query = $this->db->get( 'exams' );

		return $query->num_rows();

	}

	function save_exam_data()
	{
		$doc_status = $qus_status = FALSE;

		$this->load->config( 'exam' );
		$ec = $this->config->item( 'exam_config' );

		$data_exam = array(
			'name'       => $this->input->post( 'name', TRUE ),
			'year'       => $this->input->post( 'year', TRUE ),
			'session'    => $this->input->post( 'session', TRUE ),
			'module_id'  => $this->input->post( 'module_id', TRUE ),
			'unit_id'    => $this->input->post( 'unit_id', TRUE ),
			'open_date'  => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'from_date_time', TRUE ) ) ),
			'close_date' => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'to_date_time', TRUE ) ) ),
			'created_by' => AUTH_EMAIL,
			'created_at' => database_formatted_date(),
			'status'     => $this->input->post( 'status', TRUE ),
			'time'       => $ec->duration,
			'total_mark' => $ec->mcq_mark * $ec->mcq_ques_count,
		);

		$this->db->trans_start();
		$this->db->insert( 'exams', $data_exam );

		$insert_id = $this->db->insert_id();
		if ( $insert_id ) {
			$doc_status = $this->save_doc_exam_data( $insert_id );
			$qus_status = $this->save_exam_questions( $insert_id );
		}

		if ( $this->db->trans_status() && $doc_status && $qus_status ) {
			$this->db->trans_complete();
			$this->db->trans_commit();
			return TRUE;
		} else {
			$this->db->trans_rollback();
			return FALSE;
		}
	}

	function save_on_site_exam_data()
	{
		$doc_status = $qus_status = FALSE;

		$this->load->config( 'exam' );
		$ec = $this->config->item( 'exam_config' );
		$marks = $this->input->post( 'mark', TRUE );
		$ose_ids = $this->input->post( 'ose_id', TRUE );
		$this->db->trans_start();
		foreach ( $marks as $id => $mark ) {
			$total = $ec->on_site['mcq'] + $ec->on_site['essay'] + $ec->on_site['oral'];
			$total_ob = $mark['mcq'] + $mark['essay'] + $mark['oral'];
			$percent = $total_ob / $total * 100;
			$data_exam = array(
				'doc_id'         => $id,
				'mcq'            => $ec->on_site['mcq'],
				'mcq_obtained'   => $mark['mcq'],
				'essay'          => $ec->on_site['essay'],
				'essay_obtained' => $mark['essay'],
				'oral'           => $ec->on_site['oral'],
				'oral_obtained'  => $mark['oral'],
				'total'          => $total,
				'total_obtained' => $total_ob,
				'percent'        => $percent,
				'year'           => $this->input->post( 'year', TRUE ),
				'session'        => $this->input->post( 'session', TRUE ),
				'module_id'      => $this->input->post( 'module', TRUE )
			);

			if ( $percent >= $ec->on_site['pass'] ) {
				$data_exam['status'] = 1;
			} else {
				$data_exam['status'] = 0;
			}
			if ( isset( $ose_ids[$id] ) ) {
				$data_exam['updated_by'] = AUTH_EMAIL;
				$data_exam['updated_at'] = database_formatted_date();
				$this->db->update( 'on_site_exam', $data_exam, [ 'id' => $ose_ids[$id] ] );
			} else {
				$data_exam['created_by'] = AUTH_EMAIL;
				$data_exam['created_at'] = database_formatted_date();
				$this->db->insert( 'on_site_exam', $data_exam );
			}
		}

		if ( $this->db->trans_status() ) {
			$this->db->trans_complete();
			$this->db->trans_commit();
			return TRUE;
		} else {
			$this->db->trans_rollback();
			return FALSE;
		}
	}

	public function save_doc_exam_data( $id )
	{
		$year = $this->input->post( 'year', TRUE );
		$session = $this->input->post( 'session', TRUE );
		$module = $this->input->post( 'module_id', TRUE );
		$unit = $this->input->post( 'unit_id', TRUE );
		$where = [
			'year'    => $year,
			'session' => $session,
			'status'  => 1,
		];
		$this->db->select( 'id' );
		$this->db->where( $where );
		$query = $this->db->get( 'sif_admission' );

		if ( $query->num_rows() > 0 ) {
			$data = [];
			foreach ( $query->result() as $row ) {
				$data[] = [
					'exam_id'    => $id,
					'doc_id'     => $row->id,
					'year'       => $year,
					'session'    => $session,
					'module_id'  => $module,
					'unit_id'    => $unit,
					'open_date'  => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'from_date_time', TRUE ) ) ),
					'close_date' => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'to_date_time', TRUE ) ) ),
					'status'     => 9
				];
			}

			$this->db->insert_batch( 'doc_exams', $data );

			if ( $this->db->affected_rows() ) {
				return TRUE;
			}
		}
		return FALSE;
	}

	public function save_exam_questions( $id, $qtype = 2 ) //MCQ=2, SBA=1
	{
		$year = $this->input->post( 'year', TRUE );
		$session = $this->input->post( 'session', TRUE );
		$module = $this->input->post( 'module_id', TRUE );
		$unit = $this->input->post( 'unit_id', TRUE );
		$ques = $this->input->post( 'ques', TRUE );
//        die(json_encode($ques));
		if ( $ques ) {
			$data = [];
			foreach ( $ques as $qid ) {
				$data[] = [
					'exam_ref_id'      => $id,
					'question_type_id' => $qtype,
					'question_id'      => $qid,
					'year'             => $year,
					'session'          => $session,
					'module_id'        => $module,
					'unit_id'          => $unit,
				];
			}

			$this->db->insert_batch( 'exam_question', $data );

			if ( $this->db->affected_rows() ) {
				return TRUE;
			}
		}
		return FALSE;
	}

	public function get_doc_list()
	{
		if ( $this->input->post() ) {
			$year = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module = $this->input->post( 'module', TRUE );

			$where = [];

			$year ? $where['TD.year'] = $year : NULL;
			$session ? $where['TD.session'] = $session : NULL;
			$module ? $where['TD.module'] = $module : NULL;

			$this->db->select( 'TD.*, A.doc_name, A.reg_no' ); // , OE.mcq_obtained, OE.essay_obtained, OE.oral_obtained, OE.id ose_id, OE.year oe_year
			$this->db->where( 'A.status', 1 );
			$this->db->order_by( 'A.reg_no' );
			$where ? $this->db->where( $where ) : NULL;
//            $this->db->where('CASE WHEN TD.doc_id = OE.doc_id THEN OE.year=TD.year END');
//            $this->db->where('OE.year', 'TD.year', FALSE);
//            $this->db->where('OE.session', 'TD.session', FALSE);
//            $this->db->where('OE.module_id', 'TD.module', FALSE);
			$this->db->join( 'sif_admission A', 'A.id = TD.doc_id', 'LEFT' );
//            $this->db->join( 'on_site_exam OE', 'TD.doc_id = OE.doc_id', 'LEFT' );
			$query = $this->db->get( 'assigned_teacher_doctors TD' );
			if ( $query->num_rows() > 0 ) {
				$results = $query->result();

				foreach ( $results as $result ) {
					$result->ose = $this->get_doc_on_site_exam( $result );
				}

				return $results;
			}
		}

		return FALSE;
	}

	public function get_onsite_exam_doc_list()
	{
		if ( $this->input->post() ) {
			$year = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module = $this->input->post( 'module', TRUE );

			$where = [];

			$year ? $where['TD.year'] = $year : NULL;
			$session ? $where['TD.session'] = $session : NULL;
			$module ? $where['TD.module'] = $module : NULL;

			$this->db->select( 'TD.*, A.doc_name, A.reg_no' ); // , OE.mcq_obtained, OE.essay_obtained, OE.oral_obtained, OE.id ose_id, OE.year oe_year
			$this->db->where( 'A.status', 1 );
			$this->db->order_by( 'A.reg_no' );
			$where ? $this->db->where( $where ) : NULL;
			$this->db->join( 'sif_admission A', 'A.id = TD.doc_id', 'LEFT' );
			$this->db->group_by( 'TD.doc_id' );
			$query = $this->db->get( 'assigned_teacher_doctors TD' );
			if ( $query->num_rows() > 0 ) {
				$results = $query->result();

				foreach ( $results as $result ) {
					$result->ose = $this->get_doc_on_site_exam( $result );
				}

				return $results;
			}
		}

		return FALSE;
	}

	public function get_doc_on_site_exam( $result )
	{
		$where = [
			'doc_id'    => $result->doc_id,
			'year'      => $result->year,
			'session'   => $result->session,
			'module_id' => $result->module,
		];
		$where ? $this->db->where( $where ) : NULL;
		$query = $this->db->get( 'on_site_exam' );

		if ( $query->num_rows() > 0 ) {
			return $query->last_row();
		}

		return FALSE;
	}

	public function get_exam_doc_list( $exam_id )
	{
		if ( $exam_id ) {
			$this->db->select( [ 'E.*', 'A.doc_name', 'A.phone', 'A.email', 'A.reg_no' ] );
			$this->db->where( 'exam_id', $exam_id );
			$this->db->join( 'sif_admission A', 'A.id = E.doc_id', 'left' );
			$query = $this->db->get( 'doc_exams E' );

			if ( $query->num_rows() > 0 ) {
				return $query->result();
			}

		}

		return FALSE;
	}

	public function change_exam_datetime( $exam )
	{
		$doc_exams = $this->get_unattented_doc_list( $exam );

		$update_data = [
			'status'     => 9,
			'open_date'  => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'from_date_time', TRUE ) ) ),
			'close_date' => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'to_date_time', TRUE ) ) ),
			'updated_by' => AUTH_EMAIL,
			'updated_at' => database_formatted_date(),
		];

		$this->db->where( 'exam_id', $exam->id );
		$this->db->where( 'year', $exam->year );
		$this->db->where( 'session', $exam->session );
		$this->db->where( 'module_id', $exam->module_id );
		$this->db->where( 'unit_id', $exam->unit_id );
		$this->db->where( 'final_mark is NULL' );
		$this->db->where_in( 'status', [ 8, 9 ] );
		$this->db->update( 'doc_exams', $update_data );
		if ( $this->db->affected_rows() > 0 ) {
			return TRUE;
		}

		return FALSE;
	}

	public function get_unattented_doc_list( $exam )
	{
		if ( $exam ) {
			$this->db->select( 'id' );
			$this->db->where( 'exam_id', $exam->id );
			$this->db->where( 'year', $exam->year );
			$this->db->where( 'session', $exam->session );
			$this->db->where( 'module_id', $exam->module_id );
			$this->db->where( 'unit_id', $exam->unit_id );
			$this->db->where( 'final_mark is NULL' );
			$this->db->where_in( 'status', [ 8, 9 ] );
			$query = $this->db->get( 'doc_exams' );

			if ( $query->num_rows() > 0 ) {
				$results = $query->result_array();
				return array_column( $results, 'id' );
			}

		}

		return FALSE;
	}

	public function get_exam_details( $id = NULL )
	{
		if ( $id ) {
			$query = $this->db->where( 'id', $id )->get( 'exams' );
			if ( $query->num_rows() ) {
				$exam = $query->row();
				$questions = $this->getExamQuestions( $exam->id );

				$exam->questions = $questions;
				$exam->question_ids = $questions ? array_column( $questions, 'question_id' ) : NULL;

				return $exam;
			}
		}
		return FALSE;
	}

	public function getExamQuestions( $exam_id = NULL )
	{
		if ( $exam_id ) {
			$query = $this->db->where( 'exam_ref_id', $exam_id )->get( 'exam_question' );
			if ( $query->num_rows() ) return $query->result_array();
		}
		return FALSE;
	}

	public function update_exam_data( $id = NULL )
	{
		$doc_status = $qus_status = FALSE;

		$this->load->config( 'exam' );
		$ec = $this->config->item( 'exam_config' );

		$data_exam = array(
			'name'       => $this->input->post( 'name', TRUE ),
			'year'       => $this->input->post( 'year', TRUE ),
			'session'    => $this->input->post( 'session', TRUE ),
			'module_id'  => $this->input->post( 'module_id', TRUE ),
			'unit_id'    => $this->input->post( 'unit_id', TRUE ),
			'open_date'  => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'from_date_time', TRUE ) ) ),
			'close_date' => date( 'Y-m-d H:i:s', strtotime( $this->input->post( 'to_date_time', TRUE ) ) ),
			'updated_by' => AUTH_EMAIL,
			'updated_at' => database_formatted_date(),
			'status'     => $this->input->post( 'status', TRUE ),
			'time'       => $ec->duration,
			'total_mark' => $ec->mcq_mark * $ec->mcq_ques_count,
		);

		$this->db->trans_start();
		$this->db->where( 'id', $id );
		$this->db->update( 'exams', $data_exam );

		if ( $this->db->affected_rows() ) {
			// delete old data
			$this->db->where( 'exam_id', $id )->delete( 'doc_exams' );
			$this->db->where( 'exam_ref_id', $id )->delete( 'exam_question' );

			// insert new data
			$doc_status = $this->save_doc_exam_data( $id );
			$qus_status = $this->save_exam_questions( $id );
		}

		if ( $this->db->trans_status() && $doc_status && $qus_status ) {
			$this->db->trans_commit();
			$this->db->trans_complete();
			return TRUE;
		} else {
			$this->db->trans_rollback();
			return FALSE;
		}
	}
}

