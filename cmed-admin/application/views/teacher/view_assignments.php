<?php
if ( $this->ion_auth->logged_in() ) {
	$this->load->view( 'header/view_header' );
	
	$con = 'teacher';
} else {
	$this->load->view( 'header/view_student_header' );
	
	$con = 'student_dashboard';
}
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Search Wizard
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?php echo $msg; ?>
						<div class="form">
							<form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
								  action="<?php echo current_url(); ?>">
								
								<div class="form-group ">
									<label for="Name" class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required';
										echo form_dropdown( 'year', $n_year, date( 'Y' ), $ddp )
										?>
									</div>
									<label for="Name" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required';
										echo form_dropdown( 'session', $session_list, '', $ddp );
										?>
									</div>
								</div>
								
								<div class="form-group ">
									<label for="module" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '" required'; //
										echo form_dropdown( 'module', $module_list, '', $ddp );
										?>
									</div>
									<label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" id="unit" required';
										echo form_dropdown( 'unit', $unit_list, '', $ddp );
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
		<?php if ( $assignments ) : ?>
			<div class="row">
				<div class="col-lg-12">
					<section class="panel panel-info">
						<header class="panel-heading">
							Assignments <span class="badge badge-info"><?= count( $assignments ); ?></span>
							<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
						</header>
						<div class="panel-body">
							<table class="table table-striped table-bordered">
								<tr>
									<th>Year</th>
									<td><span class="label label-default"><?= $this->input->post( 'year', TRUE ); ?></span></td>
									<th>Session</th>
									<td><span class="label label-default"><?= isset( $session_list[$this->input->post( 'session', TRUE )] ) ? $session_list[$this->input->post( 'session', TRUE )] : NULL; ?></span></td>
								</tr>
								<tr>
									<th>Module</th>
									<td><span class="label label-info"><?= get_name_by_auto_id( 'modules', $this->input->post( 'module', TRUE ) ); ?></span></td>
									<th>Unit</th>
									<td><span class="label label-primary"><?= get_name_by_auto_id( 'module_units', $this->input->post( 'unit', TRUE ) ) ?></span></td>
								</tr>
								
								<tr>
									<th>Sent At</th>
									<td>
										<?= isset( $assignments[0] ) ? user_date( $assignments[0]->sent ) : ""; ?>
									</td>
									<th>Attachment</th>
									<td>
										<?= isset( $assignments[0] ) ? attachment_download( $assignments[0]->attachment ) : ""; ?>
									</td>
								</tr>
								
								<tr>
									<th>Title</th>
									<td colspan="3">
										<?= isset( $assignments[0] ) ? $assignments[0]->title : ""; ?>
									</td>
								</tr>
								
								<tr>
									<th>Details</th>
									<td colspan="3">
                                        <?= isset($assignments[0]) ? nl2br($assignments[0]->desc) : ""; ?>
									</td>
								</tr>
							</table>
							<table class="table table-striped table-bordered">
								<thead>
								<tr>
									<th>#</th>
									<th>Fellow</th>
									<!--									<th>Title</th>-->
									<!--									<th>Details</th>-->
									<!--									<th width="10%">Sent At</th>-->
									<th>Status</th>
									<?php if ( $this->ion_auth->in_group( 4 ) || $this->ion_auth->is_admin() ) : ?>
										<th>Action</th>
									<?php endif; ?>
								</tr>
								</thead>
								<tbody>
								<?php foreach ( $assignments as $i => $assignment ) : ?>
									<tr>
										<td><?= ( $i + 1 ) ?></td>
										<td><?= get_name_by_auto_id( 'sif_admission', $assignment->doc_id, 'doc_name' ); ?></td>
										<!--										<td>--><? //= $assignment->title; ?><!--</td>-->
										<!--										<td>--><? //= $assignment->desc; ?><!--</td>-->
										<!--										<td class="text-center">--><? //= user_date( $assignment->sent ); ?><!--</td>-->
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
										<?php if ( $this->ion_auth->in_group( 4 ) || $this->ion_auth->is_admin() ) : ?>
											<td class="text-center">
												<!--<a href="<? /*= site_url( "teacher/send_assignment/{$assignment->id}" ) */ ?>"
                                                   class="btn btn-primary btn-xs">Send Assignment</a>-->
												<a href="<?php echo site_url( "$con/assignment_replies/{$assignment->id}" ) ?>"
												   class="btn btn-primary btn-xs" target="_blank">View Details</a>
											</td>
										<?php endif; ?>
									</tr>
								<?php endforeach; ?>
								</tbody>
							</table>
						</div>
					</section>
				</div>
			</div>
		<?php endif; ?>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
