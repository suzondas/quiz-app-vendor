<?php
if ( $this->ion_auth->logged_in() ) {
	$this->load->view( 'header/view_header' );
	
	$con = 'teacher';
} else {
	$this->load->view( 'header/view_student_header' );
	
	$con = 'student_dashboard';
}
$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel panel-info">
					<header class="panel-heading">
						Assignments
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?php echo $msg; ?>
						<?php if ( $this->ion_auth->logged_in() ) : ?>
							<table class="table table-bordered table-striped">
								<thead>
								<tr>
									<th>Name</th>
									<td><?php echo get_name_by_auto_id( 'sif_admission', $doc->id, 'doc_name' ); ?></td>
									<th>Year</th>
									<td><?php echo $doc->year; ?></td>
									<th>Session</th>
									<td><?php echo $session_list[$doc->session] ?></td>
								</tr>
								</thead>
							</table>
						<?php endif; ?>
						<table class="table table-bordered table-striped">
							<tbody>
							<tr>
								<th>#</th>
								<th width="15%">Faculty Name</th>
								<th>Module</th>
								<th>Unit</th>
								<th>Subject</th>
								<!--                                    <th>Details</th>-->
								<th>Attachment</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							<?php
							if ( !empty( $assignments ) ) {
								foreach ( $assignments as $i => $assignment ) {
									?>
									<tr>
										<td><?php echo( $i + 1 ); ?></td>
										<td>
											<?php echo get_teacher_name_by_id( $assignment->teacher_id ); ?>
										</td>
										<td><?php echo get_name_by_auto_id( 'modules', $assignment->module, 'name' ); ?></td>
										<td><?php echo get_name_by_auto_id( 'module_units', $assignment->unit, 'name' ); ?></td>
										<td><?php echo $assignment->title; ?></td>
										<!--<td><?php /*echo $assignment->desc; */ ?></td>-->
										<td>
											<?php if ( $assignment->attachment ) : ?>
												<a class="btn btn-xs btn-info" href="<?= base_url( $assignment->attachment ) ?>" target="_blank">
													<i class="fa fa-download"></i>
													Attachment
												</a>
											<?php endif; ?>
										</td>
										<td class="text-center">
											<?php if ( $assignment->status == 'A' ): ?>
												<label class="label label-success">Accepted</label>
											<?php elseif ( $assignment->status == 'R' ): ?>
												<label class="label label-warning">Replied..</label>
											<?php elseif ( $assignment->status == 'F' ): ?>
												<label class="label label-info">Feedback Given</label>
											<?php else: ?>
												<label class="label label-default">Pending..</label>
											<?php endif; ?>
										</td>
										<td class="text-center">
											<?php if ( $this->session->userdata( 'logged_in' ) && $authUser->status == 1 ) : ?>
												<a href="<?php echo site_url( 'student_dashboard/assignment_reply/' . $assignment->id ) ?>"
												   class="btn btn-info btn-xs">Reply</a>
											<?php endif; ?>
											<a href="<?php echo site_url( "$con/assignment_replies/{$assignment->id}" ) ?>"
											   class="btn btn-warning btn-xs">View Details</a>
										</td>
									</tr>
									<?php
								}
							}
							?>
							</tbody>
						</table>
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
