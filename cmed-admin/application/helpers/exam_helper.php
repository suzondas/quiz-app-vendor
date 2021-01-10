<?php
/**
 * Created by PhpStorm.
 * User: nahian
 * Date: 1/9/18
 * Time: 12:10 PM
 */

if ( !function_exists( 'makeMyPassword' ) ) {
    function makeMyPassword( $pass )
    {
        return password_hash( $pass, PASSWORD_BCRYPT );
    }
}

if ( !function_exists( 'verifyMyPassword' ) ) {
    function verifyMyPassword( $pass, $hash )
    {
        return password_verify( $pass, $hash );
    }
}
if ( !function_exists( 'inc_string' ) ) {
    function inc_string( $str )
    {
        return preg_replace_callback( "|(\d+)|", "inc", $str );
    }
}

if ( !function_exists( 'inc' ) ) {
    function inc( $matches )
    {
        return ++$matches[1];
    }
}

if ( !function_exists( 'user_logged_in' ) ) {
    function user_logged_in()
    {
        $ci =& get_instance();
        $status = $ci->session->userdata( 'logged_in' );
        return $status;
    }
}

if ( !function_exists( 'is_valid_user' ) ) {
    function is_valid_user( $id )
    {
        $ci =& get_instance();
        if ( user_logged_in() ) {
            $user = $ci->session->userdata( 'user' );
            if ( $id === $user->id ) {
                return TRUE;
            }
        } else {
            redirect( 'user-login' );
        }
        return FALSE;
    }
}

if ( !function_exists( 'db_date_format' ) ) {
    function db_date_format( $date = NULL )
    {
        return $date ? date( 'Y-m-d H:i:s', strtotime( $date ) ) : date( 'Y-m-d H:i:s' );
    }
}
if ( !function_exists( 'user_formated_date' ) ) {
    function user_formated_date( $date = NULL )
    {
        return $date ? date( 'd M, Y', strtotime( $date ) ) : date( 'd M, Y' );
    }
}

if ( !function_exists( 'user_formated_datetime' ) ) {
    function user_formated_datetime( $date = NULL )
    {
        return $date ? date( 'd M, y h:i A', strtotime( $date ) ) : date( 'd M, y h:i A' );
    }
}

if ( !function_exists( 'user_formated_time' ) ) {
    function user_formated_time( $date = NULL )
    {
        return $date ? date( 'h:i A', strtotime( $date ) ) : date( 'h:i A' );
    }
}

if ( !function_exists( 'check_user_permission' ) ) {
    function check_user_permission( $id = NULL )
    {
        $ci =& get_instance();

        if ( !$id ) $id = $ci->uri->segment( 2 );

        if ( is_valid_user( $id ) ) {
            return TRUE;
        } else {
            $ci->session->set_flashdata( 'warning', "<strong>Permission Denied!</strong> You don't have permission to see the page" );
            redirect( '/' );
            die();
        }
    }
}
/**
 * Get and Set Redirect URL
 */
if ( !function_exists( 'redirect_url' ) ) {
    function redirect_url( $url = NULL )
    {
        $ci =& get_instance();

        if ( $url ) {
            return $ci->session->set_userdata( 'redirect_url', $url );
        } else {
            return $ci->session->userdata( 'redirect_url' );
        }
    }
}
if ( !function_exists( 'unset_redirect_url' ) ) {
    function unset_redirect_url()
    {
        $ci =& get_instance();
        return $ci->session->unset_userdata( 'redirect_url' );
    }
}
/**
 * Get and Set Redirect URL
 */
if ( !function_exists( 'prev_url' ) ) {
    function prev_url()
    {
        $url = $_SERVER['HTTP_REFERER'];
        return $url;
    }
}
if ( !function_exists( 'unset_prev_url' ) ) {
    function unset_prev_url()
    {
        $ci =& get_instance();
        return $ci->session->unset_userdata( 'prev_url' );
    }
}
if ( !function_exists( 'get_exam_count_dropdown' ) ) {
    function get_exam_count_dropdown( $count )
    {
        $arr = [];

        for ( $i = 0; $i <= $count; $i++ ) {
            $arr[$i] = $i;
        }

        return $arr;
    }
}

if ( !function_exists( 'count_answers' ) ) {
    function count_answers( $arr )
    {
        if ( !is_array( $arr ) ) {
            $arr = json_decode( $arr, TRUE );
        }
        $count = 0;
        if ( $arr ) {
            foreach ( $arr as $item ) {
                foreach ( $item as $i ) {
                    $count += count( $i );
                }
            }
        }
        return $count;
    }
}

if ( !function_exists( 'extract_qus_ans' ) ) {
    function extract_qus_ans( $arr, $id, $index )
    {
        if ( !is_array( $arr ) ) {
            $arr = json_decode( $arr, TRUE );
        }
        if ( $arr ) {
            foreach ( $arr as $item ) {
                if ( array_key_exists( $id, $item ) ) {
                    if ( is_array( $item[$id] ) ) {
                        if ( array_key_exists( $index, $item[$id] ) ) {
                            $ans = $item[$id][$index];
                            return $ans;
                        }
                    } else {
                        $ans = $item[$id];
                        return $ans;
                    }

                }
            }
        }

        return FALSE;
    }
}

if ( !function_exists( 'add_to_datetime' ) ) {
    function add_to_datetime( $increment )
    {
        return date( 'Y-m-d H:i:s', strtotime( "$increment" ) );
    }
}

if ( !function_exists( 'exam_status' ) ) {
    function exam_status( $id = NULL )
    {
        $array = [
            '' => "Select Status",
            0  => "Inactive",
            1  => "Complete",
            8  => "Started",
            9  => "Open",
        ];

        if ( $id || $id === 0 ) {
            if ( array_key_exists( $id, $array ) ) {
                return $array[$id];
            } else {
                return FALSE;
            }
        } else {
            return $array;
        }
    }
}
if ( !function_exists( 'get_file_extension' ) ) {
    function get_file_extension( $filename )
    {
        $exp = explode( '.', $filename );
        $ext = $exp[count( $exp ) - 1];
        $type = "";
        if ( $ext == 'jpg' || $ext == 'png' || $ext == 'jpeg' || $ext == 'gif' ) {
            $type = 'img';
        } else if ( $ext == 'pdf' ) {
            $type = 'pdf';
        }

        return $type;
    }
}
if ( !function_exists( 'time_difference' ) ) {
    function time_difference( $start, $end )
    {
        $from = new DateTime( $start );
        $to = new DateTime( $end );
        $interval = $from->diff( $to );
        return $interval->format( "%I:%S" );
    }
}

if ( !function_exists( 'objectToArray' ) ) {
    function objectToArray( $d )
    {
        if ( is_object( $d ) ) {
            // Gets the properties of the given object
            // with get_object_vars function
            $d = get_object_vars( $d );
        }

        if ( is_array( $d ) ) {
            /*
            * Return array converted to object
            * Using __FUNCTION__ (Magic constant)
            * for recursive call
            */
            return array_map( __FUNCTION__, $d );
        } else {
            // Return array
            return $d;
        }
    }
}
if ( !function_exists( 'arrayToObject' ) ) {
    function arrayToObject( $d )
    {
        if ( is_array( $d ) ) {
            /*
            * Return array converted to object
            * Using __FUNCTION__ (Magic constant)
            * for recursive call
            */
            return (object)array_map( __FUNCTION__, $d );
        } else {
            // Return object
            return $d;
        }
    }
}
