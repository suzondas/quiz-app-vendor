<?php

if ( !function_exists( 'global_image_url' ) ) {
	
	function global_image_url()
	{
		$CI = &get_instance();
		return $CI->config->slash_item( 'global_image_url' );
	}
	
}

function get_name_by_auto_id( $table_name = NULL, $auto_id = NULL, $field_name = 'name' )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $auto_id ) and !empty( $field_name ) ) {
		
		$query     = $ci->db->select( [ 'id', $field_name ] );
		$query     = $ci->db->where( 'id', $auto_id );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult->$field_name;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}

function get_faculty_name_by_course_code_faculty_code( $table_name = NULL, $course_code, $faculty_code = NULL, $field_name = 'faculty_name' )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $faculty_code ) and !empty( $field_name ) ) {
		
		$query     = $ci->db->select( $field_name );
		$query     = $ci->db->where( 'course_code', $course_code );
		$query     = $ci->db->where( 'faculty_code', $faculty_code );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult->$field_name;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}


function get_student_fullname( $student_id )
{
	
	$ci = &get_instance();
	
	
	$query     = $ci->db->select( 'id, first_name, middle_name, last_name' );
	$query     = $ci->db->where( 'student_id', $student_id );
	$query     = $ci->db->get( 'student_info_master' );
	$total_row = $query->num_rows();
	if ( $total_row > 0 ) {
		$row = $query->row();
		return $row->first_name . ' ' . $row->middle_name . ' ' . $row->last_name;
	}
	return FALSE;
}

function get_name_by_id( $table_name = NULL, $value = NULL, $id = 'id', $field_name = 'name' )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $value ) and !empty( $id ) and !empty( $field_name ) ) {
		
		$query     = $ci->db->select( $field_name );
		$query     = $ci->db->where( $id, $value );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult->$field_name;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}


function get_expense_type_by_auto_id( $table_name = NULL, $auto_id = NULL, $field_name = NULL )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $auto_id ) and !empty( $field_name ) ) {
		
		$query     = $ci->db->select( 'id,' . $field_name );
		$query     = $ci->db->where( 'id', $auto_id );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult->$field_name;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}

function get_account_name_by_auto_id( $table_name = NULL, $auto_id = NULL, $field_name = NULL )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $auto_id ) and !empty( $field_name ) ) {
		
		$query     = $ci->db->select( 'id,' . $field_name );
		$query     = $ci->db->where( 'id', $auto_id );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult->$field_name;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}

function get_month_name( $month )
{
	switch ( $month ) {
		case "01":
			return "January";
			break;
		case "02":
			return "February";
			break;
		case "03":
			return "March";
			break;
		case "04":
			return "April";
			break;
		case "05":
			return "May";
			break;
		case "06":
			return "June";
			break;
		case "07":
			return "July";
			break;
		case "08":
			return "August";
			break;
		case "09":
			return "September";
			break;
		case "10":
			return "October";
			break;
		case "11":
			return "November";
			break;
		case "12":
			return "December";
			break;
	}
	
}

