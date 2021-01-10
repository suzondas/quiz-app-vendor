<?php

/**
 * Created by PhpStorm.
 * User: Bigm
 * Date: 18/09/16
 * Time: 1:15 PM
 */
class Mod_users extends CI_Model 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function get_users_groups()
    {
        $data = ['' => 'Select'];
        $res =  $this->ion_auth->groups()->result();;

        foreach ($res as $row)
        {
            $data[$row->id] = $row->name;
        }
        return $data;
    }
}