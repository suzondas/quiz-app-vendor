<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mod_teacher
 *
 * @author iPLUS DATA
 */
class Mod_notice extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		//$this->load->model('mod_file_upload');
	}
	
	function doctor_list_for_mail( $year, $session_id, $course_code, $faculty_code, $batch_code )
	{
		$this->db->select( 'id,doc_name' );
		
		$year         = !empty( $year ) ? $this->db->where( 'year', $year ) : '';
		$session_id   = !empty( $session_id ) ? $this->db->where( 'session', $session_id ) : '';
		$course_code  = !empty( $course_code ) ? $this->db->where( 'course_code', $course_code ) : '';
		$faculty_code = !empty( $faculty_code ) ? $this->db->where( 'faculty_code', $faculty_code ) : '';
		$batch_code   = !empty( $batch_code ) ? $this->db->where( 'batch_code', $batch_code ) : '';
		//echo $year .'-'. $session_id .'-'. $course_code;exit;
//        if($year && $batch_code){
		$query = $this->db->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
		//}
	}
	
	function doctor_list_for_notice( $year, $session_id )
	{
		$this->db->select( 'id,master_id,reg_no,user_name' );
		
		!empty( $year ) ? $this->db->where( 'year', $year ) : '';
		!empty( $session_id ) ? $this->db->where( 'session', $session_id ) : '';
		
		$query = $this->db->select( 'id' )->get( 'sif_admission' );
		
		if ( $query->num_rows() > 0 ) {
			$results = $query->result_array();
			
			return array_column( $results, 'id' );
		} else {
			return FALSE;
		}
	}
	
	function get_teacher_list()
	{
		$this->db->select( '*' );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		} else {
			return FALSE;
		}
	}
	
	function get_teacher_list_array()
	{
		$teacher = $this->get_teacher_list();
		
		$list_arr = array();
		
		foreach ( $teacher as $tec ) {
			$list_arr[$tec->id] = $tec->tec_name;
		}
		return $list_arr;
	}
	
	function get_doctor_email( $doctors )
	{
		$data = array();
		$this->db->select( 'email' );
		$this->db->where_in( 'id', $doctors );
		$query = $this->db->get( 'sif_admission' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			foreach ( $results as $row ) {
				array_push( $data, $row->email );
			}
		}
		
		return $data;
	}
	
	function get_teacher_email( $teacher )
	{
		$data = array();
		$this->db->select( 'email' );
		$this->db->where_in( 'id', $teacher );
		$query = $this->db->get( 'sif_teacher' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			foreach ( $results as $res ) {
				array_push( $data, $res->email );
			}
		}
		return $data;
	}
	
	
	function get_doctor_phone_no( $doctor_list )
	{
		$data = array();
		foreach ( $doctor_list as $list ) {
			$this->db->select( 'phone' );
			$this->db->where( 'id', $list );
			$query = $this->db->get( 'sif_admission' );
			if ( $query->num_rows() > 0 ) {
				
				$phone_no = $query->result();
				foreach ( $phone_no as $phone ) {
					array_push( $data, $phone->phone );
				}
			}
			
		}
		return $data;
	}
	
	function get_teacher_phone_no( $teacher_list )
	{
		$data = array();
		foreach ( $teacher_list as $list ) {
			$this->db->select( 'mobile' );
			$this->db->where( 'id', $list );
			$query = $this->db->get( 'sif_teacher' );
			if ( $query->num_rows() > 0 ) {
				
				$phone_no = $query->result();
				foreach ( $phone_no as $phone ) {
					array_push( $data, $phone->mobile );
				}
			}
			
		}
		return $data;
	}
	
	
	public function send_sms( $phone_no, $message )
	{
		$mobile = $phone_no;
		
		$msg = urlencode( $message );
		$api = file_get_contents( "http://api.kushtia.com/sendsms/plain?user=BMRL&password=62Slrfcq&sender=DPDC&SMSText={$msg}&GSM={$mobile}" );
		if ( $api > 0 ) {
//            echo "$key. Message sent to {$mobile} \r\n";
			return TRUE;
		} else {
//            echo "$key. Failed Sending message to {$mobile} \r\n";
			return FALSE;
		}
	}
	
	public function save_notice_to_doctor()
	{
		$year     = $this->input->post( 'year', TRUE );
		$session  = $this->input->post( 'session', TRUE );
		$subject  = $this->input->post( 'subject', TRUE );
		$notice   = $this->input->post( 'notice', TRUE );
		$status   = $this->input->post( 'status', TRUE );
		$doc_list = $this->input->post( 'doc_id', TRUE );
		$upload   = array();
		
		$notice_data = array(
			'send_to'    => "S",
			'year'       => $year,
			'session'    => $session,
			'subject'    => $subject,
			'notice'     => $notice,
			'created_at' => date( 'Y-m-d h:i:s' ),
			'updated_at' => date( 'Y-m-d h:i:s' ),
			'status'     => $status,
		);
		
		if ( $_FILES['attachment']['error'] == 0 ) {
			$upload = $this->Mod_file_upload->upload_file( 'notice', 'attachment', [], 'attachment', 'jpg|jpeg|png|pdf|doc|docx|ppt|pptx' );
			if ( $upload['status'] ) {
				$notice_data['attachment'] = $upload['path'];
				$this->session->set_flashdata( 'attachment', $notice_data['attachment'] );
			} else {
				$this->session->set_flashdata( 'flashError', $upload['msg'] );
			}
		}
		
		$this->db->trans_start();
		$this->db->insert( 'sif_notice', $notice_data );
		$last_insert_id = $this->db->insert_id();
		
		$this->session->set_userdata( 'notice_id', $last_insert_id );
		
		if ( $last_insert_id ) {
			if ( !$doc_list ) {
				$doc_list = $this->doctor_list_for_notice( $year, $session );
			}
			foreach ( $doc_list as $key => $doc_id ) {
				$notice_data_trans = array(
					'notice_id' => $last_insert_id,
					'doc_id'    => $doc_id,
				);
				$this->db->insert( 'doc_notice', $notice_data_trans );
			}
			
		}
		
		if ( $this->db->trans_status() ) {
			$this->db->trans_commit();
			return TRUE;
		} else {
			$this->db->trans_rollback();
		}
		return FALSE;
		
	}
	
	public function update_notice_to_doctor( $id )
	{
		$year     = $this->input->post( 'year', TRUE );
		$session  = $this->input->post( 'session', TRUE );
		$subject  = $this->input->post( 'subject', TRUE );
		$notice   = $this->input->post( 'notice', TRUE );
		$doc_list = $this->input->post( 'doc_id', TRUE );
		$status   = $this->input->post( 'status', TRUE );
		$upload   = array();
		
		$notice_data = array(
			'year'       => $year,
			'session'    => $session,
			'subject'    => $subject,
			'notice'     => $notice,
			'updated_at' => date( 'Y-m-d h:i:s' ),
			'status'     => $status
		);
		
		if ( $_FILES['attachment']['error'] == 0 ) {
			$upload = $this->Mod_file_upload->upload_file( 'upload/notice', 'attachment', [], '', 'jpg|jpeg|png|pdf' );
			if ( $upload['status'] ) {
				$notice_data['attachment'] = $upload['path'];
				
				$this->session->set_userdata( 'attachment', $notice_data['attachment'] );
			} else {
				$this->session->set_flashdata( 'flashError', $upload['msg'] );
			}
		}
		
		$this->db->trans_start();
		$this->db->update( 'sif_notice', $notice_data, [ 'id' => $id ] );
		
		$this->session->set_userdata( 'notice_id', $id );
		
		if ( $this->db->affected_rows() > 0 ) {
			$this->db->delete( 'doc_notice', [ 'notice_id' => $id ] );
			if ( !$doc_list ) {
				$doc_list = $this->doctor_list_for_notice( $year, $session );
			}
			foreach ( $doc_list as $key => $doc_id ) {
				$notice_data_trans = array(
					'notice_id' => $id,
					'doc_id'    => $doc_id,
				);
				$this->db->insert( 'doc_notice', $notice_data_trans );
			}
			
		}
		
		if ( $this->db->trans_status() ) {
			$this->db->trans_complete();
			$this->db->trans_commit();
			return TRUE;
		} else {
			$this->db->trans_rollback();
		}
		return FALSE;
		
	}
	
	public function send_notice_email_to_doctor()
	{
		$status   = FALSE;
		$doc_list = $this->input->post( 'doc_id', TRUE );
		
		if ( !$doc_list ) {
			$doc_list = $this->doctor_list_for_notice( $this->input->post( 'year' ), $this->input->post( 'session' ) );
		}
		
		$query = $this->db->select( 'id, doc_name as name, email' )
			->where_in( 'id', $doc_list )
			->get( 'sif_admission' );
		
		if ( $query->num_rows() ) {
			$fellows = $query->result_array();
			
			$data            = $this->data;
			$data['notice']  = $this->input->post( 'notice' );
			$data['subject'] = $this->input->post( 'subject' );
			
			$notice_id = $this->session->userdata( 'notice_id' );
			
			foreach ( $fellows as $fellow ) {
				$data['fellow'] = $fellow;
				$html           = $this->load->view( 'emails/notice', $data, TRUE );
                $status         = $this->Mod_email->SendGmailEmail($fellow['email'], $data['subject'], $html);
				$this->db->where( [ 'notice_id' => $notice_id, 'doc_id' => $fellow['id'] ] )->update( 'doc_notice', [ 'email_sent' => $status ] );
			}
			
			$this->session->unset_userdata( 'notice_id' );
			$this->session->unset_userdata( 'notice_id' );
			
		}
		return $status;
	}
	
	public function save_general_notice()
	{
		$sent_to = $this->input->post( 'sent_to', TRUE );
		$subject = $this->input->post( 'subject', TRUE );
		$notice  = $this->input->post( 'notice', TRUE );
		$upload  = array();
		
		$notice_data = array(
			'send_to'    => "T",
			'subject'    => $subject,
			'notice'     => $notice,
			'created_at' => date( 'Y-m-d h:i:s' ),
			'updated_at' => date( 'Y-m-d h:i:s' ),
			'status'     => $this->input->post( 'status', TRUE )
		);
		if ( $_FILES['attachment']['error'] == 0 ) {
			$upload = $this->Mod_file_upload->upload_file( 'notice', 'attachment', [], NULL, 'pdf|jpg|jpeg|png' );
			if ( $upload['status'] ) {
				$notice_data['attachment'] = $upload['path'];
				$this->session->set_userdata( 'attachment', $notice_data['attachment'] );
			} else {
				$this->session->set_flashdata( 'flashError', $upload['msg'] );
			}
		}
		
		$this->db->trans_start();
		$this->db->insert( 'sif_notice', $notice_data );
		$ins_id = $this->db->insert_id();
		if ( $ins_id ) {
			if ( $sent_to ) {
				$faculty_list = $sent_to;
			} else {
				$faculty_list = array_keys( $this->Mod_common->get_teachers_array( FALSE ) );
			}
			
			$query = $this->db->select( 'id, tec_name as name, email' )
				->where_in( 'id', $faculty_list )
				->get( 'sif_teacher' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result_array();
				
				$mail            = $this->data;
				$mail['notice']  = $notice;
				$mail['subject'] = $subject;
				
				foreach ( $results as $faculty ) {
					$mail['fellow'] = $faculty;
					$html           = $this->load->view( 'emails/notice', $mail, TRUE );
                    $status         = $this->Mod_email->SendGmailEmail($faculty['email'], $mail['subject'], $html);
					
					$data = [
						'notice_id'  => $ins_id,
						'teacher_id' => $faculty['id'],
						'email_sent' => $status
					];
					
					$this->db->insert( 'teacher_notice', $data );
				}
			}
			
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
	
	public function update_general_notice( $id )
	{
		$sent_to = $this->input->post( 'sent_to', TRUE );
		$subject = $this->input->post( 'subject', TRUE );
		$notice  = $this->input->post( 'notice', TRUE );
		$upload  = array();
		
		$notice_data = array(
			'send_to'    => "T",
			'subject'    => $subject,
			'notice'     => $notice,
			'updated_at' => date( 'Y-m-d h:i:s' ),
			'status'     => $this->input->post( 'status', TRUE )
		);
		if ( $_FILES['attachment']['error'] == 0 ) {
			$upload = $this->Mod_file_upload->upload_file( 'notice', 'attachment', [], NULL, 'pdf|jpg|jpeg|png' );
			if ( $upload['status'] ) {
				$notice_data['attachment'] = $upload['path'];
			} else {
				$this->session->set_flashdata( 'flashError', $upload['msg'] );
			}
		}
		
		$this->db->trans_start();
		$this->db->update( 'sif_notice', $notice_data, [ 'id' => $id ] );
		
		if ( $id ) {
			if ( $sent_to ) {
				$faculty_list = $sent_to;
			} else {
				$faculty_list = array_keys( $this->Mod_common->get_teachers_array( FALSE ) );
			}
			
			$this->db->delete( 'teacher_notice', [ 'notice_id' => $id ] );
			
			$query = $this->db->select( 'id, tec_name as name, email' )
				->where_in( 'id', $faculty_list )
				->get( 'sif_teacher' );
			
			if ( $query->num_rows() > 0 ) {
				$results = $query->result_array();
				
				$mail            = $this->data;
				$mail['notice']  = $notice;
				$mail['subject'] = $subject;
				
				foreach ( $results as $faculty ) {
					$mail['fellow'] = $faculty;
					$html           = $this->load->view( 'emails/notice', $mail, TRUE );
                    $status         = $this->Mod_email->SendGmailEmail($faculty['email'], $mail['subject'], $html);
					
					$data = [
						'notice_id'  => $id,
						'teacher_id' => $faculty['id'],
						'email_sent' => $status
					];
					
					$this->db->insert( 'teacher_notice', $data );
				}
			}
			
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
	
	public function get_all_notice( $teacher_id = NULL )
	{
		if ( $teacher_id ) {
			$this->db->where( 'teacher_id', $teacher_id );
			$this->db->where( 'send_to', 'T' );
			$this->db->join( 'teacher_notice TN', 'TN.notice_id = N.id' );
		}
		$this->db->where( 'status', 1 );
		$query = $this->db->get( 'sif_notice N' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_notice( $id )
	{
		$this->db->where( 'id', $id );
		$query = $this->db->get( 'sif_notice' );
		if ( $query->num_rows() > 0 ) {
			$row          = $query->row();
			$row->sent_to = $this->get_notice_teachers( $id );
			return $row;
		}
		return FALSE;
	}
	
	public function get_notice_teachers( $id )
	{
		$query = $this->db->select( 'teacher_id' )
			->where( 'notice_id', $id )
			->get( 'teacher_notice' );
		
		if ( $query->num_rows() > 0 ) {
			$results = $query->result_array();
			
			return array_column( $results, 'teacher_id' );
		}
		
		return FALSE;
	}
	
	public function get_notice_teachers_details( $id )
	{
		$query = $this->db->select( 'tn.teacher_id, t.tec_name, t.mobile, t.email, tn.email_sent' )
			->where( 'tn.notice_id', $id )
			->join( 'sif_teacher t', 't.id=tn.teacher_id', 'left' )
			->get( 'teacher_notice tn' );
		
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			
			return $results;
		}
		
		return FALSE;
	}
	
	public function get_all_std_notice( $type = 'S' )
	{
		$this->db->where( 'send_to', $type );
		$query = $this->db->order_by( 'id', 'DESC' )->get( 'sif_notice' );
		if ( $query->num_rows() > 0 ) {
			return $query->result();
		}
		return FALSE;
	}
	
	public function get_std_notice( $id )
	{
		$this->db->where( 'id', $id );
		$query = $this->db->get( 'sif_notice' );
		if ( $query->num_rows() > 0 ) {
			$row           = $query->row();
			$row->doc_ids  = $this->get_notice_docs( $row->id );
			$row->students = $this->get_notice_docs_details( $row->id );
			$row->teachers = $this->get_notice_teachers_details( $row->id );
			return $row;
		}
		return FALSE;
	}
	
	public function get_notice_docs( $id )
	{
		$query = $this->db->select( 'doc_id' )
			->where( 'notice_id', $id )
			->get( 'doc_notice' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result_array();
			
			return array_column( $results, 'doc_id' );
		}
		return FALSE;
	}
	
	public function get_notice_docs_details( $id )
	{
		$query = $this->db->select( 'dn.doc_id, m.doc_name,m.phone, m.email, dn.email_sent' )
			->where( 'dn.notice_id', $id )
			->join( 'sif_admission m', 'm.id = dn.doc_id', 'left' )
			->get( 'doc_notice dn' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			
			return $results;
		}
		return FALSE;
	}
	
	
}
