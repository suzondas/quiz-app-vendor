<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_student
 * @author jnahian
 */
class Mod_student extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		
	}
	
	/*
     * collect master table record
     */
	function get_details( $sim_auto_id )
	{
		$query = $this->db->where( "id", $sim_auto_id );
		$query = $this->db->get( 'sif_doc_master' );
		
		if ( $query->num_rows() > 0 ) {
			$record = $query->row();
			return $record;
		} else {
			return NULL;
		}
	}
	
	/*
     * collect student pre shcools record
     */
	function get_details_doctor_addmission( $user_name, $sim_auto_id )
	{
		
		$where_con = array(
			'master_id' => $sim_auto_id,
			'user_name' => $user_name
		);
		$query     = $this->db->where( $where_con );
		$query     = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$record = $query->row();
			return $record;
		} else {
			return NULL;
		}
	}
	
	public function get_student_exams( $doc )
	{
		
		$where_con = array(
			'DE.year'    => $doc->year,
			'DE.session' => $doc->session,
			'DE.doc_id'  => $doc->id,
			'E.status'   => 1
		);
		$this->db->select( 'DE.*, E.name exam_name' );
		$this->db->where( $where_con );
		$this->db->join( 'exams E', 'DE.exam_id = E.id' );
		$this->db->order_by( 'module_id', 'DESC' );
		$this->db->order_by( 'unit_id', 'DESC' );
		$query = $this->db->get( 'doc_exams DE' );
		
		if ( $query->num_rows() > 0 ) {
			$records = $query->result();
			return $records;
		} else {
			return NULL;
		}
	}
	
	public function get_student_result( $doc )
	{
		$query = $this->db->select( 'U.id unit_id, U.module_id, M.name module_name, U.name unit_name' )
			->join( 'modules M', 'M.id = U.module_id', 'left' )
			->get_where( 'module_units U', [ 'U.status' => 1, 'U.course_id' => 1 ] );
		
		if ( $query->num_rows() ) {
			$units = $query->result();
			$data  = [];
			$this->load->config( 'exam' );
			$ec = $this->config->item( 'exam_config' );
			
			foreach ( $units as $unit ) {
				$unit->doc_id     = $doc->id;
				$unit->assignment = $this->get_student_assingment( $doc, $unit->module_id, $unit->unit_id );
				$unit->mcq        = $this->get_student_mcq( $doc, $unit->module_id, $unit->unit_id );
				$unit->osa        = $this->get_student_on_site_exam( $doc, $unit->module_id );
				
				$percent = 0;
				if ( $unit->mcq && $unit->assignment ) {
					$total   = $unit->mcq->total + $unit->assignment->total;
					$mark    = $unit->mcq->mark + $unit->assignment->mark;
					$percent = $mark / $total * 100;
					
					if ( $percent >= $ec->online_pass ) {
						$unit->online_status = 1;
					} else {
						$unit->online_status = 0;
					}
				} else {
					$unit->online_status = 2;
				}
				
				
				$data[$unit->module_id][] = $unit;
			}
			
			return $data;
		}
		
		return FALSE;
	}
	
	public function get_student_assingment( $doc, $module, $unit )
	{
		$query = $this->db->select( 'mark_obtained mark, mark total' )
			->where( [ 'doc_id' => $doc->id, 'year' => $doc->year, 'session' => $doc->session, 'module' => $module, 'unit' => $unit ] )
			->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		
		return FALSE;
	}
	
	public function get_student_mcq( $doc, $module, $unit )
	{
		$query = $this->db->select( 'final_mark mark, total_mark total' )
			->where( [ 'doc_id' => $doc->id, 'year' => $doc->year, 'session' => $doc->session, 'module_id' => $module, 'unit_id' => $unit ] )
			->get( 'doc_exams' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		
		return FALSE;
	}
	
	public function get_student_on_site_exam( $doc, $module )
	{
		$query = $this->db->select( 'mcq_obtained, essay_obtained, oral_obtained, total_obtained mark,percent, status' )
			->where( [ 'doc_id' => $doc->id, 'year' => $doc->year, 'session' => $doc->session, 'module_id' => $module ] )
			->get( 'on_site_exam' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row();
		}
		
		return FALSE;
	}

//    public function get_current_result($authUser)
//    {
//        $this->db->where('student_id', $authUser->student_id);
//        $this->db->where('class_wise_stuid', $authUser->class_wise_stuid);
//        $query = $this->db->get('exam_marks_final');
//
//        if($query->num_rows() > 0) return $query->result();
//        return false;
//    }
	
	public function get_all_notice( $id = NULL )
	{
		if ( $id ) $this->db->where( 'doc_id', $id );
		$this->db->where( 'send_to', 'S' );
		$this->db->order_by( 'created_at', 'DESC' );
		$this->db->join( 'doc_notice DN', 'N.id = DN.notice_id' );
		$query = $this->db->get( 'sif_notice N' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_doctor_detail_for_routine( $user_name )
	{
		$this->db->select( "year,course_code,faculty_code,batch_code,session" );
		$this->db->where( 'user_name', $user_name );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() > 0 ) {
			return $query->last_row();
		} else {
			return FALSE;
		}
		
	}
	
	public function get_doctor_routine( $routine_detail )
	{
		//$this->get_doctor_detail_for_routine($user_name);
		// $last_two_digit_of_year = substr($routine_detail->year, -2);
		$data_routine_code = array(
			'year'         => $routine_detail->year,
			'course_code'  => $routine_detail->course_code,
			'faculty_code' => $routine_detail->faculty_code,
			'batch_code'   => $routine_detail->batch_code,
			'session'      => $routine_detail->session,
		);
		//return $data_routine_code;
		
		$this->db->select( "*" );
		$this->db->where( $data_routine_code );
		$query = $this->db->get( 'sif_schedule' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}

//    public function get_doctor_routine_row_value($routine_detail){
//        $data_routine_code = array(
//            'year' => $routine_detail->year,
//            'course_code' => $routine_detail->course_code,
//            'faculty_code' => $routine_detail->faculty_code,
//            'batch_code' => $routine_detail->batch_code,
//            'session' => $routine_detail->session,
//        );
//        //return $data_routine_code;
//        
//        $this->db->select("*");
//        $this->db->where($data_routine_code);
//        $query = $this->db->get('sif_schedule');
//        if($query->num_rows() > 0){
//            return $query->row();
//        }else{
//            return FALSE;
//        }
//    }
	
	
	public function get_student_class_times( $student )
	{
//        $shift ? $this->db->where('shift', $student->shift) : '';
		$student->candidate_for_class ? $this->db->where( 'class_id', $student->candidate_for_class ) : '';
		$student->group_id ? $this->db->where( 'group_id', $student->group_id ) : '';
		$student->section_id ? $this->db->where( 'section_id', $student->section_id ) : '';
		$this->db->group_by( 'time_from' );
		$query = $this->db->get( 'class_schedules' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		
		return FALSE;
	}
	
	public function get_student_class_routine( $student )
	{

//        $shift ? $this->db->where('shift', $student->shift) : '';
		$student->candidate_for_class ? $this->db->where( 'class_id', $student->candidate_for_class ) : '';
		$student->group_id ? $this->db->where( 'group_id', $student->group_id ) : '';
		$student->section_id ? $this->db->where( 'section_id', $student->section_id ) : '';
		$query = $this->db->get( 'class_schedules' );
		if ( $query->num_rows() > 0 ) {
			$data    = array();
			$results = $query->result();
			foreach ( $results as $result ) {
				$data[$result->day][] = $result;
			}
			return $data;
		}
		
		return FALSE;
	}
	
	public function evaluation_data( $user_name, $schedule_id )
	{
		$evaluate_data = array(
			'user_name'   => $user_name,
			'schedule_id' => $schedule_id,
			
			'introduction' => $this->input->post( 'introduction' ),
			'knowledge'    => $this->input->post( 'knowledge' ),
			'express'      => $this->input->post( 'express' ),
			'interaction'  => $this->input->post( 'interaction' ),
			'suggestions'  => $this->input->post( 'suggestions' ),
			'created_by'   => AUTH_EMAIL,
		);
		
		$result = $this->db->insert( 'sif_teacher_evaluation', $evaluate_data );
		if ( $result ) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
	
	function getAssignments( $id )
	{
		$query = $this->db->where( 'doc_id', $id )->order_by( 'sent', 'DESC' )->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			$resutls = $query->result();
			
			return $resutls;
		}
		
		return FALSE;
	}
	
	function get_doc_assignment( $doc_id, $module_id, $unit_id )
	{
		$doc   = $this->Mod_common->get_doc_year_session( $doc_id );
		$where = [
			'doc_id'  => $doc_id,
			'year'    => $doc->year,
			'session' => $doc->session,
			'module'  => $module_id,
			'unit'    => $unit_id,
		];
		$query = $this->db->where( $where )->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->row();
			
			return $result;
		}
		
		return FALSE;
	}
	
	function save_reply_assignment( $id )
	{
		if ( $this->input->post() ) {
			$data                  = [];
			$data['assignment_id'] = $id;
			$data['title']         = $this->input->post( 'title', TRUE );
			$data['msg']           = $this->input->post( 'desc', TRUE );
			$data['sent']          = date( 'Y-m-d h:i:s' );
			
			if ( $_FILES['attachment']['error'] == 0 ) {
				$condition  = array( 'size' => '20000' );
				$attachment = $this->Mod_file_upload->upload_file( 'attachment', 'attachment', $condition, '', '*' );
				
				if ( $attachment['status'] ) {
					$data['attachment'] = $attachment['path'];
				}
			}
			
			$this->db->trans_start();
			$this->db->insert( 'assignments_reply', $data );
			$this->db->update( 'assignments', [ 'status' => 'R' ], [ 'id' => $id ] );
			
			if ( $this->db->trans_status() ) {
				
				// send assignment reply email
				$this->Mod_student->send_assignment_reply_email( $id );
				
				$this->db->trans_complete();
				$this->db->trans_commit();
				return TRUE;
			} else {
				$this->db->trans_rollback();
			}
		}
		return FALSE;
	}
	
	function getAssignmentReplies( $id )
	{
		if ( $id ) {
			$query = $this->db->where( 'assignment_id', $id )->order_by( 'sent', 'desc' )->get( 'assignments_reply' );
			if ( $query->num_rows() > 0 ) {
				return $query->result();
			}
		}
		return FALSE;
	}
	
	function getAssignmentReply( $id )
	{
		if ( $id ) {
			$query = $this->db->where( 'id', $id )->get( 'assignments_reply' );
			if ( $query->num_rows() > 0 ) {
				return $query->row();
			}
		}
		return FALSE;
	}
	
	function getAssignmentResends( $id )
	{
		if ( $id ) {
			$query = $this->db->where( 'assignment_id', $id )->get( 'assignments_resend' );
			if ( $query->num_rows() > 0 ) {
				return $query->result();
			}
		}
		return FALSE;
	}
	
	function getFellowList( $year = NULL, $session = NULL )
	{
		$ids = NULL;
		if ( $this->input->post() ) {
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			$unit    = $this->input->post( 'unit', TRUE );
			
			$ids = $this->getAssignedDocIds( $module, $unit );
		}
		if ( $year && $session ) {
			
			$this->db->select( 'id,doc_name' );
			$this->db->where( [ 'year' => $year, 'session' => $session ] );
			if ( $ids ) {
				$this->db->where_not_in( 'id', $ids );
			}
			$this->db->order_by( 'doc_name' );
			$query = $this->db->get( 'sif_admission' );
			
			if ( $query->num_rows() > 0 ) {
//                $data = [];
				$result = $query->result_array();
				return array_column( $result, 'doc_name', 'id' );
			}
		}
		
		return FALSE;
	}
	
	function getAssignedDocIds( $module, $unit )
	{
		
		$query = $this->db->select( 'doc_id' )
			->where( 'module', $module )
			->where( 'unit', $unit )
			->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->result_array();
			
			return array_column( $result, 'doc_id' );
		}
		
		return FALSE;
	}
	
	function get_teacher_doctor_list()
	{
		$ids = [];
		if ( $this->input->post() ) {
			
			$year    = $this->input->post( 'year', TRUE );
			$session = $this->input->post( 'session', TRUE );
			$module  = $this->input->post( 'module', TRUE );
			
			$this->db->select( 'A.id, A.doc_name' );
			$this->db->where( 'A.status', 1 );
			$this->db->where( 'TD.year', $year );
			$this->db->where( 'TD.session', $session );
			$this->db->where( 'TD.module', $module );
			$this->db->where( 'TD.teacher_id', $this->teacher_id );
			$this->db->order_by( 'A.doc_name' );
			$this->db->join( 'assigned_teacher_doctors TD', 'TD.doc_id = A.id' );
			
			$query = $this->db->get( 'sif_admission A' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result_array();
				$ids     = array_column( $results, 'doc_name', 'id' );
			}
		}
		
		return $ids;
	}
	
	public function change_password()
	{
		$id       = $this->input->post( 'master_id', TRUE );
		$new      = $this->input->post( 'new', TRUE );
		$password = [ 'password' => $new, 'updated_at' => database_formatted_date(), 'updated_by' => AUTH_EMAIL ];
		$this->db->trans_start();
		$this->db->update( 'sif_doc_master', $password, [ 'id' => $id ] );
		$this->db->update( 'sif_admission', $password, [ 'master_id' => $id ] );
		
		
		if ( $this->db->trans_status() ) {
			$this->db->trans_commit();
			$this->db->trans_complete();
			return TRUE;
		} else {
			$this->db->trans_rollback();
		}
		
		return FALSE;
	}
	
	public function send_assignment_reply_email( $assignment_id )
	{
		if ( $assignment_id ) {
			$assignment = $this->getAssignment( $assignment_id );
			$title      = $this->input->post( 'title', TRUE );
			$desc       = $this->input->post( 'desc', TRUE );
//			die( json_encode( $assignment ) );
			
			$teacher_email = get_name_by_id( 'sif_teacher', $assignment->teacher_id, 'teacher_id', 'email' );
			
			$module_name = get_name_by_id( 'modules', $assignment->module, 'id', 'name' );
			$unit_name   = get_name_by_id( 'module_units', $assignment->unit, 'id', 'name' );
			$unit_code   = get_name_by_id( 'module_units', $assignment->unit, 'id', 'code' );
			
			$company = $this->data['company'];
			$data    = [
				'doc_name'      => $this->authUser->doc_name,
				'module_name'   => $module_name,
				'unit_name'     => $unit_name,
				'teacher_email' => $teacher_email,
				'title'         => $title,
				'desc'          => $desc,
				'company'       => $company,
			];
			$subject = "{$company->name} - {$unit_code} - Assignment reply by {$this->authUser->doc_name}";
			
			$msg = $this->load->view( 'emails/assignment-reply', $data, TRUE );

            return $this->Mod_email->SendGmailEmail($teacher_email, $subject, $msg);
		}
		
		return FALSE;
	}
	
	function getAssignment( $id )
	{
		$query = $this->db->where( 'id', $id )->get( 'assignments' );
		
		if ( $query->num_rows() > 0 ) {
			$result = $query->row();
			
			return $result;
		}
		
		return FALSE;
	}
	
	public function get_current_status( $student_id = NULL )
	{
		if ( $student_id ) {
			
			$admission_id = $this->getStudentAdmissionID( $student_id );
			
			$this->db->select( 'td.year,td.session, mod.name module_name, unit.name unit_name, unit.code unit_code, tec.tec_name teacher_name,tec.mobile teacher_mobile, tec.email teacher_email, tec.photo teacher_photo' );
			$this->db->where( 'td.doc_id', $admission_id );
			$this->db->order_by( 'td.created_at', 'DESC' );
			$this->db->join( 'modules mod', 'mod.id=td.module', 'left' );
			$this->db->join( 'module_units unit', 'unit.id=td.unit', 'left' );
			$this->db->join( 'sif_teacher tec', 'tec.teacher_id=td.teacher_id', 'left' );
			$query = $this->db->get( 'assigned_teacher_doctors td', 1 );

//            echo $this->db->last_query();exit;
			if ( $query->num_rows() ) {
				return $query->first_row();
			}
		}
		
		return FALSE;
	}
	
	public function getStudentAdmissionID( $master_id = NULL )
	{
		if ( $master_id ) {
			$query = $this->db->select( 'id' )->where( 'master_id', $master_id )->get( 'sif_admission' );
			
			if ( $query->num_rows() > 0 ) {
				return $query->row()->id;
			}
		}
		
		return FALSE;
	}
}