/* convert no. to in word */
function convert_number_to_words( $number )
{
	
	$hyphen      = '-';
	$conjunction = ' and ';
	$separator   = ', ';
	$negative    = 'negative ';
	$decimal     = ' point ';
	$dictionary  = array(
		0                   => 'zero',
		1                   => 'one',
		2                   => 'two',
		3                   => 'three',
		4                   => 'four',
		5                   => 'five',
		6                   => 'six',
		7                   => 'seven',
		8                   => 'eight',
		9                   => 'nine',
		10                  => 'ten',
		11                  => 'eleven',
		12                  => 'twelve',
		13                  => 'thirteen',
		14                  => 'fourteen',
		15                  => 'fifteen',
		16                  => 'sixteen',
		17                  => 'seventeen',
		18                  => 'eighteen',
		19                  => 'nineteen',
		20                  => 'twenty',
		30                  => 'thirty',
		40                  => 'fourty',
		50                  => 'fifty',
		60                  => 'sixty',
		70                  => 'seventy',
		80                  => 'eighty',
		90                  => 'ninety',
		100                 => 'hundred',
		1000                => 'thousand',
		1000000             => 'million',
		1000000000          => 'billion',
		1000000000000       => 'trillion',
		1000000000000000    => 'quadrillion',
		1000000000000000000 => 'quintillion'
	);
	
	if ( !is_numeric( $number ) ) {
		return FALSE;
	}
	
	if ( ( $number >= 0 && (int)$number < 0 ) || (int)$number < 0 - PHP_INT_MAX ) {
		// overflow
		trigger_error(
			'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
			E_USER_WARNING
		);
		return FALSE;
	}
	
	if ( $number < 0 ) {
		return $negative . convert_number_to_words( abs( $number ) );
	}
	
	$string = $fraction = NULL;
	
	if ( strpos( $number, '.' ) !== FALSE ) {
		list( $number, $fraction ) = explode( '.', $number );
	}
	
	switch ( TRUE ) {
		case $number < 21:
			$string = $dictionary[$number];
			break;
		case $number < 100:
			$tens   = ( (int)( $number / 10 ) ) * 10;
			$units  = $number % 10;
			$string = $dictionary[$tens];
			if ( $units ) {
				$string .= $hyphen . $dictionary[$units];
			}
			break;
		case $number < 1000:
			$hundreds  = $number / 100;
			$remainder = $number % 100;
			$string    = $dictionary[$hundreds] . ' ' . $dictionary[100];
			if ( $remainder ) {
				$string .= $conjunction . convert_number_to_words( $remainder );
			}
			break;
		default:
			$baseUnit     = pow( 1000, floor( log( $number, 1000 ) ) );
			$numBaseUnits = (int)( $number / $baseUnit );
			$remainder    = $number % $baseUnit;
			$string       = convert_number_to_words( $numBaseUnits ) . ' ' . $dictionary[$baseUnit];
			if ( $remainder ) {
				$string .= $remainder < 100 ? $conjunction : $separator;
				$string .= convert_number_to_words( $remainder );
			}
			break;
	}
	
	if ( NULL !== $fraction && is_numeric( $fraction ) ) {
		$string .= $decimal;
		$words  = array();
		foreach ( str_split( (string)$fraction ) as $number ) {
			$words[] = $dictionary[$number];
		}
		$string .= implode( ' ', $words );
	}
	
	return $string;
}

function helper_get_all_details_by_auto_id( $table_name = NULL, $auto_id = NULL )
{
	
	$ci = &get_instance();
	
	if ( !empty( $table_name ) and !empty( $auto_id ) ) {
		
		//$query = $ci->db->select('id,'.$field_name);
		$query     = $ci->db->where( 'id', $auto_id );
		$query     = $ci->db->get( $table_name );
		$total_row = $query->num_rows();
		if ( $total_row > 0 ) {
			$ressult = $query->row();
			return $ressult;
		} else {
			return FALSE;
		}
	} else {
		return FALSE;
	}
}

function helper_sub_list_by_class_group_id( $class_id = NULL, $group_id = NULL )
{
	
	$ci = &get_instance();
	
	
	$query     = $ci->db->select( 'id,subject_id,subject_name' );
	$query     = $ci->db->where( 'class_id', $class_id );
	$query     = $ci->db->where( 'group_id', $group_id );
	$query     = $ci->db->order_by( 'subject_name', 'ASC' );
	$query     = $ci->db->get( 'subject_mapping' );
	$total_row = $query->num_rows();
	if ( $total_row > 0 ) {
		$ressult = $query->result();
		return $ressult;
	} else {
		return FALSE;
	}
}

function get_gender_name( $id )
{
	switch ( $id ) {
		case "1":
			return "Male";
			break;
		case "2":
			return "Female";
			break;
	}
	
}

function get_religion_name( $id )
{
	switch ( $id ) {
		case "1":
			return "Muslim";
			break;
		case "2":
			return "Christian";
			break;
		case "3":
			return "Buddhist";
			break;
		case "4":
			return "Hindus";
			break;
		case "5":
			return "Others";
			break;
	}
}

function get_pro_in_eng_name( $id )
{
	switch ( $id ) {
		case "1":
			return "Excellent";
			break;
		case "2":
			return "Good";
			break;
		case "3":
			return "Average";
			break;
		case "4":
			return "Fair";
			break;
		case "5":
			return "Poor";
			break;
	}
}

function get_app_status_name( $status )
{
	$ci =& get_instance();
	
	$ci->load->library( 'common_lib' );
	
	$arr = $ci->common_lib->get_app_status_array();
	
	return $arr[$status];
}


