<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of my_controller
 * Custom Controller that check user logedin/authentication status
 * @author Vegan Solutions
 * Date : 21-June-20112
 * @property ion_auth $ion_auth
 * @property Mod_setting $Mod_setting
 */
class My_Controller extends CI_Controller
{
    public $authEmail, $teacher_id;
	public             $data;

    public function __construct()
    {
        parent::__construct();

        $this->load->library(['ion_auth']);
        $this->data['authUser'] = $this->ion_auth->user()->row();
        if ($this->data['authUser']) {
            $groups = $this->ion_auth->get_users_groups()->result();
            $this->data['authUser']->groups = $groups;
            $this->data['authUser']->role = $groups[0]->description;
            $this->authEmail = $this->data['authUser']->email;
            $this->teacher_id = $this->data['authUser']->teacher_id;
            define('AUTH_EMAIL', $this->authEmail);

            if ($this->ion_auth->is_admin()) {
                $this->data['teacher_auto_id'] = NULL;
            }
        }
//        $this->data['teacher_auto_id'] =  $this->data['authUser']->id;
        $this->load->model('Mod_setting');
        $this->data['company'] = $this->Mod_setting->get_general_info();
        $this->data['msg'] = $this->Mod_setting->get_messages();
        if (!$this->ion_auth->logged_in()) {
            redirect('login');
        }
    }

}
