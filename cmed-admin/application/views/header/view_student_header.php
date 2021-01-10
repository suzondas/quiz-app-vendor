<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Big M Resources Ltd.">
    <meta name="author" content="Big M Resources Ltd.">
    <link rel="icon" type="text/css" href="<?= base_url( 'images/favicon.png' ); ?>">

    <title><?= $company->name; ?> - <?= $module_name; ?></title>

    <!--Core CSS -->
    <link href="<?php echo base_url( "bs3/css/bootstrap.min.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( "css/bootstrap-reset.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( "assets/font-awesome/css/font-awesome.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet"/>

    <!--dynamic table-->
    <link href="<?php echo base_url( "assets/advanced-datatable/media/css/demo_page.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet"/>
    <link href="<?php echo base_url( "assets/advanced-datatable/media/css/demo_table.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet"/>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/data-tables/DT_bootstrap.css"/>
    
    <?php if ( $this->uri->segment( 1 ) == '' || $this->uri->segment( 1 ) == 'dashboard' || $this->uri->segment( 1 ) == 'student_dashboard' ): ?>
        <link href="<?php echo base_url( "assets/jvector-map/jquery-jvectormap-1.2.2.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
        <link href="<?php echo base_url( "css/clndr.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
        <!--clock css-->
        <link href="<?php echo base_url( "assets/css3clock/css/style.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/morris-chart/morris.css">
    <?php endif; ?>

    <!-- Custom styles for this template -->
    <link href="<?php echo base_url( "css/style.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( "css/style-responsive.css?v=" . config_item( "app_version" ) ); ?>" rel="stylesheet"/>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="<?php echo base_url();?>js/ie8/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var site_url_path = '<?php echo base_url();?>';
    </script>
</head>

<body>

<section id="container">
    <!--header start-->
    <header class="header fixed-top clearfix">
        <!--logo start-->
        <div class="brand">
            <a href="#" class="logo">
                <!--<img src="<?php /*echo base_url('images/logo-genesis.png'); */ ?>" alt="">-->
                CMEd - Fellow Panel
            </a>
            <div class="sidebar-toggle-box">
                <div class="fa fa-bars"></div>
            </div>
        </div>
        <!--logo end-->

        <div class="nav notify-row" id="top_menu">
            <h4>Current Unit - <?= "{$current->unit_code} - " . word_limiter($current->unit_name, 6, '...'); ?></h4>
        </div>
        <div class="top-nav clearfix">
            <!--search & user info start-->
            <ul class="nav pull-right top-menu">
                <li>
                    <input type="text" class="form-control search" placeholder=" Search">
                </li>
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <?php if ( $authUser->photo && file_exists( $authUser->photo ) ): ?>
                            <img alt="" src="<?php echo base_url( $authUser->photo ) ?>">
                        <?php else : ?>
                            <img alt="" src="<?php echo base_url( 'images/user.jpg' ) ?>">
                        <?php endif; ?>
                        <span class="username"><?= $authUser->doc_name; ?></span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <li>
                            <p class="">User Profile</p>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info clearfix">
                                    <div class="desc pull-left">
                                        <h5><?php echo $authUser->doc_name; ?></h5>
                                        <p><?php echo $authUser->email; ?></p>
                                    </div>
                                    <span class="pull-right" data-percent="90">
                                        <?php if ( $authUser->photo ) : ?>
                                            <img alt="" src="<?php echo base_url( $authUser->photo ) ?>">
                                        <?php else : ?>
                                            <img alt="" src="<?php echo base_url( 'images/user.jpg' ) ?>">
                                        <?php endif; ?>
                                    </span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url( 'student_dashboard/change_password' ) ?>"><i class="fa fa-key"></i> Change Password</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url( 'student_logout' ) ?>"><i class="fa fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!--search & user info end-->
        </div>
    </header>
    <!--header end-->
    <aside>
        <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a href="<?= config_item( 'home_url' ) ?>" target="_blank">
                        <i class="fa fa-globe"></i>
                        <span>Visit Website</span>
                    </a>
                </li>

                <li>
                    <a href="<?= site_url( 'student_dashboard' ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == '' || $this->uri->segment( 1 ) == 'index' ) echo 'active'; ?>">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="<?= site_url( 'student_dashboard/change_password' ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'change_password' ) echo 'active'; ?>">
                        <i class="fa fa-key"></i>
                        <span>Change Password</span>
                    </a>
                </li>
                <li>
                    <a href="<?= site_url( "student_dashboard/profile/{$authUser->id}" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'profile' ) echo 'active'; ?>">
                        <i class="fa fa-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="<?php echo site_url( "student_dashboard/assignments/{$authUser->id}" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'assignments' ) echo 'active'; ?>">
                        <i class="fa fa-money"></i>
                        <span>Assignment</span>
                    </a>
                </li>
                <li>
                    <a href="<?php echo site_url( "student_dashboard/course_details/{$authUser->id}" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'course_details' ) echo 'active'; ?>">
                        <i class="fa fa-list"></i>
                        <span>Course Details</span>
                    </a>
                </li>

                <li>
                    <a href="<?php echo site_url( "student_dashboard/exams/{$authUser->id}" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'exams' ) echo 'active'; ?>">
                        <i class="fa fa-list-alt"></i>
                        <span>Exams</span>
                    </a>
                </li>
                <li>
                    <a href="<?php echo site_url( "student_dashboard/result/{$authUser->id}" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'result' ) echo 'active'; ?>">
                        <i class="fa fa-th-list"></i>
                        <span>Result</span>
                    </a>
                </li>
                <li>
                    <a href="<?php echo site_url( "student_dashboard/reading_materials" ); ?>"
                       class="<?php if ( $this->uri->segment( 1 ) == 'student_dashboard' && $this->uri->segment( 2 ) == 'reading_materials' ) echo 'active'; ?>">
                        <i class="fa fa-th-list"></i>
                        <span>Reading Materials</span>
                    </a>
                </li>

                <li>
                    <a href="<?= site_url( 'student_logout' ); ?>">
                        <i class="fa fa-power-off"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
