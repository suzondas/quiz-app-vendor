<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
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
									<label for="Name" class="control-label col-lg-2">Year <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required';
										echo form_dropdown( 'year', $n_year, date( 'Y' ), $ddp )
										?>
									</div>
									<label for="Name" class="control-label col-lg-2">Session <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required';
										echo form_dropdown( 'session', $session_list, '', $ddp );
										?>
									</div>
								</div>
								
								<div class="form-group ">
									<label for="module" class="control-label col-lg-2">Module <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '" required';
										echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
										?>
									</div>
									<label for="unit" class="control-label col-lg-2">Unit <span class="text-danger">*</span> </label>
									<div class="col-lg-4">
										
										<?php
										$ddp = 'class="form-control m-bot15" id="unit" required';
										echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
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
		<?php if ( $doctors_list ) : ?>
			<div class="row">
				<div class="col-lg-12">
					<section class="panel panel-info">
						<header class="panel-heading">
							Assigned Fellows List <span class="badge badge-info"><?= count( $doctors_list ); ?></span>
							<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
						</header>
						<div class="panel-body">
							<table class="table table-striped table-bordered">
								<tr>
									<th width="15%">Year</th>
									<td><?= $this->input->post( 'year', TRUE ); ?></td>
									<th width="15%">Session</th>
									<td><?= isset( $session_list[$this->input->post( 'session', TRUE )] ) ? $session_list[$this->input->post( 'session', TRUE )] : NULL; ?></td>
								</tr>
								<tr>
									<th>Module</th>
									<td><?= get_name_by_auto_id( 'modules', $this->input->post( 'module', TRUE ) ); ?></td>
									<th>Unit</th>
									<td><?= get_name_by_auto_id( 'module_units', $this->input->post( 'unit', TRUE ) ); ?></td>
								</tr>
							</table>
							<table class="table table-striped table-bordered">
								<thead>
								<tr>
									<th>#</th>
									<th>Fellow Reg. No</th>
									<th>Fellow Name</th>
									<th>Faculty Name</th>
									<?php if ( $this->ion_auth->in_group( 4 ) ) : ?>
										<th>Action</th>
									<?php endif; ?>
								</tr>
								</thead>
								<tbody>
								<?php foreach ( $doctors_list as $i => $doc ) : ?>
									<tr>
										<td><?= ( $i + 1 ) ?></td>
										<td><?= $doc->reg_no; ?></td>
										<td><?= $doc->doc_name; ?></td>
										<td>
											<span class="text-primary"><?= get_teacher_name_by_id( $doc->teacher_id ); ?></span>
										</td>
										<?php if ( $this->ion_auth->in_group( 4 ) ) : ?>
											<td class="text-center">
												<a href="<?= site_url( "teacher/send_assignment/{$doc->id}" ) ?>"
												   class="btn btn-primary btn-xs">Send Assignment</a>
												<a href="<?= site_url( "teacher/view_assignment/{$doc->id}" ) ?>"
												   class="btn btn-success btn-xs">View Fellow Page</a>
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
