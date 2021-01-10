<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<?php //echo var_dump( $exam_list);?>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Search Wizard - Exam List
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<div class="form">
							<form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo current_url(); ?>">

								<div class="form-group ">

									<label for="Faculty" class="control-label col-lg-2">Year </label>
									<div class="col-lg-2">
										<?php
										$ddp = "class='form-control m-bot15' id='year'";
										echo form_dropdown( 'year', $n_year, date( 'Y' ), $ddp );
										?>
									</div>
									<label for="Status" class="control-label col-lg-1">Session </label>
									<div class="col-lg-2">
										<?php
										$ddp = 'class="form-control m-bot15"';
										echo form_dropdown( 'session', $session_list, '', $ddp );
										?>
									</div>
									<label for="Status" class="control-label col-lg-1">Module </label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15"';
										echo form_dropdown( 'module_id', $module_list, '', $ddp );
										?>
									</div>
								</div>
								<!--<div class="form-group">

                                    <label for="Name" class="control-label col-lg-2">Date Range</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-large" data-date="<?php /*echo $current_date; */ ?>" data-date-format="mm/dd/yyyy">
                                            <input type="text" class="form-control datepicker" name="from_date_time">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control datepicker" name="to_date_time">
                                        </div>
                                    </div>
                                </div>-->

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
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Examination List <span class="badge"><?= $total_rows; ?></span>
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?= $msg; ?>
						<table class="table table-bordered table-striped">
							<thead>
							<tr>
								<th>#</th>
								<th>Exam Name</th>
								<th>Year</th>
								<th>Session</th>
								<th>Module</th>
								<th>Unit</th>
								<th>Date Range</th>
								<th>Created</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							</thead>
							<tbody>
							<?php
							if ( !empty( $rec ) ) {

								foreach ( $rec as $key => $value ) {
									?>
									<tr>
										<td><?= ( ++$key + $record_pos ) ?></td>
										<td><?php echo $value->name; ?></td>
										<td><?php echo $value->year ?></td>
										<td><?php echo isset( $session_list[$value->session] ) ? $session_list[$value->session] : NULL; ?></td>
										<td><?php echo get_name_by_auto_id( 'modules', $value->module_id ); ?></td>
										<td><?php echo get_name_by_auto_id( 'module_units', $value->unit_id ); ?></td>
										<td class="text-center">
											<label class="badge label-success"><?= user_formated_datetime( $value->open_date ) ?></label>
											To
											<label class="badge label-danger"><?= user_formated_datetime( $value->close_date ) ?></label>
										</td>
										<td><span class="badge"><?= user_date( $value->created_at ) ?></span></td>
										<td>
											<?php if ( $value->status == 1 ) {
												echo '<label class="label label-success">Active</label>';
											} else {
												echo '<label class="label label-warning">Inactive</label>';
											} ?>
										</td>
										<td>
											<a href="<?= site_url( "examination/fellow_list/{$value->id}" ) ?>" class="btn btn-xs btn-info">Fellow List</a>
											<?php if ( $this->ion_auth->is_admin() ): ?>
												<a href="<?= site_url( "examination/edit_exam/{$value->id}" ) ?>" class="btn btn-xs btn-danger">Edit Exam</a>
												<a href="<?= site_url( "examination/change_time/{$value->id}" ) ?>" class="btn btn-xs btn-warning">Change Time</a>
											<?php endif; ?>
										</td>
									</tr>
									<?php
								}
							} else {
								echo '<tr><td colspan="14" align="center">No Data Available</td></tr>';
							}
							?>
							</tbody>
						</table>

						<?php echo $links; ?>
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