if ( !function_exists( 'generate_random_password' ) ) {
	
	function generate_random_password( $length )
	{
		return strtoupper( random_string( 'alnum', $length ) );
	}
	
}

if ( !function_exists( 'get_teacher_name' ) ) {
	
	function get_teacher_name( $teacher_id )
	{
		$ci =& get_instance();
		$ci->db->select( 'tec_name' );
		$query = $ci->db->get_where( 'sif_teacher', array( 'id' => $teacher_id ) );
		if ( $query->num_rows() > 0 ) return $query->row()->tec_name;
	}
	
}
if ( !function_exists( 'get_teacher_name_by_id' ) ) {
	
	function get_teacher_name_by_id( $teacher_id )
	{
		$ci =& get_instance();
		$ci->db->select( 'tec_name' );
		$query = $ci->db->get_where( 'sif_teacher', array( 'teacher_id' => $teacher_id ) );
		if ( $query->num_rows() > 0 ) return $query->row()->tec_name;
	}
	
}

if ( !function_exists( 'get_day_name' ) ) {
	
	function get_day_name( $day = NULL )
	{
		$days = array(
			''  => 'Select',
			'1' => 'SAT',
			'2' => 'SUN',
			'3' => 'MON',
			'4' => 'TUE',
			'5' => 'WED',
			'6' => 'THU',
			'7' => 'FRI',
		);
		if ( $day ) $days = $days[$day];
		return $days;
	}
	
}

if ( !function_exists( 'get_grade_by_marks' ) ) {
	
	function get_grade_by_marks( $mark )
	{
		$grade = array();
		
		if ( $mark >= 80 && $mark <= 100 ) {
			$grade = array(
				'name'  => 'A+',
				'point' => 5,
			);
		} elseif ( $mark >= 70 && $mark <= 79 ) {
			$grade = array(
				'name'  => 'A',
				'point' => 4,
			);
		} elseif ( $mark >= 60 && $mark <= 69 ) {
			$grade = array(
				'name'  => 'A-',
				'point' => 3.5,
			);
		} elseif ( $mark >= 50 && $mark <= 59 ) {
			$grade = array(
				'name'  => 'B',
				'point' => 3,
			);
		} elseif ( $mark >= 40 && $mark <= 49 ) {
			$grade = array(
				'name'  => 'C',
				'point' => 2,
			);
		} elseif ( $mark >= 33 && $mark <= 39 ) {
			$grade = array(
				'name'  => 'D',
				'point' => 1,
			);
		} elseif ( $mark >= 0 && $mark <= 32 ) {
			$grade = array(
				'name'  => 'F',
				'point' => 0,
			);
		} else {
			$grade = array(
				'name'  => 'Invalid',
				'point' => 'Invalid',
			);
		}
		
		return $grade;
	}
	
}

function get_greading_system()
{
	$grade = array(
		array(
			'name'     => 'A+',
			'interval' => '80-100',
			'point'    => 5,
		),
		array(
			'name'     => 'A+',
			'interval' => '80-100',
			'point'    => 5,
		),
		array(
			'name'     => 'A',
			'interval' => '70-79',
			'point'    => 4,
		),
		array(
			'name'     => 'A-',
			'interval' => '60-69',
			'point'    => 3.5,
		),
		array(
			'name'     => 'B',
			'interval' => '50-59',
			'point'    => 3,
		),
		array(
			'name'     => 'C',
			'interval' => '40-49',
			'point'    => 2,
		),
		array(
			'name'     => 'D',
			'interval' => '33-39',
			'point'    => 1,
		),
		array(
			'name'     => 'F',
			'interval' => '0-32',
			'point'    => 0,
		),
	);
	return $grade;
}

if ( !function_exists( 'get_batch_name' ) ) {
	function get_batch_name( $course, $batch )
	{
		$ci =& get_instance();
		
		$ci->db->select( 'subject' );
		$ci->db->where(
			array(
				'course_code' => $course,
				'batch_code'  => $batch,
			)
		);
		$query = $ci->db->get( 'sif_batch' );
		
		if ( $query->num_rows() > 0 ) {
			return $query->row()->subject;
		}
		return FALSE;
	}
}

