<?php

/**
 * Description of FileUploadModel
 * @author Nahian
 */
class Mod_file_upload extends CI_Model
{

    private $default_path;

    public function __construct()
    {
        parent::__construct();
        $this->load->library( 'upload' );
        $this->default_path = "upload/";
    }

    public function upload_file( $folder = NULL, $target, $conditions = array(), $id = NULL, $type = 'jpg|jpeg|png' )
    {

        $up_path = $this->default_path . $folder;

        if ( !file_exists( $up_path ) ) {
            mkdir( $up_path, 0777, TRUE );
        }

        $config['upload_path'] = $up_path;
        $config['allowed_types'] = $type;
        if ( isset( $conditions['size'] ) ) {
            $config['max_size'] = $conditions['size'];
        }
        if ( isset( $conditions['width'] ) ) {
            $config['max_width'] = $conditions['width'];
        }
        if ( isset( $conditions['height'] ) ) {
            $config['max_height'] = $conditions['height'];
        }

        if ( $id ) {
            $config['file_name'] = $id;
        } else {
            $config['encrypt_name'] = TRUE;
			$config['overwrite']    = TRUE;
        }
        $file = array('status' => FALSE, 'path' => NULL, 'msg' => NULL);

        $this->upload->initialize( $config );
        if ( $_FILES[$target]['size'] > 0 ) {
            if ( $this->upload->do_upload( $target ) ) {
                $file['status'] = TRUE;
                $arr = $this->upload->data();
                // print_r($arr);
                $file['path'] = $up_path . '/' . $arr['file_name'];
            } else {
                $file['msg'] = $this->upload->display_errors( '', '' );
            }
        }
        return $file;
    }

    public function multi_upload( $folder, $target, $type = 'jpg|jpeg|png', $conditions = array() )
    {

        $up_path = $this->default_path . $folder;

        if ( !file_exists( $up_path ) ) {
            mkdir( $up_path, 0777, TRUE );
        }

        $config['upload_path'] = $up_path;
        $config['allowed_types'] = $type;
        if ( isset( $conditions['size'] ) ) {
            $config['max_size'] = $conditions['size'];
        }
        if ( isset( $conditions['width'] ) ) {
            $config['max_width'] = $conditions['width'];
        }
        if ( isset( $conditions['height'] ) ) {
            $config['max_height'] = $conditions['height'];
        }
        $config['overwrite'] = FALSE;

        $this->upload->initialize( $config );

        $files = $_FILES[$target];

        $images = array();

        foreach ( $files['name'] as $key => $image ) {
            $_FILES['images[]']['name'] = $files['name'][$key];
            $_FILES['images[]']['type'] = $files['type'][$key];
            $_FILES['images[]']['tmp_name'] = $files['tmp_name'][$key];
            $_FILES['images[]']['error'] = $files['error'][$key];
            $_FILES['images[]']['size'] = $files['size'][$key];

            $fileName = $image;

            $config['file_name'] = $fileName;

            $this->upload->initialize( $config );

            if ( $this->upload->do_upload( 'images[]' ) ) {
                $images[$key]['status'] = TRUE;
                $images[$key]['path'] = $up_path . '/' . $this->upload->data()['file_name'];
            } else {
                $images[$key]['status'] = FALSE;
                $images[$key]['msg'] = $this->upload->display_errors();
            }
        }
        return $images;
    }

    public function resizeImage( $path, $width = 300, $height = 300 )
    {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path;
        $config['create_thumb'] = FALSE;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = $width;
        $config['height'] = $height;

        $this->load->library( 'image_lib', $config );

        if ( !$this->image_lib->resize() ) {
            $this->session->set_flashdata( 'type', 'danger' );
            $this->session->set_flashdata( 'msg', $this->image_lib->display_errors() );
            return FALSE;
        } else {
            return TRUE;
        }
    }

    public function waterMark( $path )
    {
        $config['source_image'] = $path;
        $config['wm_text'] = '';
        $config['wm_type'] = 'text';
        $config['wm_font_path'] = './assets/frontpages/fonts/NotoSans-Italic.ttf';
        $config['wm_font_size'] = '8';
        $config['wm_font_color'] = 'efefef';
        $config['wm_vrt_alignment'] = 'bottom';
        $config['wm_hor_alignment'] = 'left';
        $config['wm_vrt_offset'] = '-20';
        $config['wm_hor_offset'] = '20';

        $this->load->library( 'image_lib', $config );

        if ( !$this->image_lib->watermark() ) {
            return FALSE;
        } else {
            return TRUE;
        }
    }

}
