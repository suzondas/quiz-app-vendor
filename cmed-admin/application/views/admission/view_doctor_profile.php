<?php
//echo print_r($record);
if ( $this->ion_auth->logged_in() ) {
	$this->load->view( 'header/view_header' );
} else {
	$this->load->view( 'header/view_student_header' );
}
$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content" class="profile">
	<section class="wrapper">
		<!-- page start-->
		
		<div class="row">
			
			<div class="col-md-12">
				<section class="panel panel-info">
					<div class="panel-body profile-information">
						<div class="col-md-2">
							<div class="profile-pic text-center">
								<?php if ( $record->photo && file_exists( $record->photo ) ) : ?>
									<img src="<?php echo base_url( $record->photo ); ?>">
								<?php else : ?>
									<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Photo" alt=""/>
								<?php endif; ?>
							</div>
						</div>
						<div class="col-md-6">
							<div class="profile-desk">
								<h1><?= "$record->doc_name"; ?></h1>
								
								<br>
								<div class="row">
									<div class="col-md-12">
										<label for="Name" class="control-label col-md-3">Father Name</label>
										<div class="col-md-7">
											: <?= $record->father_name; ?>
										</div>
										<div class="clearfix"></div>
										<label for="Name" class="control-label col-md-3">Mother Name</label>
										<div class="col-md-7">
											: <?= $record->mother_name; ?>
										</div>
										<div class="clearfix"></div>
									</div>
								
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="profile-statistics">
								<h1>Registration NO: <?= $record->reg_no; ?></h1>
								<p><b>Phone: </b><a class="btn-link" href="tel:<?= $record->phone; ?>"><?php echo $record->phone; ?></a></p><br>
								<p><b>Email: </b><a class="btn-link" href="mailto:<?= $record->email; ?>"><?= $record->email; ?></a></p>
								<p><b>Password: </b><?= $record->password; ?></p>
							
							</div>
							<div>
								<!--                                <a href="--><?php //echo site_url( 'admission/print_profile/' . $record->id ) ?><!--" class="btn btn-warning" target="_blank"><i class="fa fa-print"></i> Print</a>-->
							
							</div>
						
						</div>
					</div>
				</section>
			</div>
			
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						<i class="fa fa-user"></i> Fellow's Profile Details
					</header>
					<div class="form">
						<div class="cmxform form-horizontal">
							<div class="panel-body">
								<div class="tab-content">
									<div id="tab-1" class="tab-pane prf-box active">
										
										
										<div class="form-group ">
											<label for="Faculty" class="control-label col-lg-2">Year </label>
											<div class="col-lg-4">
												<strong><?php echo $record->year; ?></strong>
											</div>
											<label for="Status" class="control-label col-lg-2">Session </label>
											<div class="col-lg-4">
												<strong><?php echo $session_list[$record->session]; ?></strong>
											</div>
										</div>
										
										
										<div class="form-group ">
											<label for="doc_name" class="control-label col-lg-2">Fellow Name </label>
											<div class="col-lg-4">
												<strong><?php echo $record->doc_name; ?></strong>
											</div>
											
											<label for="bmdc_no" class="control-label col-lg-2">BMDC Registration No </label>
											<div class="col-lg-4">
												<strong><?php echo $record->bmdc_no; ?></strong>
											</div>
										</div>
										
										<div class="form-group ">
											<label for="father_name" class="control-label col-lg-2">Father's Name </label>
											<div class="col-lg-4">
												<strong><?php echo $record->father_name; ?></strong>
											</div>
											<label for="mother_name" class="control-label col-lg-2">Mother's Name </label>
											<div class="col-lg-4">
												<strong><?php echo $record->mother_name; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="email" class="control-label col-lg-2">Email Address </label>
											<div class="col-lg-4">
												<strong><?php echo $record->email; ?></strong>
											</div>
											<label for="phone" class="control-label col-lg-2">Mobile No </label>
											<div class="col-lg-4">
												<strong><?php echo $record->phone; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="Name" class="control-label col-lg-2">National ID </label>
											<div class="col-lg-4">
												<strong><?php echo $record->n_id; ?></strong>
											</div>
											<label for="Name" class="control-label col-lg-2">Passport No </label>
											<div class="col-lg-4">
												<strong><?php echo $record->passport; ?></strong>
											</div>
										</div>
										
										<div class="form-group">
											<label for="Name" class="control-label col-lg-2">Date of birth</label>
											<div class="col-lg-4">
												<strong><?php echo user_date( $record->dob ); ?></strong>
											</div>
											<label for="Name" class="control-label col-lg-2">Blood Group</label>
											<div class="col-lg-4">
												<strong><?php echo $record->blood_gro; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="gender" class="control-label col-lg-2">Gender </label>
											<div class="col-lg-4">
												<strong><?php echo $record->gender; ?></strong>
											</div>
											<label for="marital_status" class="control-label col-lg-2">Marital status </label>
											<div class="col-lg-4">
												<strong><?php echo $record->marital_status; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="religion" class="control-label col-lg-2">Religion </label>
											<div class="col-lg-4">
												<strong><?php echo $record->religion; ?></strong>
											</div>
											<label for="nationality" class="control-label col-lg-2">Nationality </label>
											<div class="col-lg-4">
												<strong><?php echo $record->nationality; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="fb_id" class="control-label col-lg-2">Facebook ID </label>
											<div class="col-lg-4">
												<strong><?php echo $record->fb_id; ?></strong>
											</div>
											<label for="skype" class="control-label col-lg-2">Skype ID </label>
											<div class="col-lg-4">
												<strong><?php echo $record->skype; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="viber" class="control-label col-lg-2">Viber Account No </label>
											<div class="col-lg-4">
												<strong><?php echo $record->viber; ?></strong>
											</div>
										</div>
										<div class="form-group ">
											<label for="spouse_name" class="control-label col-lg-2">Contact person name </label>
											<div class="col-lg-4">
												<strong><?php echo $record->spouse_name; ?></strong>
											</div>
											<label for="spouse_mobile" class="control-label col-lg-2">Contact person mobile
												no </label>
											<div class="col-lg-4">
												<strong><?php echo $record->spouse_mobile; ?></strong>
											</div>
										</div>
										<div class="form-group">
											<label for="pt_call" class="control-label col-lg-2">Preferred time of Call</label>
											<div class="col-lg-4">
												<strong><?php echo $record->pt_call; ?></strong>
											</div>
										
										</div>
										<div class="form-group">
											<label for="pw_payment" class="control-label col-lg-2">Proposed way of
												payment</label>
											<div class="col-lg-4">
												<strong><?php echo $record->pw_payment; ?></strong>
											</div>
											<label for="yesCheck" class="control-label col-lg-2">Prefered way of
												communication</label>
											<div class="col-lg-4">
												<strong><?php echo $record->pw_communitcation; ?></strong>
											</div>
										</div>
										<div class="form-group">
											<label for="present_work_place" class="control-label col-lg-2">Present place of
												work</label>
											<div class="col-lg-4">
												<strong><?php echo $record->present_work_place; ?></strong>
											</div>
											<label for="job_description" class="control-label col-lg-2">Job description</label>
											<div class="col-lg-4">
												<strong><?php echo $record->job_description; ?></strong>
											</div>
										</div>
										<?php
										if ( $record->per_divi ) {
											?>
											<div class="form-group ">
												<label for="Name" class="control-label col-lg-2">Permanent
													Address</label>
												<div class="col-lg-2">
													<strong><?php echo $record->per_address; ?></strong>
												</div>
												<label for="Name" class="control-label col-lg-2">Division</label>
												<div class="col-lg-2">
													<strong><?php echo $division_list[$record->per_divi]; ?></strong>
												</div>
												<label for="Name" class="control-label col-lg-2">District</label>
												<div class="col-lg-2">
													<strong><?php echo $mai_district_list[$record->per_dist]; ?></strong>
												</div>
												<!--                                            <label for="Name" class="control-label col-lg-2">Thana</label>

                                            <div class="col-lg-2">
                                               <strong><?php //echo $mai_upazilla_list[$record->per_thana];
												?></strong>
                                            </div>-->
											</div>
											<div class="form-group ">
												<label for="Name" class="control-label col-lg-2">Thana</label>
												
												<div class="col-lg-2">
													<strong><?php echo $mai_upazilla_list[$record->per_thana]; ?></strong>
												</div>
											
											</div>
											<?php
										}
										?>
										
										<?php
										if ( $record->mai_divi ) {
											?>
											<div class="form-group ">
												<label for="Name" class="control-label col-lg-2">Mailing Address</label>
												<div class="col-lg-2">
													<strong><?php echo $record->mai_address; ?></strong>
												</div>
												<label for="Name" class="control-label col-lg-2">Division</label>
												<div class="col-lg-2">
													<strong><?php echo $division_list[$record->mai_divi]; ?></strong>
												</div>
												<label for="Name" class="control-label col-lg-2">District</label>
												<div class="col-lg-2">
													<strong><?php echo $mai_district_list[$record->mai_dist]; ?></strong>
												</div>
											
											</div>
											<div class="form-group ">
												<label for="Name" class="control-label col-lg-2">Thana</label>
												
												<div class="col-lg-2">
													<strong><?php echo $mai_upazilla_list[$record->mai_thana]; ?></strong>
												</div>
											
											</div>
											<?php
										}
										?>
									</div>
								
								</div>
							</div>
						
						</div>
					</div>
				
				</section>
				<?php
				if ( $edu_record ) {
					?>
					<section class="panel panel-info">
						<header class="panel-heading">
							<i class="fa fa-user"></i> Fellow's Education Profile
							<span class="tools pull-right"> </span>
						</header>
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									
									<div class="panel-body">
										<div class="form">
											
											<table class="table table-bordered">
												<tr>
													<th>Name Of Examination</th>
													<th>Passing Year</th>
													<th>Group</th>
													<th>Board</th>
													
													<th>Institute Name</th>
													<th>Result(GPA/DIVISION)</th>
												</tr>
												<?php
												
												foreach ( $edu_record as $edu ) {
													?>
													<tr>
														<td><?php echo $edu->exam_name; ?></td>
														
														<td><?php echo $edu->pass_year; ?> </td>
														<td><?= isset( $group[$edu->exam_group] ) ? $group[$edu->exam_group] : ''; ?></td>
														<td><?= isset( $edu_board[$edu->exam_board] ) ? $edu_board[$edu->exam_board] : ''; ?></td>
														<td><?php echo get_name_by_auto_id( 'sif_medical_collage', $edu->exam_ins, 'collage_name' ) ? get_name_by_auto_id( 'sif_medical_collage', $edu->exam_ins, 'collage_name' ) : $edu->exam_ins; ?></td>
														<td><?php echo $edu->exam_result; ?></td>
													
													</tr>
													<?php
												}
												?>
											</table>
										
										</div>
									</div>
								</section>
							</div>
						</div>
					</section>
					<?php
				}
				?>
				
				<?php
				if ( $training ) {
					?>
					<section class="panel panel-info">
						<header class="panel-heading">
							<i class="fa fa-user"></i> Training
							<span class="tools pull-right"> </span>
						</header>
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<div class="panel-body">
										<div class="form">
											
											<table class="table table-bordered">
												<tr>
													<th>Name</th>
													<th>Duration</th>
													<th>Organization</th>
												</tr>
												<?php foreach ( $training as $row ) { ?>
													<tr>
														<td><?php echo $row->training_name; ?></td>
														<td><?php echo $row->training_duration; ?></td>
														<td><?php echo $row->training_organization; ?></td>
													</tr>
													<?php
												}
												?>
											</table>
										
										</div>
									</div>
								</section>
							</div>
						</div>
					</section>
					<?php
				}
				?>
				<?php
				if ( $experience ) {
					?>
					<section class="panel panel-info">
						<header class="panel-heading">
							<i class="fa fa-user"></i> Experience
							<span class="tools pull-right"> </span>
						</header>
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<div class="panel-body">
										<div class="form">
											
											<table class="table table-bordered">
												<tr>
													<th>Institute Name</th>
													<th>Designation</th>
													<th>Length of Service</th>
												</tr>
												<?php foreach ( $experience as $row ) { ?>
													<tr>
														<td><?php echo $row->exp_inst_name; ?></td>
														<td><?php echo $row->exp_designation; ?></td>
														<td><?php echo $row->exp_los; ?></td>
													</tr>
													<?php
												}
												?>
											</table>
										
										</div>
									</div>
								</section>
							</div>
						</div>
					</section>
					<?php
				}
				?>
			</div>
		</div>
		
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
