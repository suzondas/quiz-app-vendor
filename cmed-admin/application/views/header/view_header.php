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
	<link href="<?php echo base_url( "bs3/css/bootstrap.min.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
	<link href="<?php echo base_url( "css/bootstrap-reset.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
	<link href="<?php echo base_url( "assets/font-awesome/css/font-awesome.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
	
	<!--dynamic table-->
	<link href="<?php echo base_url( "assets/advanced-datatable/media/css/demo_page.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
	<link href="<?php echo base_url( "assets/advanced-datatable/media/css/demo_table.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
	<link href="<?php echo base_url( "assets/bootstrap-timepicker/compiled/timepicker.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
	<link rel="stylesheet" href="<?php echo base_url( "assets/data-tables/DT_bootstrap.css?v=" . config_item( 'app_version' ) ); ?>"/>
	
	<?php if ( $this->uri->segment( 1 ) == '' || $this->uri->segment( 1 ) == 'dashboard' || $this->uri->segment( 1 ) == 'student_dashboard' ): ?>
		<link href="<?php echo base_url( "assets/jvector-map/jquery-jvectormap-1.2.2.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
		<link href="<?php echo base_url( "css/clndr.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
		<!--clock css-->
		<link href="<?php echo base_url( "assets/css3clock/css/style.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
		<!--Morris Chart CSS -->
		<link rel="stylesheet" href="<?php echo base_url( "assets/morris-chart/morris.cs?v=" . config_item( 'app_version' ) ); ?>s">
	<?php endif; ?>
	
	<!-- Custom styles for this template -->
	<link href="<?php echo base_url( "css/style.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">
	<link href="<?php echo base_url( "css/style-responsive.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
	
	<!-- Just for debugging purposes. Don't actually copy this line! -->
	<!--[if lt IE 9]>
	<script src="<?php echo base_url(); ?>js/ie8/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
        var site_url_path = '<?php echo base_url(); ?>';
	</script>

</head>

<body>

