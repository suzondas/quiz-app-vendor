<?php

/**
 * Created by PhpStorm.
 * User: Bigm
 * Date: 16/11/16
 * Time: 1:28 PM
 */
class Mod_email extends CI_Model
{
    private $config, $cc;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        $this->config = new stdClass();

        $this->config->host = 'mail.cmedbd.com';
        $this->config->user = 'info@cmedbd.com';
        $this->config->pass = 'R@Qs;Dg8zWsC';
        $this->config->port = 25;

        $this->config->from      = 'cmedbd.com@gmail.com';
        $this->config->from_name = 'CMEDBD';

        $this->cc = 'no-reply@cmedbd.com'; // U})Y9r2ggtp;
    }

    public function send_email($to, $subject, $msg)
    {
        $config['mailtype'] = 'html';
        $config['protocol'] = 'sendmail';
        $config['mailpath'] = '/usr/sbin/sendmail';
        $config['charset']  = 'utf-8';
        $config['wordwrap'] = TRUE;
        $config['validate'] = TRUE;
        $config['priority'] = 1;

        $config['smtp_host'] = $this->config->host;
        $config['smtp_user'] = $this->config->user;
        $config['smtp_pass'] = $this->config->pass;
        $config['smtp_port'] = $this->config->port;

        $this->email->initialize($config);

        $this->email->from($this->config->from, $this->config->from_name);
        $this->email->to($to);
        $this->email->reply_to('cmedbd.com@gmail.com', 'CMEDBD');
//		$this->email->bcc( $this->cc );
        $this->email->subject($subject);
        $this->email->message($msg);

        if ($this->session->has_userdata('attachment')) {
            $attachment = $this->session->userdata('attachment');
            $this->email->attach($attachment);
        }

        if ($this->email->send()) {
            $this->session->unset_userdata('attachment');
            return TRUE;
        }
//		echo $this->email->print_debugger();
        return FALSE;
    }

    public function SendGmailEmail($to, $subject, $msg)
    {
        $config = Array(
            'protocol'          => 'smtp',
            'smtp_host'         => 'ssl://smtp.googlemail.com',
            'smtp_port'         => 465,
            'smtp_user'         => 'cmedbd.com@gmail.com',
            'smtp_pass'         => 'cmed@2019',
            'mailtype'          => 'html',
            'charset'           => 'utf-8',
            'wordwrap'          => TRUE,
            'allow_self_signed' => TRUE,
        );

        $this->email->initialize($config);
        $this->email->set_newline("\r\n");

        $this->email->from('cmedbd.com@gmail.com', 'CMEDBD', 'cmedbd.com@gmail.com');
        $this->email->to($to);
        $this->email->subject($subject);
        $this->email->message($msg);

        if ($this->email->send()) {
            return TRUE;
        }
//        return $this->email->print_debugger();
        return FALSE;
    }
}