if ( !function_exists( 'get_topic_name' ) ) {
	function get_topic_name( $course, $topics )
	{
		$ci     =& get_instance();
		$topics = explode( ',', $topics );
		$ci->db->select( 'class_topic_name' );
		$ci->db->where(
			array(
				'course_code' => $course,
			)
		);
		$ci->db->where_in( 'id', $topics );
		$query = $ci->db->get( 'sif_class_topic' );
		
		if ( $query->num_rows() > 0 ) {
			$result       = $query->result();
			$topics_names = array();
			foreach ( $result as $row ) {
				array_push( $topics_names, $row->class_topic_name );
			}
			return implode( ',', $topics_names );
		}
		return FALSE;
	}
}
if ( !function_exists( 'get_subject_name' ) ) {
	function get_subject_name( $ids = NULL )
	{
		$ci  =& get_instance();
		$ids = explode( ',', $ids );
		$ci->db->select( 'subject' );
		$ci->db->where( 'status', 1 );
		$ids ? $ci->db->where_in( 'id', $ids ) : '';
		$query = $ci->db->get( 'sif_subject' );
		
		if ( $query->num_rows() > 0 ) {
			$result    = $query->result();
			$sub_names = array();
			foreach ( $result as $row ) {
				array_push( $sub_names, $row->subject );
			}
			return implode( ', ', $sub_names );
		}
		return FALSE;
	}
}

if ( !function_exists( 'get_changed_date' ) ) {
	function get_changed_date( $str )
	{
		return date( 'Y-m-d', strtotime( date( 'Y-m-d' ) . ' ' . $str ) );
	}
}

/* add this code in helper*/

if ( !function_exists( 'get_evaluation_count' ) ) {
	function get_evaluation_count( $schedule_id, $item_id, $tid )
	{
		$ci         =& get_instance();
		$field_name = eva_field_names( $tid );
		$ci->db->select( $field_name );
		$ci->db->where( $field_name, $item_id );
		$ci->db->where( 'schedule_id', $schedule_id );
		$count = $ci->db->count_all_results( 'sif_teacher_evaluation' );
		return $count;
	}
}

if ( !function_exists( 'get_evaluation_suggesion' ) ) {
	function get_evaluation_suggesion( $schedule_id )
	{
		$ci =& get_instance();
		$ci->db->select( 'suggestions' );
		$ci->db->where( 'schedule_id', $schedule_id );
		$query = $ci->db->get( 'sif_teacher_evaluation' );
		if ( $query->num_rows() > 0 ) {
			$results = $query->result();
			$data    = array();
			foreach ( $results as $result ) {
				array_push( $data, $result->suggestions );
			}
			
			return implode( ', ', $data );
		} else {
			return FALSE;
		}
	}
}

if ( !function_exists( 'eva_field_names' ) ) {
	function eva_field_names( $id )
	{
		$data = array(
			'1' => 'introduction',
			'2' => 'knowledge',
			'3' => 'express',
			'4' => 'interaction',
		);
		$data = $id ? $data[$id] : $data;
		return $data;
	}
}

if ( !function_exists( 'array_column' ) ) {
	function array_column( $arr, $value, $key )
	{
		$data = [];
		
		foreach ( $arr as $item ) {
			$data[$item[$key]] = $item[$value];
		}
		
		return $data;
	}
}

if ( !function_exists( 'user_date' ) ) {
	function user_date( $date )
	{
		return date( 'd M, Y', strtotime( $date ) );
	}
}
if ( !function_exists( 'get_ans_options' ) ) {
	function get_ans_options( $id )
	{
		$ci =& get_instance();
		
		$ci->db->select( 'ans, index_seqn' );
		$ci->db->where( 'master_ref_id', $id );
		// $ci->db->where_in('id', $topics);
		$query = $ci->db->get( 'oe_qsn_bnk_ans' );
		
		if ( $query->num_rows() > 0 ) {
			$result       = $query->result();
			$option_names = array();
			foreach ( $result as $row ) {
				$ans    = strip_tags( $row->ans );
				$option = "<p>{$row->index_seqn}) {$ans}</p>";
				array_push( $option_names, $option );
			}
			return implode( '', $option_names );
		}
		return FALSE;
	}
}

