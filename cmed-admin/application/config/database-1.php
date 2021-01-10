<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


$active_group = "default";
$active_record = TRUE;

$db['default']['hostname'] = 'localhost';
$db['default']['username'] = 'root';
$db['default']['password'] = 'jnahian';
$db['default']['database'] = 'bigm_cmed';
$db['default']['dbdriver'] = 'mysql';
$db['default']['dbprefix'] = '';
$db['default']['pconnect'] = TRUE;
$db['default']['db_debug'] = TRUE;
$db['default']['cache_on'] = FALSE;
$db['default']['cachedir'] = '';
$db['default']['char_set'] = 'utf8';
$db['default']['dbcollat'] = 'utf8_general_ci';
$db['default']['swap_pre'] = '';
$db['default']['autoinit'] = TRUE;
$db['default']['stricton'] = FALSE;

//bigm
$db['bigm']['hostname'] = 'localhost';
$db['bigm']['username'] = 'root';
$db['bigm']['password'] = 'bigm321##';
$db['bigm']['database'] = 'bigm_cmed';
$db['bigm']['dbdriver'] = 'mysql';
$db['bigm']['dbprefix'] = '';
$db['bigm']['pconnect'] = TRUE;
$db['bigm']['db_debug'] = TRUE;
$db['bigm']['cache_on'] = FALSE;
$db['bigm']['cachedir'] = '';
$db['bigm']['char_set'] = 'utf8';

//live
$db['live']['hostname'] = 'localhost';
$db['live']['username'] = 'cmedbd_admin';
$db['live']['password'] = 'A467)9amiZeL';
$db['live']['database'] = 'cmedbd_app';
$db['live']['dbdriver'] = 'mysql';
$db['live']['dbprefix'] = '';
$db['live']['pconnect'] = TRUE;
$db['live']['db_debug'] = TRUE;
$db['live']['cache_on'] = FALSE;
$db['live']['cachedir'] = '';
$db['live']['char_set'] = 'utf8';





/* End of file database.php */
/* Location: ./system/application/config/database.php */
