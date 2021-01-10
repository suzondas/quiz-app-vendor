<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_schedule
 *
 * @author jnahian
 * @property common_lib      $common_lib
 * @property mod_file_upload $mod_file_upload
 */
class Mod_result extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model( 'Mod_file_upload' );
	}
	
	function save_data()
	{
		$return    = array('success' => FALSE, 'msg' => '', 'insert_id' => NULL);
		$data      = array(
			'exam_id'    => $this->input->post( 'exam_id' ),
			'status'     => 1,
			'created_by' => AUTH_EMAIL,
			'created_at' => database_formatted_date(),
		);
		$ans_sheet = $this->Mod_file_upload->upload_file( 'ans', 'answer_sheet', NULL, NULL, 'txt' );
		//print_r($ans_sheet);exit;
		if ( $ans_sheet['status'] ) {
			$data['answer_sheet']    = $ans_sheet['path'];
			$correct_answers         = $this->get_correct_answer_array( $ans_sheet['path'] );
			$data['correct_answers'] = json_encode( $correct_answers );
		} else {
			$return['msg'] .= $ans_sheet['msg'];
		}
		$res_sheet = $this->Mod_file_upload->upload_file( 'result', 'result_sheet', NULL, NULL, 'txt' );
		if ( $res_sheet['status'] ) {
			$data['result_sheet'] = $res_sheet['path'];
		} else {
			$return['msg'] .= $res_sheet['msg'];
		}
		
		$flag = $this->db->insert( 'sif_result_process', $data );
		if ( $flag ) {
			$insert_id = $this->db->insert_id();
			$exam_res  = $this->Mod_common->get_row_data_by_id( 'sif_result_process', $insert_id );
			$exam      = $this->Mod_common->get_row_data_by_id( 'sif_exam', $exam_res->exam_id );
			
			// get the result details
			$results = $this->get_correct_wrong_answer( $exam_res->result_sheet, $exam_res->answer_sheet, $exam );
//            var_dump($results);
//            exit;
			foreach ( $results as $reg => $result ) {
				$obtained    = $result['correct_mark'] - $result['wrong_mark'];
				$data_result = array(
					'correct_ans'     => json_encode( $result['correct'] ),
					'wrong_ans'       => json_encode( $result['wrong'] ),
					'correct_mark'    => $result['correct_mark'],
					'no_correct'      => count( $result['correct'] ),
					'no_wrong'        => count( $result['wrong'] ),
					'wrong_mark'      => $result['wrong_mark'],
					'obtained_mark'   => $obtained,
					'mark_percentage' => ( $obtained / $exam->full_mark ) * 100,
				);
				$this->db->where( 'exam_id', $exam->id );
				$this->db->where( 'doc_reg_no', $reg );
				$flag = $this->db->update( 'sif_exam_result', $data_result );
			}
			
			if ( $flag ) {
				// Update highest mark to exam table
				$max_mark = $this->get_exam_max_mark( $exam->id );
				$this->db->where( 'id', $exam->id );
				$this->db->update( 'sif_exam', array('highest_mark' => $max_mark) );
				
				// update doctors result merit position
				$exam_results = $this->get_exam_results( $exam->id );
				foreach ( $exam_results as $i => $exam_result ) {
					$pos = $i + 1;
					$this->db->where( 'id', $exam_result->id );
					$this->db->update( 'sif_exam_result', array('merit_pos' => $pos) );
				}
				
				//update result subject position
				$sub_results = $this->get_subjectwise_exam_result( $exam->id );
				
				foreach ( $sub_results as $sub_result ) {
					foreach ( $sub_result as $j => $sub ) {
						$pos1 = $j + 1;
						$this->db->where( 'id', $sub->id );
						$this->db->update( 'sif_exam_result', array('subject_pos' => $pos1) );
					}
				}
			}
			
			$return['insert_id'] = $insert_id;
			$return['success']   = TRUE;
			return $return;
		}
		return FALSE;
	}
	
	public function save_data_part_2()
	{
		$flag  = FALSE;
		$ids   = $this->input->post( 'ids', TRUE );
		$marks = $this->input->post( 'marks', TRUE );
		if ( $ids && $marks ) {
			foreach ( $marks as $i => $mark ) {
				if ( $mark ) {
					$data['obtained_mark'] = $mark;
					$this->db->where( 'id', $ids[$i] );
					$flag = $this->db->update( 'sif_exam_result_part2', $data );
				}
			}
		}
		return $flag;
	}
	
	public function get_exam_results( $exam_id = NULL )
	{
		$this->db->select( 'id,obtained_mark' );
		$exam_id ? $this->db->where( 'exam_id', $exam_id ) : '';
		$this->db->order_by( 'exam_id,mark_percentage', 'DESC' );
		$query = $this->db->get( 'sif_exam_result' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			return $results;
		}
		return FALSE;
	}
	
	public function get_subjectwise_exam_result( $exam_id )
	{
		$this->db->select( 'id,subject_id,obtained_mark' );
		$exam_id ? $this->db->where( 'exam_id', $exam_id ) : '';
		$this->db->order_by( 'exam_id,mark_percentage,subject_id', 'DESC' );
		$query = $this->db->get( 'sif_exam_result' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			$data    = array();
			foreach ( $results as $result ) {
				$data[$result->subject_id][] = $result;
			}
			return $data;
		}
		return FALSE;
	}
	
	public function get_exam_max_mark( $exam_id = NULL )
	{
		$this->db->select( 'id' );
		$this->db->select_max( 'obtained_mark' );
		$exam_id ? $this->db->where( 'exam_id', $exam_id ) : '';
		$query = $this->db->get( 'sif_exam_result' );
		if ( $query->num_rows() > 0 ) {
			$result = $query->row();
			return $result->obtained_mark;
		}
		return FALSE;
	}
	
	function save_discount()
	{
		$id      = $this->input->post( 'doc_id' );
		$amount  = $this->input->post( 'amount' );
		$fee_amt = get_name_by_auto_id( 'sif_admission', $id, 'fee_amount' );
		$data    = array(
			'discount_amont' => $amount,
			'dis_auth_by'    => $this->input->post( 'auth_by' ),
			'final_amount'   => ( $fee_amt - $amount ),
			'updated_at'     => now(),
			'updated_by'     => AUTH_EMAIL,
		);
		
		$this->db->where( 'id', $id );
		$result = $this->db->update( 'sif_admission', $data );
		
		if ( $result ) {
			return $result;
		}
		return FALSE;
	}
	
	function count_records()
	{
		if ( $this->input->post() ) {
			
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			
			$where = [];
			
			$year ? $where['year'] = $year : NULL;
			$session ? $where['session'] = $session : NULL;
			$module ? $where['module_id'] = $module : NULL;
			$unit ? $where['unit_id'] = $unit : NULL;
			
			if ( $where ) $this->db->where( $where );
			
			$this->db->order_by( "doc_id, module_id, unit_id, status" );
			$query = $this->db->get( 'doc_exams' );
			return $query->num_rows();
		}
		return FALSE;
	}
	
	function get_records_list()
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			
			$where = [];
			
			$year ? $where['year'] = $year : NULL;
			$session ? $where['session'] = $session : NULL;
			$module ? $where['module_id'] = $module : NULL;
			$unit ? $where['unit_id'] = $unit : NULL;
			
			if ( $where ) $this->db->where( $where );
			
			$this->db->order_by( "doc_id, module_id, unit_id, status" );
			$query = $this->db->get( 'doc_exams' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result();
				$this->load->config( 'exam' );
				$ec = $this->config->item( 'exam_config' );
				foreach ( $results as $result ) {
					$assignment                      = $this->get_assignment_details( $result );
					$result->mcq_assignment_total    = ( $assignment ? $assignment->mark : 0 ) + $result->mark;
					$result->mcq_assignment_obtained = ( $assignment ? $assignment->mark_obtained : 0 ) + $result->final_mark;
					$result->mcq_assignment_percent  = ( $result->mcq_assignment_obtained / $result->mcq_assignment_total ) * 100;
					
					if ( $result->mcq_assignment_percent >= $ec->online_pass ) {
						$result->final_status = 1;
					} elseif ( $assignment && $assignment->mark > 0 ) {
						$result->final_status = 2;
					} else {
						$result->final_status = 0;
					}
					
					$result->assignment = $assignment;
				}
				
				return $results;
			}
		}
		
		return FALSE;
	}
	
	public function get_on_site_result()
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			
			$where = [];
			
			$year ? $where['year'] = $year : NULL;
			$session ? $where['session'] = $session : NULL;
			$module ? $where['module_id'] = $module : NULL;
			
			if ( $where ) $this->db->where( $where );
			
			$this->db->order_by( "doc_id, module_id, status" );
			$query = $this->db->get( 'on_site_exam' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result();
				$data    = [];
				foreach ( $results as $result ) {
					$data[$result->doc_id][] = $result;
				}
				return $data;
			}
		}
		
		return FALSE;
	}
	
	public function get_unit_count()
	{
		if ( $this->input->post() ) {
			$module = $this->input->post( 'module', TRUE );
			
			$module ? $this->db->where( 'module_id', $module ) : NULL;
			$this->db->where( 'course_id', 1 );
			$query = $this->db->get( 'module_units' );
			
			return $query->num_rows();
		}
		
		return FALSE;
	}
	
	public function get_module_result()
	{
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			
			$where = [];
			
			$year ? $where['year'] = $year : NULL;
			$session ? $where['session'] = $session : NULL;
			$module ? $where['module_id'] = $module : NULL;
			
			if ( $where ) $this->db->where( $where );
			
			$this->db->select( '*' );
			$this->db->order_by( "doc_id" );
			$query = $this->db->get( 'exam_results' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result();
				$data    = [];
				foreach ( $results as $result ) {
					$data[$result->doc_id][] = $result;
				}
				return $data;
			}
		}
		
		return FALSE;
	}
	
	
	public function get_user_exam_result( $exam_id, $where = [] )
	{
		$this->db->where( 'status', 1 );
		$this->db->where( 'id', $exam_id );
		
		if ( count( $where ) ) $this->db->where( $where );
		
		$query = $this->db->get( 'doc_exams' );
		
		if ( $query->num_rows() == 1 ) {
			$doc_exam            = $query->row();
			$doc_exam->exam_data = $this->Mod_common->get_row_data_by_id( 'exams', $doc_exam->exam_id );
			return $doc_exam;
		}
		
		return FALSE;
		
	}
	
	public function get_user_exam_questions_with_answers( $exam_id )
	{

//        $id = $this->user_id;
		
		$query = $this->db->select( 'question_id id' )
						  ->where( 'exam_ref_id', $exam_id )
//                          ->order_by( 'id', 'random' )
						  ->get( 'exam_question' );
		
		if ( $query->num_rows() > 0 ) {
			$questions = $query->result();
			$data      = [];
			
			foreach ( $questions as $i => $question ) {
				$data[$i]['question'] = $this->Mod_common->get_row_data_by_id( 'oe_qsn_bnk_master', $question->id );
				$data[$i]['answers']  = $this->Mod_common->get_question_anserws( $question->id );
			}
			
			return $data;
		}
		
		return FALSE;
	}
	
	public function get_assignment_details( $doc_exam )
	{
		$this->db->select( '*' );
		$this->db->where( [
							  'doc_id'  => $doc_exam->doc_id,
							  'year'    => $doc_exam->year,
							  'session' => $doc_exam->session,
							  'module'  => $doc_exam->module_id,
							  'unit'    => $doc_exam->unit_id,
						  ] );
		$query = $this->db->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->last_row();
		}
		
		return FALSE;
	}
	
	public function get_search_data()
	{
		$data = array();
		if ( $this->input->post() ) {
			$year         = $this->input->post( 'year', TRUE );
			$session      = $this->input->post( 'session', TRUE );
			$course_code  = $this->input->post( 'course_code', TRUE );
			$faculty_code = $this->input->post( 'faculty_code', TRUE );
			$batch_code   = $this->input->post( 'batch_code', TRUE );
			$exam         = $this->input->post( 'exam_id', TRUE );
			$topic_id     = $this->input->post( 'topic_id', TRUE );
			
			$session_array = array(
				'year'         => $year,
				'session'      => $session,
				'course_code'  => $course_code,
				'faculty_code' => $faculty_code,
				'batch_code'   => $batch_code,
				'exam'         => $exam,
				'topic_id'     => $topic_id,
			);
			$this->session->set_userdata( $session_array );
		} else {
			$year         = $this->session->userdata( 'year' );
			$session      = $this->session->userdata( 'session' );
			$course_code  = $this->session->userdata( 'course_code' );
			$faculty_code = $this->session->userdata( 'faculty_code' );
			$batch_code   = $this->session->userdata( 'batch_code' );
			$exam         = $this->session->userdata( 'exam' );
			$topic_id     = $this->session->userdata( 'topic_id' );
		}
		
		$year ? $this->db->where( "year", $year ) : '';
		$session ? $this->db->where( "session", $session ) : '';
		$course_code ? $this->db->where( "course_code", $course_code ) : '';
		$faculty_code ? $this->db->where( "faculty_code", $faculty_code ) : '';
		$batch_code ? $this->db->where( "batch_code", $batch_code ) : '';
		$exam ? $this->db->where( "exam_id", $exam ) : '';
		$topic_id ? $this->db->where( 'topic_id' ) : '';
		$query = $this->db->get( 'sif_exam_result' );
		
		if ( $query->num_rows() > 0 ) {
			$data = $query->result();
			return $data;
		}
		return FALSE;
	}
	
	public function get_search_exam_data()
	{
		$data = array();
		if ( $this->input->post() ) {
//            $year = $this->input->post('year', true);
//            $session = $this->input->post('session', true);
//            $course_code = $this->input->post('course_code', true);
//            $faculty_code = $this->input->post('faculty_code', true);
//            $batch_code = $this->input->post('batch_code', true);
			$exam = $this->input->post( 'exam_id', TRUE );
			
			$session_array = array(
//                'year' => $year,
//                'session' => $session,
//                'course_code' => $course_code,
//                'faculty_code' => $faculty_code,
//                'batch_code' => $batch_code,
'exam' => $exam,
			);
			$this->session->set_userdata( $session_array );
		} else {
			$exam = $this->session->userdata( 'exam' );
		}

//        $year ? $this->db->where("year", $year) : '';
//        $session ? $this->db->where("session", $session) : '';
//        $course_code ? $this->db->where("course_code", $course_code) : '';
//        $faculty_code ? $this->db->where("faculty_code", $faculty_code) : '';
//        $batch_code ? $this->db->where("batch_code", $batch_code) : '';
		$exam ? $this->db->where( "id", $exam ) : '';
		
		$query = $this->db->get( 'sif_exam' );
		
		if ( $query->num_rows() > 0 ) {
			$data = $query->row();
			return $data;
		}
		return FALSE;
	}
	
	public function get_result_details( $doc_id )
	{
		$this->db->where( 'doc_id', $doc_id );
		$this->db->order_by( 'date', 'ASC' );
		$query = $this->db->get( 'sif_exam_result' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_teacher_search_data()
	{
		$data       = array();
		$teacher_id = $this->input->post( 'teacher_id', TRUE );
		$teacher_id ? $this->db->where( "teacher_id", $teacher_id ) : '';
		
		$query = $this->db->get( 'sif_teacher' );
		
		if ( $query->num_rows() > 0 ) {
			$data['results'] = $query->row();
			return $data;
		}
		return FALSE;
	}
	
	public function save_teacher_result()
	{
		$teacher_id = $this->input->post( 'teacher_id', TRUE );
		$date       = $this->input->post( 'date', TRUE );
		$amount     = $this->input->post( 'amount', TRUE );
		$auth_by    = $this->input->post( 'auth_by', TRUE );
		$note       = $this->input->post( 'note', TRUE );
		
		$data = array(
			'teacher_id' => $teacher_id,
			'date'       => $date,
			'amount'     => $amount,
			'auth_by'    => $auth_by,
			'note'       => $note,
			'created_by' => AUTH_EMAIL,
			'created_at' => database_formatted_date(),
		);
		$this->db->insert();
	}
	
	/**
	 * @param string $file_location
	 * @return array|string
	 */
	public function get_result_row_array( $file_location )
	{
		$res = file_get_contents( $file_location );
		
		$res = explode( "\r\n", $res );
		//unset($res[count($res) - 1]);
		return $res;
	}
	
	/**
	 * Get The 6 digit reg no of OMR sheet from txt file
	 * @param string $str
	 * @return string
	 */
	public function get_reg_no_txt( $str )
	{
		$str = str_split( trim( $str ) );
		$reg = '';
		for ( $i = 0; $i <= 5; $i++ ) {
			$reg .= $str[$i];
		}
		return $reg;
	}
	
	/**
	 * Get answer array from the given string
	 * @param string $str
	 * @return array
	 */
	public function get_answer_array( $str, $ans_type )
	{
		$str   = str_split( trim( $str ) );
		$res   = array();
		$start = $this->common_lib->get_ans_start( $ans_type );
		for ( $i = $start; $i < count( $str ); $i++ ) {
			$res[] = $str[$i];
		}
		return $res;
	}
	
	/**
	 * Get correct answer array from the given string
	 * @param string $str
	 * @return array
	 */
	public function get_correct_answer_array( $file_location )
	{
		$res    = file_get_contents( $file_location );
		$str    = str_split( trim( $res ) );
		$return = array();
		for ( $i = 0; $i < count( $str ); $i++ ) {
			$return[] = $str[$i];
		}
		return $return;
	}
	
	/**
	 * Get detailed result
	 * @param $result
	 * @param $answer
	 * @param $exam
	 * @return array
	 */
	public function get_correct_wrong_answer( $result, $answer, $exam )
	{
		$res    = $this->get_result_row_array( $result );
		$ans    = $this->get_correct_answer_array( $answer );
		$return = array();
		
		$mcq      = explode( '-', trim( $exam->no_mcq_question ) );
		$mcq_from = trim( $mcq[0] );
		$mcq_to   = trim( $mcq[1] ) * 5;
		$sba      = explode( '-', trim( $exam->no_sba_question ) );
		$sba_from = trim( $sba[0] );
		$sba_to   = trim( $sba[1] );
		
		//var_dump($res); exit;
		foreach ( $res as $i => $item ) {
			$reg_sl                       = $this->get_reg_no_txt( $item );
			$row                          = $this->get_answer_array( $item, $exam->ans_type );
			$reg                          = $this->Mod_common->get_results_reg( $exam->year, $exam->faculty_code, $reg_sl );
			$return[$reg]['correct_mark'] = 0;
			$return[$reg]['wrong_mark']   = 0;
			foreach ( $row as $j => $value ) {
				$ques_no = ( $j + 1 );
				if ( $value && isset( $ans[$j] ) ) {
					if ( $value == $ans[$j] ) {
						$return[$reg]['correct'][$ques_no] = $value;
						
						if ( $ques_no >= $mcq_from && $ques_no <= $mcq_to ) {
							$return[$reg]['correct_mark'] += $exam->mcq_ques_val;
						} elseif ( $ques_no >= $sba_from && $ques_no <= $sba_to ) {
							$return[$reg]['correct_mark'] += $exam->sba_question_val;
						}
						
						//var_dump("$j. correct");
					} else {
						$return[$reg]['wrong'][$ques_no] = $value;
						$return[$reg]['wrong_mark']      += $exam->negative_mark;
						//var_dump("$j. $value - wrong, correct - {$ans[$j]}");
					}
				}
//                var_dump();
			}
		}
		return $return;
	}
	
	public function get_exam_student_part_2()
	{
		$exam_id = $this->input->post( 'exam_id', TRUE );
		$this->db->where( 'exam_id', $exam_id );
		$this->db->where( 'course_code', 2 );
		$query = $this->db->get( 'sif_exam_result_part2' );
		if ( $query->num_rows() > 0 ) {
			$data = $query->result();
			return $data;
		}
		return FALSE;
	}
	
	public function change_individual_doc_exams_status( $doc_exam_id, $status )
	{
		$this->db->trans_start();
		$query = $this->db->get( 'doc_exams', ['id' => $doc_exam_id] );
		if ( $query->num_rows() == 1 ) {
			$row_data = $query->row();
			unset( $row_data->id );
			$row_data->master_id  = $doc_exam_id;
			$row_data->created_at = database_formatted_date();
			$row_data->created_by = AUTH_EMAIL;
			$this->db->insert( 'doc_exams_trans', $row_data );
			$update_data = [
				'status'     => $status,
				'updated_at' => database_formatted_date(),
				'updated_by' => AUTH_EMAIL
			];
			if ( $status == '9' ) {
				$update_data['answers']      = NULL;
				$update_data['correct']      = NULL;
				$update_data['wrong']        = NULL;
				$update_data['not_answered'] = NULL;
				$update_data['mark']         = NULL;
				$update_data['correct_mark'] = NULL;
				$update_data['wrong_mark']   = NULL;
				$update_data['final_mark']   = NULL;
				$update_data['attend_date']  = NULL;
				$update_data['start_time']   = NULL;
				$update_data['end_time']     = NULL;
			}
			$this->db->update( 'doc_exams', $update_data, ['id' => $doc_exam_id] );
			if ( $this->db->trans_status() ) {
				$this->db->trans_complete();
				$this->db->trans_commit();
				return TRUE;
			} else {
				$this->db->trans_rollback();
			}
		}
		return FALSE;
	}
	
}