<section id="container">
	<!--header start-->
	<header class="header fixed-top clearfix">
		<!--logo start-->
		<div class="brand text-center">
			<a href="<?= site_url(); ?>" class="logo">
				<!--<img src="<?php /* echo base_url('images/logo-genesis.png'); */ ?>" alt="">-->
				CMEd -
				<?php if ( $this->ion_auth->is_admin() ): ?>
					Admin
				<?php elseif ( $this->ion_auth->in_group( 4 ) ): ?>
					Faculty
				<?php endif; ?>
				Panel
			</a>
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars"></div>
			</div>
		</div>
		<!--logo end-->
		<?php if ( isset( $breadcrumb ) ): ?>
			<div class="nav notify-row" id="top_menu">
				<ul class="breadcrumbs-alt">
					<?php foreach ( $breadcrumb as $cumb ) : ?>
						<li>
							<a href="#"><?= $cumb; ?></a>
						</li>
					<?php endforeach; ?>
				</ul>
			</div>
		<?php endif; ?>
		<div class="top-nav clearfix">
			<!--search & user info start-->
			<ul class="nav pull-right top-menu">
				<li>
					<input type="text" class="form-control search" placeholder="Search" onchange="jnn_find(this)">
				</li>
				<!-- user login dropdown start-->
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<?php if ( $authUser->image && file_exists( $authUser->image ) ) : ?>
							<img alt="" src="<?php echo base_url( $authUser->image ) ?>">
						<?php else : ?>
							<img alt="" src="<?php echo base_url( 'images/user.jpg' ) ?>">
						<?php endif; ?>
						<span class="username"><?php echo $authUser->first_name . ' ' . $authUser->last_name; ?></span>
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
										<h5><?php echo $authUser->first_name . ' ' . $authUser->last_name; ?></h5>
										<p><?php echo $authUser->email; ?></p>
									</div>
									<span class="pull-right" data-percent="90">
                                        <?php if ( $authUser->image && file_exists( $authUser->image ) ) : ?>
											<img alt="" src="<?php echo base_url( $authUser->image ) ?>">
										<?php else : ?>
											<img alt="" src="<?php echo base_url( 'images/user.jpg' ) ?>">
										<?php endif; ?>
                                    </span>
								</div>
							</a>
						</li>
						<li>
							<a href="<?php echo site_url( 'auth/change_password' ) ?>"><i class="fa fa-key"></i> Change Password</a>
						</li>
						<li>
							<a href="<?php echo site_url( 'logout' ) ?>"><i class="fa fa-power-off"></i> Log Out</a>
						</li>
					</ul>
				</li>
				
				<!-- user login dropdown end -->
				<!--        <li>
							<div class="toggle-right-box">
								<div class="fa fa-bars"></div>
							</div>
						</li>-->
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
					<a href="<?= home_url( '' ) ?>" target="_blank">
						<i class="fa fa-globe"></i>
						<span>Visit Website</span>
					</a>
				</li>
				
				<li>
					<a href="<?= site_url( 'dashboard' ); ?>"
					   class="<?php if ( $this->uri->segment( 1 ) == 'dashboard' ) echo 'active'; ?>">
						<i class="fa fa-dashboard"></i>
						<span>Dashboard</span>
					</a>
				</li>
				
				
				<li>
					<a href="<?php echo site_url( "dashboard/course_details" ); ?>"
					   class="<?php if ( $this->uri->segment( 1 ) == 'dashboard' && $this->uri->segment( 2 ) == 'course_details' ) echo 'active'; ?>">
						<i class="fa fa-list"></i>
						<span>Course Details</span>
					</a>
				</li>
				
				<?php if ( $this->ion_auth->is_admin() || $this->ion_auth->in_group( 2 ) ): ?>
					
					<li>
						<a href="<?= site_url( 'admission/doc_list' ) ?>"
						   class="<?php if ( $this->uri->segment( 1 ) == 'admission' and $this->uri->segment( 2 ) == 'doc_list' ) echo 'active'; ?>">
							<i class="fa fa-plus-square"></i>
							<span>Fellow List</span>
						</a>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() ): ?>
					
					<li class="sub-menu">
						<a href="javascript:;"
						   class="<?php if ( $this->uri->segment( 1 ) == 'question_bank' ) echo 'active'; ?>">
							<i class="fa fa-lightbulb-o"></i>
							<span>Question Bank</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'question_bank' and $this->uri->segment( 2 ) == 'add_mcq_question' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'question_bank/add_mcq_question' ) ?>">Add MCQ Question</a>
							</li>
							
							<li class="<?php if ( $this->uri->segment( 1 ) == 'question_bank' and $this->uri->segment( 2 ) == 'mcq_question_list' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'question_bank/mcq_question_list' ) ?>">MCQ Questions</a>
							</li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() ): ?>
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if (
							$this->uri->segment( 1 ) == 'teacher'
							&& ( in_array( $this->uri->segment( 2 ), [ 'records', 'doctors', 'fellow_list' ] ) )
						) echo 'active'; ?>">
							<i class="fa fa-user"></i>
							<span>Faculty</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'teacher' ) ?>">Add Faculty</a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'records' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'teacher/records' ) ?>">Faculty List</a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'doctors' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'teacher/doctors' ) ?>">Assign Faculty Fellow </a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'fellow_list' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'teacher/fellow_list' ) ?>">Assigned Fellow List</a></li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() ): ?>
					
					<li class="sub-menu">
						<a href="javascript:;"
						   class="<?php if ( $this->uri->segment( 1 ) == 'module' ) echo 'active'; ?>">
							<i class="fa fa-list"></i>
							<span>Modules</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'module' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'module' ) ?>">Add Module</a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'module' and $this->uri->segment( 2 ) == 'records' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'module/records' ) ?>">Module list</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'module' and $this->uri->segment( 2 ) == 'set_current' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'module/set_current' ) ?>">Current Module</a>
							</li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() || $this->ion_auth->in_group( 4 ) ): ?>
					<li class="sub-menu">
						<a href="javascript:;"
						   class="<?php if ( $this->uri->segment( 1 ) == 'unit' ) echo 'active'; ?>">
							<i class="fa fa-user-md"></i>
							<span>Units</span>
						</a>
						<ul class="sub">
							<?php if ( $this->ion_auth->is_admin() ): ?>
								<li class="<?php if ( $this->uri->segment( 1 ) == 'unit' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
									<a href="<?php echo site_url( 'unit' ) ?>">Add Unit</a></li>
							<?php endif; ?>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'unit' and $this->uri->segment( 2 ) == 'records' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'unit/records' ) ?>">Unit list</a>
							</li>
						</ul>
					</li>
				<?php endif; ?>
				<?php if ( $this->ion_auth->is_admin() ): ?>
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if ( $this->uri->segment( 1 ) == 'examination' ) echo 'active'; ?>">
							<i class="fa fa-list-alt                                                                                                                                                            "></i>
							<span>Exams</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'examination' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'examination' ) ?>">Online Exam</a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'examination' and $this->uri->segment( 2 ) == 'on_site_exam' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'examination/on_site_exam' ) ?>">On Site Exam</a></li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() ): ?>
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if ( $this->uri->segment( 1 ) == 'result' ) echo 'active'; ?>">
							<i class="fa fa-list-alt                                                                                                                                                            "></i>
							<span>Results</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'result' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'result' ) ?>">Unit Result</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'result' and $this->uri->segment( 2 ) == 'module_result' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'result/module_result' ) ?>">Module Result</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'result' and $this->uri->segment( 2 ) == 'on_site_result' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'result/on_site_result' ) ?>">On Site Result</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'result' and $this->uri->segment( 2 ) == 'individual_result' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'result/individual_result' ) ?>">Individual Result</a>
							</li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() || $this->ion_auth->in_group( 2 ) ): ?>
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if ( $this->uri->segment( 1 ) == 'page' ) echo 'active'; ?>">
							<i class="fa fa-bars"></i>
							<span>Pages</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'page' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'page' ) ?>">Add Page</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'page' and $this->uri->segment( 2 ) == 'record' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'page/record' ) ?>">Page List</a>
							</li>
							
							<li class="<?php if ( $this->uri->segment( 1 ) == 'page' and $this->uri->segment( 2 ) == 'reading_materials' ) echo 'active'; ?>">
								<a href="<?php echo base_url( 'page/reading_materials/' ) ?>">Reading Materials</a>
							</li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if ( $this->uri->segment( 1 ) == 'notice' ) echo 'active'; ?>">
							<i class="fa fa-bell"></i>
							<span>Notices</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'notice' and $this->uri->segment( 2 ) == 'notice_to_doctor' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'notice/notice_to_doctor' ) ?>">Fellow Notice</a>
							</li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'notice' and $this->uri->segment( 2 ) == 'general_notice' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'notice/general_notice' ) ?>">Faculty Notice</a>
							</li>
						</ul>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->in_group( 4 ) ): ?>
					<li class="<?php if ( $this->uri->segment( 1 ) == 'page' and $this->uri->segment( 2 ) == 'reading_materials' ) echo 'active'; ?>">
						<a href="<?php echo base_url( 'teacher/reading_materials/' . $teacher_auto_id ) ?>"><i
								class="fa fa-magnet"></i>Reading Materials</a>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->in_group( 4 ) ): ?>
					<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'profile' ) echo 'active'; ?>">
						<a href="<?php echo site_url( 'teacher/profile/' . $teacher_auto_id ) ?>"><i
								class="fa fa-user"></i>Profile </a>
					</li>
					<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'doc_list' ) echo 'active'; ?>">
						<a href="<?php echo site_url( 'teacher/doc_list/' . $teacher_auto_id ) ?>"><i
								class="fa fa-list-ul"></i>Fellow's List</a>
					</li>
					<li class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
						<a href="<?php echo base_url( 'teacher/send_assignment_fellows/' . $teacher_auto_id ) ?>">
							<i class="fa fa-list-alt"></i>Send Assignment
						</a>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->in_group( 4 ) || $this->ion_auth->is_admin() ): ?>
					<li>
						<a href="<?php echo site_url( 'teacher/assignments/' . $teacher_auto_id ) ?>" class="<?php if ( $this->uri->segment( 1 ) == 'teacher' and $this->uri->segment( 2 ) == 'assignments' ) echo 'active'; ?>">
							<i class="fa fa-calendar"></i>Assignments
						</a>
					</li>
				<?php endif; ?>
				
				<?php if ( $this->ion_auth->is_admin() ): ?>
					<!-- <li class="sub-menu">
                        <a href="javascript:;"
                           class="<?php if ( $this->uri->segment( 1 ) == 'auth' ) echo 'active'; ?>">
                            <i class="fa fa-users"></i>
                            <span>Users</span>
                        </a>
                        <ul class="sub">
                            <li class="<?php if ( $this->uri->segment( 1 ) == 'auth' and $this->uri->segment( 2 ) == 'create_user' ) echo 'active'; ?>">
                                <a href="<?php echo site_url( 'auth/create_user' ) ?>">Create User</a></li>
                            <li class="<?php if ( $this->uri->segment( 1 ) == 'auth' and $this->uri->segment( 2 ) == '' ) echo 'active'; ?>">
                                <a href="<?php echo site_url( 'auth' ) ?>">Users List</a></li>
                        </ul>
                    </li> -->
					<li class="sub-menu">
						<a href="javascript:;" class="<?php if ( $this->uri->segment( 1 ) == 'setting' ) echo 'active'; ?>">
							<i class="fa fa-cog"></i>
							<span>Setting</span>
						</a>
						<ul class="sub">
							<li class="<?php if ( $this->uri->segment( 1 ) == 'setting' and $this->uri->segment( 2 ) == 'general_info' ) echo 'active'; ?>">
								<a href="<?php echo site_url( 'setting/general_info' ) ?>">General Information</a></li>
							<li class="<?php if ( $this->uri->segment( 1 ) == 'setting' and $this->uri->segment( 2 ) == 'news_notice' ) echo 'active'; ?>">
								<a href="<?php echo base_url( 'setting/news_notice/' ) ?>">News/Notice</a></li>
							<!-- <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_course') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_course/') */ ?>">Course</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_faculty') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_faculty/') */ ?>">Faculty</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_batch') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_batch/') */ ?>">Batch/Subject </a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'subject') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_subject/') */ ?>">Subject</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'service_pack') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/service_pack/') */ ?>">Service Package</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_service_pack_des') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_service_pack_des/') */ ?>">Service Package
                                    Description</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_fee') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_fee/') */ ?>">Fee</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_room_type') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_room_type/') */ ?>">Add Room Type</a>
                            </li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_topics') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_topics/') */ ?>">Topics</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_class_topic') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_class_topic/') */ ?>">Class Topic</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_exam_type') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_exam_type/') */ ?>">Examination Type</a>
                            </li>

                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_room_type') echo 'active'; */ ?>">
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_med_collage') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_med_collage/') */ ?>">Medical College</a></li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_holiday') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_holiday/') */ ?>">Holiday</a>
                            </li>
                            <li class="<?php /*if ($this->uri->segment(1) == 'setting' and $this->uri->segment(2) == 'add_question_about_genesis') echo 'active'; */ ?>">
                                <a href="<?php /*echo base_url('setting/add_question_about_genesis/') */ ?>">Add Question
                                    About Genesis</a>
                            </li>-->
						</ul>
					</li>
				
				<?php endif; ?>
				
				<li>
					<a href="<?php echo site_url( 'dashboard/fellow_login_log' ); ?>">
						<i class="fa fa-th-list"></i>
						<span>Fellow Login Attempts</span>
					</a>
				</li>
				
				<li>
					<a href="<?php echo site_url( 'logout' ); ?>">
						<i class="fa fa-power-off"></i>
						<span>Logout</span>
					</a>
				</li>
			</ul>
			<!-- sidebar menu end-->
		</div>
	</aside>
	<!--sidebar end-->