if ( !function_exists( 'get_mcq_ans' ) ) {
	function get_mcq_ans( $id )
	{
		$ci =& get_instance();
		
		$ci->db->select( 'index_seqn, correct_ans' );
		$ci->db->where( 'master_ref_id', $id );
		// $ci->db->where_in('id', $topics);
		$query = $ci->db->get( 'oe_qsn_bnk_ans' );
		
		if ( $query->num_rows() > 0 ) {
			$result       = $query->result();
			$option_names = array();
			foreach ( $result as $row ) {
				$option = "<p>{$row->index_seqn}) {$row->correct_ans}</p>";
				array_push( $option_names, $option );
			}
			return implode( '', $option_names );
		}
		return FALSE;
	}
}

if ( !function_exists( 'get_question_use_count' ) ) {
	function get_question_use_count( $id )
	{
		
		$ci = &get_instance();
		
		if ( $id ) {
			$ci->db->select( 'id', $id );
			$ci->db->where( 'question_id', $id );
			$query = $ci->db->get( 'oe_exam_question' );
//            die(json_encode($query->num_rows()));
			return $query->num_rows();
		} else {
			return FALSE;
		}
	}
}

if ( !function_exists( 'home_url' ) ) {
	function home_url( $uri = '' )
	{
		$url = config_item( 'home_url' );
		if ( $uri ) {
			$url .= "/$uri";
		}
		return urldecode( $url );
	}
}

if ( !function_exists( 'show_html_elements_in_text' ) ) {
	function show_html_elements_in_text( $html )
	{
		return html_entity_decode( trim( strip_tags( $html ) ) );
	}
}

if ( !function_exists( 'database_formatted_date' ) ) {
	function database_formatted_date( $datetime = NULL )
	{
		if ( $datetime ) {
			return date( "Y-m-d H:i:s", strtotime( $datetime ) );
		} else {
			return date( "Y-m-d H:i:s" );
		}
	}
}

if ( !function_exists( 'is_valid_image' ) ) {
	function is_valid_image( $file = NULL )
	{
		if ( file_exists( $file ) ) {
			$data = getimagesize( $file );
			return is_array( $data ) ? TRUE : FALSE;
		}
		
		return FALSE;
	}
}

if ( !function_exists( 'base64_image_upload' ) ) {
	function base64_image_upload( $file = NULL )
	{
		if ( preg_match( '/^data:image\/(\w+);base64,/', $file, $type ) ) {
			$data = substr( $file, strpos( $file, ',' ) + 1 );
			$type = strtolower( $type[1] ); // jpg, png, gif
			
			if ( !in_array( $type, [ 'jpg', 'jpeg', 'gif', 'png' ] ) ) {
				throw new \Exception( 'invalid image type' );
			}
			
			$data = base64_decode( $data );
			
			if ( $data === FALSE ) {
				throw new \Exception( 'base64_decode failed' );
			}
		} else {
			throw new \Exception( 'did not match data URI with image data' );
		}
		
		return file_put_contents( "test/img.{$type}", $data );
	}
}

if ( !function_exists( 'mpdf_bangla_config' ) ) {
	function mpdf_bangla_config( $additional = [] )
	{
		
		$defaultConfig = ( new Mpdf\Config\ConfigVariables() )->getDefaults();
		$fontDirs      = $defaultConfig['fontDir'];
		
		$defaultFontConfig = ( new Mpdf\Config\FontVariables() )->getDefaults();
		$fontData          = $defaultFontConfig['fontdata'];
		
		$config = [
			'mode'             => 'utf-8',
			'nonPrintMargin'   => '5',
			'setAutoTopMargin' => 'pad',
			'fontDir'          => array_merge( $fontDirs, [
				APPPATH . '/third_party/fonts',
			] ),
			'fontdata'         => $fontData + [
					'solaimanlipi' => [
						'R'          => 'SolaimanLipi.ttf',
						'I'          => 'SolaimanLipi.ttf',
						'useOTL'     => 0xFF,
						'useKashida' => 75,
					]
				]
		];
		
		return $config + $additional;
	}
}

if ( !function_exists( 'attachment_download' ) ) {
	function attachment_download( $link )
	{
		$path = base_url( $link );
		return "<a href='{$path}' download class='btn-link'><i class='fa fa-cloud-download'></i> Download Attachment</a>";
	}
}

if(!function_exists('dd')){
	function dd($value){
		echo "<pre>";
		print_r($value);
		die();
	}
}
if(!function_exists('dj')){
	function dj($value){
		echo json_encode($value);
		die();
	}
}
