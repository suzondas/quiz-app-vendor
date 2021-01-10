<?php if ( !defined( 'BASEPATH' ) ) exit( 'No direct script access allowed' );

//$config['SMTPSecure']     = 'none';
//$config['smtp_crypto']    = 'ssl';
$config['protocol']          = 'smtp';
$config['smtp_host']         = 'smtp.googlemail.com';
$config['smtp_port']         = 465;
$config['smtp_user']         = 'cmedbd.com@gmail.com';
$config['smtp_pass']         = 'cmed@2019';
$config['sender_email']      = 'cmedbd.com@gmail.com';
$config['sender_name']       = 'CEMDBD';
$config['bcc_batch_mode']    = TRUE;
$config['charset']           = 'utf-8';
$config['newline']           = "\r\n";
$config['crlf']              = "\r\n";
$config['wordwrap']          = TRUE;
$config['mailtype']          = 'html';
$config['verify_peer']       = FALSE;
$config['verify_peer_name']  = FALSE;
$config['allow_self_signed'] = TRUE;

// $config['SMTPSecure']         = 'ssl';
// $config['protocol']           = 'ssl://gator3201.hostgator.com';
// $config['smtp_host']          = 'gator3201.hostgator.com';
// $config['smtp_port']          = '465';
// $config['smtp_user']          = 'info@banbeis.gov.bd';
// $config['smtp_pass']          = 'ban123';

// $config['sender_email'] 	  = 'info@banbeis.gov.bd';
// $config['sender_name'] 	      = 'EIIN Tracking Info.';
