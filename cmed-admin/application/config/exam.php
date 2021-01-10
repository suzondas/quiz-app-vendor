<?php if ( !defined( 'BASEPATH' ) ) exit( 'No direct script access allowed' );

/**
 * Exam Mark and duration config
 */
$config['exam_config'] = (object) array(
    'duration'        => 30,
    'mcq_mark'        => 2.5,
    'sba_mark'        => 0,
    'negetive_mark'   => 0,
    'assesment_total' => 40,
    'online_total'    => 10,
    'mcq_ques_count'  => 4,
    'online_pass'     => 60, //in %
    'pass'            => 60, //in %
    'on_site'         => [
        'mcq'   => 100,
        'essay' => 50,
        'oral'  => 150,
        'pass'  => 60 // in %
    ],
);