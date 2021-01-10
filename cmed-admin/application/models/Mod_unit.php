<?php
/**
 * Created by PhpStorm.
 * User: nahia
 * Date: 9/23/2017
 * Time: 9:28 PM
 */

class Mod_unit extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    function save_data()
    {
        if ( $this->input->post() ) {
            $links = json_encode( $this->input->post( 'links', TRUE ) );
            $data = [
                'course_id' => $this->input->post( 'course_id', TRUE ),
                'module_id' => $this->input->post( 'module_id', TRUE ),
                'name'      => $this->input->post( 'name', TRUE ),
                'code'      => $this->input->post( 'code', TRUE ),
                'duration'  => $this->input->post( 'duration', TRUE ),
                'details'   => base64_encode( $this->input->post( 'details' ) ),
                'links'     => $links,
            ];
            $this->db->trans_start();
            $flag = $this->db->insert( 'module_units', $data );
            $unit_id = $this->db->insert_id();

            $titles = $this->input->post( 'title', TRUE );
            $descs = $this->input->post( 'desc', TRUE );

            if ( $titles ) {
                $condition_photo = array('size' => '10000');
                $photos = $this->Mod_file_upload->multi_upload( 'unit_attachment', 'attachment', 'jpg|jpeg|png|txt|doc|docx|xls|xlsx|pdf|ppt|pptx', $condition_photo );

                foreach ( $titles as $i => $title ) {
                    if ( $title ) {
                        $n_data = [
                            'unit_id'    => $unit_id,
                            'title'      => $title,
                            'desc'       => $descs[$i],
                            'created_at' => date( 'Y-m-d h:i:s' ),
                            'status'     => 1
                        ];
                        if ( $photos[$i]['status'] ) {
                            $n_data['attachment'] = $photos[$i]['path'];
                        }

                        $flag = $this->db->insert( 'unit_attachments', $n_data );
                    }
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

    function update_data()
    {

        if ( $this->input->post() ) {
            $id = $this->input->post( 'auto_id', TRUE );
            $links = json_encode( $this->input->post( 'links', TRUE ) );
            $data = [
                'course_id' => $this->input->post( 'course_id', TRUE ),
                'module_id' => $this->input->post( 'module_id', TRUE ),
                'name'      => $this->input->post( 'name', TRUE ),
                'code'      => $this->input->post( 'code', TRUE ),
                'duration'  => $this->input->post( 'duration', TRUE ),
                'details'   => base64_encode( $this->input->post( 'details' ) ),
                'links'     => $links,
            ];

            $this->db->trans_start();
            $flag = $this->db->update( 'module_units', $data, ['id' => $id] );

            $titles = $this->input->post( 'title', TRUE );
            $descs = $this->input->post( 'desc', TRUE );

            $this->db->delete( 'unit_attachments', ['unit_id' => $id] );

            if ( $titles ) {
                $condition_photo = array('size' => '10000');
                $photos = $this->Mod_file_upload->multi_upload( 'unit_attachment', 'attachment', 'jpg|jpeg|png|txt|doc|docx|xls|xlsx|pdf|ppt|pptx', $condition_photo );

                foreach ( $titles as $i => $title ) {
                    if ( $title ) {
                        $n_data = [
                            'unit_id'    => $id,
                            'title'      => $title,
                            'desc'       => $descs[$i],
                            'created_at' => date( 'Y-m-d h:i:s' ),
                            'status'     => 1
                        ];
                        if ( $photos[$i]['status'] ) {
                            $n_data['attachment'] = $photos[$i]['path'];
                        }

                        $flag = $this->db->insert( 'unit_attachments', $n_data );
                    }
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

    function get_records_list()
    {
        $this->db->where( 'status', 1 );
        $this->db->order_by( 'module_id, code' );
        $query = $this->db->get( 'module_units' );

        if ( $query->num_rows() > 0 ) {
            return $query->result();
        }

        return FALSE;
    }

    function get_unit_details($id)
    {
        $this->db->where( 'id', $id );
        $query = $this->db->get( 'module_units' );

        if ( $query->num_rows() > 0 ) {
            return $query->row();
        }

        return FALSE;
    }
}