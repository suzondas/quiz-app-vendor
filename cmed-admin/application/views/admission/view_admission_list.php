<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
?>
<?php if ( $this->ion_auth->is_admin() ) {
	$con = 'admission';
} else {
	$con = 'teacher';
} ?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Search Wizard - Fellow List
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<div class="form">
							<form class="cmxform form-horizontal " id="commentForm" role="form" method="get"
								  action="<?php echo base_url( "$con/doc_list" ); ?>">
								<div class="form-group ">
									<label for="Name" class="control-label col-lg-2">Registration No:</label>
									<div class="col-lg-2">
										<input class=" form-control" id="reg_no" name="reg_no" type="text"/>
									</div>
									<label for="Faculty" class="control-label col-lg-2">Year</label>
									<div class="col-lg-2">
										<?php
										$ddp = "class='form-control m-bot15' id='year'";
										echo form_dropdown( 'year', $current_fut_year, '', $ddp );
										?>
									</div>
									<label for="Name" class="control-label col-lg-2">Session</label>
									<div class="col-lg-2">
										<?php
										$ddp = 'class="form-control m-bot15"';
										echo form_dropdown( 'session', $session_list, '', $ddp );
										?>
									</div>
								</div>
								
								<div class="form-group ">
									
									<label for="Name" class="control-label col-lg-2">Date Range</label>
									<div class="col-lg-4">
										<div class="input-group input-large" data-date="<?php echo $current_date; ?>"
											 data-date-format="mm/dd/yyyy">
											<input type="text" class="form-control datepicker" name="from_date_time">
											<span class="input-group-addon">To</span>
											<input type="text" class="form-control datepicker" name="to_date_time">
										</div>
									</div>
									<label class="control-label col-lg-3">Name / Username / Email / Mobile</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="name">
									</div>
								</div>
								<div class="form-group">
									<label for="Name" class="control-label col-lg-2">Status</label>
									<div class="col-lg-2">
										<?php
										$ddp = 'class="form-control m-bot15"';
										echo form_dropdown( 'status', $status_list, '', $ddp );
										?>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-2">
										<button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
		
		<?= $msg; ?>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Fellow List <span class="badge bg-info"><?= $total_rows; ?></span>
						<span class="tools">
							<a href="<?= $pdf_url ?>" class="btn btn-xs btn-danger text-white">Download PDF</a>
						</span>
						<span class="tools pull-right">
                            <?php foreach ( $status_list as $k => $status ) {
								if ( $k ) {
									$url = site_url( "admission/doc_list?status={$k}" );
									$cls = "warning";
									if ( $k == 1 ) $cls = 'success';
									elseif ( $k == 2 ) $cls = 'info';
									echo "<a class='btn btn-xs btn-{$cls}' href='{$url}' style='color: #fff;' >{$status}</a>";
								}
							} ?>
                                <a class="fa fa-envelope-o" target="_blank" href="<?= site_url( "admission/doc_emails?status=" . $this->input->get( 'status' ) ) ?>"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-sm">
								<thead>
								<tr>
									<th>#</th>
									<th>Reg./Year/Session</th>
									<th>Name</th>
									<!--									<th>Current Module</th>-->
									<?php if ( $this->ion_auth->is_admin() ) : ?>
										<th>Username/Password</th>
									<?php endif; ?>
									<th>Mobile</th>
									<th>Blood Group</th>
									<th>Image</th>
									<th>Apply Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
								</thead>
								<tbody>
								<?php
								if ( !empty( $rec ) ) {
									
									foreach ( $rec as $key => $value ) {
										$sl = $record_pos + $key + 1;
										?>
										<tr>
											<td><?php echo $sl; ?></td>
											<td>
												<b>Reg: </b><?php echo $value->reg_no; ?> <br>
												<b>Year: </b><?php echo $value->year; ?> <br>
												<b>Session: </b><?php echo $session_list[$value->session]; ?>
											</td>
											<td><?php echo $value->doc_name; ?></td>
											<!--<td>
												<?php /*echo get_name_by_auto_id( 'modules', $value->module ); */ ?>
											</td>-->
											<?php if ( $this->ion_auth->is_admin() ) : ?>
												<td>
													<?php echo $value->user_name; ?> <br>
													<strong>Password: </strong> <?php echo get_name_by_id( 'sif_doc_master', $value->master_id, 'id', 'password' ); ?>
												</td>
											<?php endif; ?>
											<td><?php echo $value->phone; ?></td>
											<td class="text-center"><i class="text-danger"><?php echo $value->blood_gro; ?></i></td>
											<td>
												<?php
												if ( $value->photo && file_exists( $value->photo ) ) {
													?>
													<img src="<?php echo base_url( $value->photo ); ?>" width="50px"
														 height="50px">
													<?php
												} else {
													?>
													<img src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image"
														 alt="" width="50px"
														 height="50px"/>
													<?php
												}
												?>
											</td>
											<td>
												<label class="label label-default"><?= user_date( $value->created_at ); ?></label>
											</td>
											<td class="text-center">
												<?php
												if ( $value->status == 1 ) {
													echo '<span class="label label-info">Active</span>';
												} elseif ( $value->status == 2 ) {
													echo '<span class="label label-success">Completed</span>';
												} else {
													echo '<span class="label label-warning">Inactive</span>';
												}
												?>
											</td>
											<td>
												<a href="<?php echo base_url( "$con/doc_profile/{$value->id}" ); ?>" class="btn btn-primary btn-xs" title="View" data-toggle="tooltip" data-placement="top">
													<i class="fa fa-eye"></i> View Details
												</a>
												<?php if ( $this->ion_auth->in_group( 4 ) ) : ?>
													<a href="<?= site_url( "teacher/send_assignment/{$value->id}" ) ?>"
													   class="btn btn-primary btn-xs"><i class="fa fa-share"></i> Send Assignment</a>
													<!--<a href="<? /*= site_url("teacher/view_assignment/{$value->id}") */ ?>"
                                                   class="btn btn-success btn-xs">View Assignments</a>-->
												<?php endif; ?>
												<?php if ( $this->ion_auth->is_admin() ) : ?>
													
													<a href="<?php echo base_url() . 'admission/edit/' . $value->id; ?>"
													   class="btn btn-info btn-xs"
													   title="Edit" data-toggle="tooltip" data-placement="top">
														<i class="fa fa-pencil-square-o"></i> Edit
													</a>
													
													<a href="<?php echo base_url() . 'admission/reset_pass/' . $value->id; ?>"
													   class="btn btn-warning btn-xs"
													   title="Reset Password" data-toggle="tooltip" data-placement="top">
														<i class="fa fa-key"></i> Reset Password
													</a>
												
												<?php endif; ?>
												<?php if ( $this->ion_auth->is_admin() && $value->status == 9 ) : ?>
													<a href="<?php echo base_url( "admission/delete_fellow/{$value->id}" ); ?>" class="btn btn-danger btn-xs"
													   onclick='return confirm("Are you sure, you want to delete <?= $value->doc_name; ?>? Please beware that this action action cannot be undone.")'
													   title="Delete" data-toggle="tooltip" data-placement="top">
														<i class="fa fa-trash-o"></i> Delete
													</a>
													
													<a href="<?php echo base_url() . 'admission/approve/' . $value->id; ?>"
													   class="btn btn-success btn-xs"
													   title="Approve" data-toggle="tooltip" data-placement="top"
													   onclick="return confirm('Are You Sure! You want to Approve This Applicant.')">
														<i class="fa fa-check"></i> Approve
													</a>
													<!--<a href="<?php /*echo base_url() . 'admission/readmission/' . $value->id; */ ?>"
                                                   class="btn btn-info btn-xs" title="Readmission" data-toggle="tooltip" data-placement="top">
                                                    <i class="glyphicon glyphicon-plus"></i>
                                                </a>-->
												<?php elseif ( $this->ion_auth->is_admin() && $value->status != 2 ) : ?>
													<a href="<?php echo base_url( 'admission/completed/' . $value->id ); ?>"
													   class="btn btn-success btn-xs"
													   title="Completed" data-toggle="tooltip" data-placement="top"
													   onclick="return confirm('Are You Sure? This Applicant has completed the course.')">
														<i class="fa fa-check-square-o"></i> Completed
													</a>
												<?php endif; ?>
											</td>
										
										</tr>
										
										<?php
									}
								} else {
									echo '<tr><td colspan="15" align="center">No Data Available</td></tr>';
								}
								?>
								<tr>
									<td colspan="15"><?php echo $links; ?></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
