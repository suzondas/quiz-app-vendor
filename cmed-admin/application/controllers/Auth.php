<?php defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

/**
 * Class Auth
 * @property Mod_common    $Mod_common
 * @property Mod_executive $Mod_executive
 * @property ion_auth      $ion_auth
 * @property Mod_setting   $Mod_setting
 * @property common_lib    $common_lib
 */
class Auth extends CI_Controller
{
    protected $authEmail, $teacher_id;
    protected $data;
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library( array('ion_auth', 'form_validation') );
        $this->load->helper( array('url', 'language') );
        $this->load->model( 'Mod_setting' );
        $this->load->model( 'Mod_common' );
        $this->load->model( 'Mod_executive' );

        $this->form_validation->set_error_delimiters( $this->config->item( 'error_start_delimiter', 'ion_auth' ), $this->config->item( 'error_end_delimiter', 'ion_auth' ) );

        $this->lang->load( 'auth' );

        $this->data['module_name'] = 'Users';
        $this->data['breadcrumb'] = array($this->data['module_name']);

        $this->data['authUser'] = $this->ion_auth->user()->row();
        if ( $this->data['authUser'] ) {
            $groups = $this->ion_auth->get_users_groups()->result();
            $this->data['authUser']->groups = $groups;
            $this->data['authUser']->role = $groups[0]->description;
            $this->authEmail = $this->data['authUser']->email;
            $this->teacher_id = $this->data['authUser']->teacher_id;
            define( 'AUTH_EMAIL', $this->authEmail );
        }
        $this->data['teacher_auto_id'] = $this->teacher_id;
        $this->data['msg'] = $this->Mod_setting->get_messages();
        $this->data['company'] = $this->Mod_setting->get_general_info();
        $this->data['status_array'] = $this->common_lib->get_status_array();
        $this->data['group_array'] = $this->Mod_common->get_group_array();

    }

    // redirect if needed, otherwise display the user list
    public function index()
    {
        array_push( $this->data['breadcrumb'], 'Users List' );
        if ( !$this->ion_auth->logged_in() ) {
            // redirect them to the login page
            redirect( 'login', 'refresh' );
        } elseif ( !$this->ion_auth->is_admin() ) // remove this elseif if you want to enable this for non-admins
        {
            // redirect them to the home page because they must be an administrator to view this
            return show_error( 'You must be an administrator to view this page.' );
        } else {
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata( 'message' );

            //list the users
            $groups = array(1, 2, 3);
            $this->data['users'] = $this->ion_auth->users( $groups )->result();
            foreach ( $this->data['users'] as $k => $user ) {
                $this->data['users'][$k]->groups = $this->ion_auth->get_users_groups( $user->id )->result();
            }

            $this->_render_page( 'auth/index', $this->data );
        }
    }

    // log the user in
    public function login()
    {
        $this->data['title'] = $this->lang->line( 'login_heading' );

        //validate form input
        $this->form_validation->set_rules( 'identity', str_replace( ':', '', $this->lang->line( 'login_identity_label' ) ), 'required' );
        $this->form_validation->set_rules( 'password', str_replace( ':', '', $this->lang->line( 'login_password_label' ) ), 'required' );

        if ( $this->form_validation->run() == TRUE ) {
            // check to see if the user is logging in
            // check for "remember me"
            $remember = (bool)$this->input->post( 'remember' );

            if ( $this->ion_auth->login( $this->input->post( 'identity' ), $this->input->post( 'password' ), $remember ) ) {
                //if the login is successful
                //redirect them back to the home page
                $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
                redirect( '/', 'refresh' );
            } else {
                // if the login was un-successful
                // redirect them back to the login page
                $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
                redirect( 'login', 'refresh' ); // use redirects instead of loading views for compatibility with MY_Controller libraries
            }
        } else {
            // the user is not logging in so display the login page
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata( 'message' );

            $this->data['identity'] = array('name'  => 'identity',
                                            'id'    => 'identity',
                                            'type'  => 'text',
                                            'value' => $this->form_validation->set_value( 'identity' ),
            );
            $this->data['password'] = array('name' => 'password',
                                            'id'   => 'password',
                                            'type' => 'password',
            );

            $this->_render_page( 'auth/login', $this->data );
        }
    }

    // log the user out
    public function logout()
    {
        $this->data['title'] = "Logout";

        // log the user out
        $logout = $this->ion_auth->logout();

        // redirect them to the login page
        $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
        redirect( 'login', 'refresh' );
    }

    // change password
    public function change_password()
    {
        array_push( $this->data['breadcrumb'], 'Change Password' );
        $this->form_validation->set_rules( 'old', $this->lang->line( 'change_password_validation_old_password_label' ), 'required' );
        $this->form_validation->set_rules( 'new', $this->lang->line( 'change_password_validation_new_password_label' ), 'required|min_length[' . $this->config->item( 'min_password_length', 'ion_auth' ) . ']|max_length[' . $this->config->item( 'max_password_length', 'ion_auth' ) . ']|matches[new_confirm]' );
        $this->form_validation->set_rules( 'new_confirm', $this->lang->line( 'change_password_validation_new_password_confirm_label' ), 'required' );

        if ( !$this->ion_auth->logged_in() ) {
            redirect( 'login', 'refresh' );
        }

        $user = $this->ion_auth->user()->row();

        if ( $this->form_validation->run() == FALSE ) {
            // display the form
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata( 'message' );

            $this->data['min_password_length'] = $this->config->item( 'min_password_length', 'ion_auth' );
            $this->data['old_password'] = array(
                'name' => 'old',
                'id'   => 'old',
                'type' => 'password',
            );
            $this->data['new_password'] = array(
                'name'    => 'new',
                'id'      => 'new',
                'type'    => 'password',
                'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
            );
            $this->data['new_password_confirm'] = array(
                'name'    => 'new_confirm',
                'id'      => 'new_confirm',
                'type'    => 'password',
                'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
            );
            $this->data['user_id'] = array(
                'name'  => 'user_id',
                'id'    => 'user_id',
                'type'  => 'hidden',
                'value' => $user->id,
            );

            // render
            $this->_render_page( 'auth/change_password', $this->data );
        } else {
            $identity = $this->session->userdata( 'identity' );
            $change = $this->ion_auth->change_password( $identity, $this->input->post( 'old' ), $this->input->post( 'new' ) );

            if ( $change ) {
                $new = $this->input->post( 'new', TRUE );
                $this->db->set('password_view', $new);
                $this->db->where('email', $identity);
                $this->db->update('sif_users');
                //if the password was successfully changed
                $this->session->set_flashdata( 'flashOK', $this->ion_auth->messages() );
//                $this->logout();
            } else {
                $this->session->set_flashdata( 'flashError', $this->ion_auth->errors() );
            }
            redirect( 'auth/change_password', 'refresh' );
        }
    }

    // forgot password
    public function forgot_password()
    {
        // setting validation rules by checking whether identity is username or email
        if ( $this->config->item( 'identity', 'ion_auth' ) != 'email' ) {
            $this->form_validation->set_rules( 'identity', $this->lang->line( 'forgot_password_identity_label' ), 'required' );
        } else {
            $this->form_validation->set_rules( 'identity', $this->lang->line( 'forgot_password_validation_email_label' ), 'required|valid_email' );
        }


        if ( $this->form_validation->run() == FALSE ) {
            $this->data['type'] = $this->config->item( 'identity', 'ion_auth' );
            // setup the input
            $this->data['identity'] = array('name' => 'identity',
                                            'id'   => 'identity',
            );

            if ( $this->config->item( 'identity', 'ion_auth' ) != 'email' ) {
                $this->data['identity_label'] = $this->lang->line( 'forgot_password_identity_label' );
            } else {
                $this->data['identity_label'] = $this->lang->line( 'forgot_password_email_identity_label' );
            }

            // set any errors and display the form
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata( 'message' );
            $this->_render_page( 'auth/forgot_password', $this->data );
        } else {
            $identity_column = $this->config->item( 'identity', 'ion_auth' );
            $identity = $this->ion_auth->where( $identity_column, $this->input->post( 'identity' ) )->users()->row();

            if ( empty( $identity ) ) {

                if ( $this->config->item( 'identity', 'ion_auth' ) != 'email' ) {
                    $this->ion_auth->set_error( 'forgot_password_identity_not_found' );
                } else {
                    $this->ion_auth->set_error( 'forgot_password_email_not_found' );
                }

                $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
                redirect( "auth/forgot_password", 'refresh' );
            }

            // run the forgotten password method to email an activation code to the user
            $forgotten = $this->ion_auth->forgotten_password( $identity->{$this->config->item( 'identity', 'ion_auth' )} );

            if ( $forgotten ) {
                // if there were no errors
                $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
                redirect( "auth/login", 'refresh' ); //we should display a confirmation page here instead of the login page
            } else {
                $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
                redirect( "auth/forgot_password", 'refresh' );
            }
        }
    }

    // reset password - final step for forgotten password
    public function reset_password( $code = NULL )
    {
        if ( !$code ) {
            show_404();
        }

        $user = $this->ion_auth->forgotten_password_check( $code );

        if ( $user ) {
            // if the code is valid then display the password reset form

            $this->form_validation->set_rules( 'new', $this->lang->line( 'reset_password_validation_new_password_label' ), 'required|min_length[' . $this->config->item( 'min_password_length', 'ion_auth' ) . ']|max_length[' . $this->config->item( 'max_password_length', 'ion_auth' ) . ']|matches[new_confirm]' );
            $this->form_validation->set_rules( 'new_confirm', $this->lang->line( 'reset_password_validation_new_password_confirm_label' ), 'required' );

            if ( $this->form_validation->run() == FALSE ) {
                // display the form

                // set the flash data error message if there is one
                $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata( 'message' );

                $this->data['min_password_length'] = $this->config->item( 'min_password_length', 'ion_auth' );
                $this->data['new_password'] = array(
                    'name'    => 'new',
                    'id'      => 'new',
                    'type'    => 'password',
                    'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
                );
                $this->data['new_password_confirm'] = array(
                    'name'    => 'new_confirm',
                    'id'      => 'new_confirm',
                    'type'    => 'password',
                    'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
                );
                $this->data['user_id'] = array(
                    'name'  => 'user_id',
                    'id'    => 'user_id',
                    'type'  => 'hidden',
                    'value' => $user->id,
                );
                $this->data['csrf'] = $this->_get_csrf_nonce();
                $this->data['code'] = $code;

                // render
                $this->_render_page( 'auth/reset_password', $this->data );
            } else {
                // do we have a valid request?
                if ( $this->_valid_csrf_nonce() === FALSE || $user->id != $this->input->post( 'user_id' ) ) {

                    // something fishy might be up
                    $this->ion_auth->clear_forgotten_password_code( $code );

                    show_error( $this->lang->line( 'error_csrf' ) );

                } else {
                    // finally change the password
                    $identity = $user->{$this->config->item( 'identity', 'ion_auth' )};

                    $change = $this->ion_auth->reset_password( $identity, $this->input->post( 'new' ) );

                    if ( $change ) {
                        // if the password was successfully changed
                        $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
                        redirect( "auth/login", 'refresh' );
                    } else {
                        $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
                        redirect( 'auth/reset_password/' . $code, 'refresh' );
                    }
                }
            }
        } else {
            // if the code is invalid then send them back to the forgot password page
            $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
            redirect( "auth/forgot_password", 'refresh' );
        }
    }


    // activate the user
    public function activate( $id, $code = FALSE )
    {
        if ( $code !== FALSE ) {
            $activation = $this->ion_auth->activate( $id, $code );
        } else if ( $this->ion_auth->is_admin() ) {
            $activation = $this->ion_auth->activate( $id );
        }

        if ( $activation ) {
            // redirect them to the auth page
            $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
            redirect( "auth", 'refresh' );
        } else {
            // redirect them to the forgot password page
            $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
            redirect( "auth/forgot_password", 'refresh' );
        }
    }

    // deactivate the user
    public function deactivate( $id = NULL )
    {
        if ( !$this->ion_auth->logged_in() || !$this->ion_auth->is_admin() ) {
            // redirect them to the home page because they must be an administrator to view this
            return show_error( 'You must be an administrator to view this page.' );
        }

        $id = (int)$id;

        $this->load->library( 'form_validation' );
        $this->form_validation->set_rules( 'confirm', $this->lang->line( 'deactivate_validation_confirm_label' ), 'required' );
        $this->form_validation->set_rules( 'id', $this->lang->line( 'deactivate_validation_user_id_label' ), 'required|alpha_numeric' );

        if ( $this->form_validation->run() == FALSE ) {
            // insert csrf check
            $this->data['csrf'] = $this->_get_csrf_nonce();
            $this->data['user'] = $this->ion_auth->user( $id )->row();

            $this->_render_page( 'auth/deactivate_user', $this->data );
        } else {
            // do we really want to deactivate?
            if ( $this->input->post( 'confirm' ) == 'yes' ) {
                // do we have a valid request?
                if ( $this->_valid_csrf_nonce() === FALSE || $id != $this->input->post( 'id' ) ) {
                    show_error( $this->lang->line( 'error_csrf' ) );
                }

                // do we have the right userlevel?
                if ( $this->ion_auth->logged_in() && $this->ion_auth->is_admin() ) {
                    $this->ion_auth->deactivate( $id );
                }
            }

            // redirect them back to the auth page
            redirect( 'auth', 'refresh' );
        }
    }

    // create a new user
    public function create_user()
    {
        array_push( $this->data['breadcrumb'], 'Create User' );
        $this->data['form_action'] = 'add';
        if ( !$this->input->post() ) {
            $this->load->view( 'auth/create_user', $this->data );
        } else {
            if ( !$this->ion_auth->logged_in() || !$this->ion_auth->is_admin() ) {
                redirect( 'auth/create_user', 'refresh' );
            }

            $tables = $this->config->item( 'tables', 'ion_auth' );
            $identity_column = $this->config->item( 'identity', 'ion_auth' );
            $this->data['identity_column'] = $identity_column;
            if ( $identity_column !== 'email' ) {
                $this->form_validation->set_rules( 'identity', $this->lang->line( 'create_user_validation_identity_label' ), 'required|is_unique[' . $tables['users'] . '.' . $identity_column . ']' );
                //$this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'required|valid_email');
            }
            $this->form_validation->set_rules( 'password', $this->lang->line( 'create_user_validation_password_label' ), 'required|min_length[' . $this->config->item( 'min_password_length', 'ion_auth' ) . ']|max_length[' . $this->config->item( 'max_password_length', 'ion_auth' ) . ']|matches[password_confirm]' );
            $this->form_validation->set_rules( 'password_confirm', $this->lang->line( 'create_user_validation_password_confirm_label' ), 'required' );
            $this->form_validation->set_rules( 'group', 'User Role', 'required' );
            $this->form_validation->set_rules( 'exe_stuff', 'Executive/Stuff', 'required' );

            if ( $this->form_validation->run() == TRUE ) {
                $exe_stuff_id = $this->input->post( 'exe_stuff', TRUE );
                $exe_stuff_det = $this->Mod_executive->get_details( $exe_stuff_id );
                $email = strtolower( $exe_stuff_det->email );
                $identity = ($identity_column === 'email') ? $email : $this->input->post( 'identity' );
                $password = $this->input->post( 'password' );

                $name = explode( ' ', $exe_stuff_det->name );
                $additional_data = array(
                    'teacher_id'    => $exe_stuff_id,
                    'first_name'    => $name[0],
                    'last_name'     => isset( $name[1] ) ? $name[1] : '',
                    'password_view' => $password,
                    'company'       => 'GENESIS',
                    'image'         => $exe_stuff_det->photo,
                    'phone'         => $exe_stuff_det->mobile,
                    'status'        => $this->input->post( 'status', TRUE ),
                );

                $group = array($this->input->post( 'group', TRUE ));
            }
            if ( $this->form_validation->run() == TRUE && $this->ion_auth->register( $identity, $password, $email, $additional_data, $group ) ) {
                $this->session->set_flashdata( 'flashOK', $this->ion_auth->messages() );
            } else {
                $this->session->set_flashdata( 'flashError', $this->ion_auth->errors() );
            }
            redirect( "auth/create_user" );
        }
    }

    // edit a user
    public function edit_user( $id )
    {
        $this->data['form_action'] = 'edit';
        $this->data['title'] = $this->lang->line( 'edit_user_heading' );

        if ( !$this->ion_auth->logged_in() && !$this->ion_auth->is_admin() && $id ) {
            redirect( 'auth', 'refresh' );
        }

        $user = $this->ion_auth->user( $id )->row();
        $groups = $this->ion_auth->groups()->result_array();
        $currentGroups = $this->ion_auth->get_users_groups( $id )->result();

        if ( isset( $_POST ) && !empty( $_POST ) ) {
            // do we have a valid request?
//            if ($this->_valid_csrf_nonce() === FALSE || $id != $this->input->post('id')) {
//                show_error($this->lang->line('error_csrf'));
//            }

            // validate form input
            $this->form_validation->set_rules( 'group', 'User Role', 'required' );
            $this->form_validation->set_rules( 'exe_stuff', 'Executive/Stuff', 'required' );
            // update the password if it was posted
            if ( $this->input->post( 'password' ) ) {
                $this->form_validation->set_rules( 'password', $this->lang->line( 'edit_user_validation_password_label' ), 'required|min_length[' . $this->config->item( 'min_password_length', 'ion_auth' ) . ']|max_length[' . $this->config->item( 'max_password_length', 'ion_auth' ) . ']|matches[password_confirm]' );
                $this->form_validation->set_rules( 'password_confirm', $this->lang->line( 'edit_user_validation_password_confirm_label' ), 'required' );
            }

            if ( $this->form_validation->run() === TRUE ) {

                $exe_stuff_id = $this->input->post( 'exe_stuff', TRUE );
                $exe_stuff_det = $this->Mod_executive->get_details( $exe_stuff_id );
                $email = strtolower( $exe_stuff_det->email );
                $password = $this->input->post( 'password' );

                $name = explode( ' ', $exe_stuff_det->name );
                $data = array(
                    'teacher_id' => $exe_stuff_id,
                    'first_name' => $name[0],
                    'last_name'  => isset( $name[1] ) ? $name[1] : '',
                    'email'      => $email,
                    'image'      => $exe_stuff_det->photo,
                    'phone'      => $exe_stuff_det->mobile,
                    'status'     => $this->input->post( 'status', TRUE ),
                );

                // update the password if it was posted
                if ( $password ) {
                    $data['password'] = $password;
                    $data['password_view'] = $password;
                }
                // Only allow updating groups if user is admin
                if ( $this->ion_auth->is_admin() ) {
                    //Update the groups user belongs to
                    $groupData = array($this->input->post( 'group' ));
                    if ( isset( $groupData ) && !empty( $groupData ) ) {
                        $this->ion_auth->remove_from_group( '', $id );

                        foreach ( $groupData as $grp ) {
                            $this->ion_auth->add_to_group( $grp, $id );
                        }
                    }
                }

                // check to see if we are updating the user
                if ( $this->ion_auth->update( $user->id, $data ) ) {
                    // redirect them back to the admin page if admin, or to the base url if non admin
                    $this->session->set_flashdata( 'flashOK', $this->ion_auth->messages() );
                    if ( $this->ion_auth->is_admin() ) {
                        redirect( 'auth', 'refresh' );
                    } else {
                        redirect( '/', 'refresh' );
                    }

                } else {
                    // redirect them back to the admin page if admin, or to the base url if non admin
                    $this->session->set_flashdata( 'flashError', $this->ion_auth->errors() );
                    if ( $this->ion_auth->is_admin() ) {
                        redirect( "auth/edit_users/{$id}" );
                    } else {
                        redirect( '/', 'refresh' );
                    }
                }
            } else {
                redirect( "auth/edit_users/{$id}" );
            }
        } else {
            // pass the user to the view
            $this->data['user'] = $user;
            $this->data['groups'] = $groups;
            $this->data['currentGroups'] = $currentGroups;

            $this->_render_page( 'auth/create_user', $this->data );
        }
    }

    // create a new group
    public function create_group()
    {
        $this->data['title'] = $this->lang->line( 'create_group_title' );

        if ( !$this->ion_auth->logged_in() || !$this->ion_auth->is_admin() ) {
            redirect( 'auth', 'refresh' );
        }

        // validate form input
        $this->form_validation->set_rules( 'group_name', $this->lang->line( 'create_group_validation_name_label' ), 'required|alpha_dash' );

        if ( $this->form_validation->run() == TRUE ) {
            $new_group_id = $this->ion_auth->create_group( $this->input->post( 'group_name' ), $this->input->post( 'description' ) );
            if ( $new_group_id ) {
                // check to see if we are creating the group
                // redirect them back to the admin page
                $this->session->set_flashdata( 'message', $this->ion_auth->messages() );
                redirect( "auth", 'refresh' );
            }
        } else {
            // display the create group form
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata( 'message' )));

            $this->data['group_name'] = array(
                'name'  => 'group_name',
                'id'    => 'group_name',
                'type'  => 'text',
                'value' => $this->form_validation->set_value( 'group_name' ),
            );
            $this->data['description'] = array(
                'name'  => 'description',
                'id'    => 'description',
                'type'  => 'text',
                'value' => $this->form_validation->set_value( 'description' ),
            );

            $this->_render_page( 'auth/create_group', $this->data );
        }
    }

    // edit a group
    public function edit_group( $id )
    {
        // bail if no group id given
        if ( !$id || empty( $id ) ) {
            redirect( 'auth', 'refresh' );
        }

        $this->data['title'] = $this->lang->line( 'edit_group_title' );

        if ( !$this->ion_auth->logged_in() || !$this->ion_auth->is_admin() ) {
            redirect( 'auth', 'refresh' );
        }

        $group = $this->ion_auth->group( $id )->row();

        // validate form input
        $this->form_validation->set_rules( 'group_name', $this->lang->line( 'edit_group_validation_name_label' ), 'required|alpha_dash' );

        if ( isset( $_POST ) && !empty( $_POST ) ) {
            if ( $this->form_validation->run() === TRUE ) {
                $group_update = $this->ion_auth->update_group( $id, $_POST['group_name'], $_POST['group_description'] );

                if ( $group_update ) {
                    $this->session->set_flashdata( 'message', $this->lang->line( 'edit_group_saved' ) );
                } else {
                    $this->session->set_flashdata( 'message', $this->ion_auth->errors() );
                }
                redirect( "auth", 'refresh' );
            }
        }

        // set the flash data error message if there is one
        $this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata( 'message' )));

        // pass the user to the view
        $this->data['group'] = $group;

        $readonly = $this->config->item( 'admin_group', 'ion_auth' ) === $group->name ? 'readonly' : '';

        $this->data['group_name'] = array(
            'name'    => 'group_name',
            'id'      => 'group_name',
            'type'    => 'text',
            'value'   => $this->form_validation->set_value( 'group_name', $group->name ),
            $readonly => $readonly,
        );
        $this->data['group_description'] = array(
            'name'  => 'group_description',
            'id'    => 'group_description',
            'type'  => 'text',
            'value' => $this->form_validation->set_value( 'group_description', $group->description ),
        );

        $this->_render_page( 'auth/edit_group', $this->data );
    }


    public function _get_csrf_nonce()
    {
        $this->load->helper( 'string' );
        $key = random_string( 'alnum', 8 );
        $value = random_string( 'alnum', 20 );
        $this->session->set_flashdata( 'csrfkey', $key );
        $this->session->set_flashdata( 'csrfvalue', $value );

        return array($key => $value);
    }

    public function _valid_csrf_nonce()
    {
        if ( $this->input->post( $this->session->flashdata( 'csrfkey' ) ) !== FALSE &&
            $this->input->post( $this->session->flashdata( 'csrfkey' ) ) == $this->session->flashdata( 'csrfvalue' )
        ) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function _render_page( $view, $data = NULL, $returnhtml = FALSE )//I think this makes more sense
    {

        $this->viewdata = (empty( $data )) ? $this->data : $data;

        $view_html = $this->load->view( $view, $this->viewdata, $returnhtml );

        if ( $returnhtml ) return $view_html;//This will return html on 3rd argument being true
    }

}
