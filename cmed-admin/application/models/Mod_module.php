<?php
/**
 * Created by PhpStorm.
 * User: Nahian
 * Date: 10/13/2017
 * Time: 11:18 PM
 */

class Mod_module extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function save_data()
    {
        $data = [
            'course_id' => $this->input->post( 'course_id', TRUE ),
            'name'      => $this->input->post( 'name', TRUE ),
            'duration'  => $this->input->post( 'duration', TRUE ),
            'sl'        => $this->input->post( 'sl', TRUE )
        ];

        $flag = $this->db->insert( 'modules', $data );

        if ( $flag ) {
            return TRUE;
        }

        return FALSE;
    }

    public function update_data( $id )
    {
        $data = [
            'course_id' => $this->input->post( 'course_id', TRUE ),
            'name'      => $this->input->post( 'name', TRUE ),
            'duration'  => $this->input->post( 'duration', TRUE ),
            'sl'        => $this->input->post( 'sl', TRUE )
        ];

        $flag = $this->db->where( 'id', $id )->update( 'modules', $data );

        if ( $flag ) {
            return TRUE;
        }

        return FALSE;
    }

    public function save_current_module()
    {
        $year = $this->input->post( 'year', TRUE );
        $session = $this->input->post( 'session', TRUE );
        $module = $this->input->post( 'module', TRUE );
        $data = [
            'year'       => $year,
            'session'    => $session,
            'module_id'  => $module,
            'created_at' => database_formatted_date(),
            'created_by' => AUTH_EMAIL
        ];
        $this->db->trans_start();
        $this->db->insert( 'current_module', $data );

        $this->load->model('Mod_admission');
        $docs = $this->Mod_admission->get_year_session_doc_ids();

        // update each doc row
        foreach ( $docs as $doc ) {
            $this->db->set('module', $module);
            $this->db->where('id', $doc->id);
            $this->db->update('sif_admission');
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

    public function get_modules()
    {
        $query = $this->db->get( 'modules' );
        if ( $query->num_rows() > 0 ) {
            $result = $query->result();
            return $result;
        }
        return FALSE;
    }

    public function get_module( $id )
    {
        $this->db->where( 'id', $id );
        $query = $this->db->get( 'modules' );
        if ( $query->num_rows() > 0 ) {
            $result = $query->row();
            return $result;
        }
        return FALSE;
    }
}