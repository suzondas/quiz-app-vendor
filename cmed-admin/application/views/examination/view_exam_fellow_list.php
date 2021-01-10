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
						EXAM FELLOW LIST <span class="badge bg-info"><?= $total_rows; ?></span>
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?= $msg; ?>
						<?php if ( !empty( $rec ) ) : ?>
							<table class="table table-bordered table-striped">
								<tr>
									<th width="15%">Year</th>
									<td width="35%"><?= $rec[0]->year; ?></td>
									<th width="15%">Session</th>
									<td width="35%"><?= isset( $session_list[$rec[0]->session] ) ? $session_list[$rec[0]->session] : ""; ?></td>
								</tr>
								<tr>
									<th>Module</th>
									<td><?php echo get_name_by_auto_id( 'modules', $rec[0]->module_id ); ?></td>
									<th>Unit</th>
									<td><?php echo get_name_by_auto_id( 'module_units', $rec[0]->unit_id ); ?></td>
								</tr>
							</table>
							<table class="table table-bordered table-striped">
								<thead>
								<tr>
									<th>#</th>
									<th>Fellow Name</th>
									<th>MCQ Mark</th>
									<th>Status</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th width="12%">Action</th>
								</tr>
								</thead>
								<tbody>
								<?php
								foreach ( $rec as $key => $value ) {
									?>
									<tr>
										<td><?php echo $key + 1; ?></td>
										<td>
											<p><a href="<?= site_url( "admission/doc_profile/{$value->doc_id}" ) ?>"><?php echo $value->doc_name; ?></a></p>
											<p>Mobile: <a href="tel:<?= $value->phone ?>" class="btn-link"><?= $value->phone ?></a></p>
										</td>
										<td class="text-center"><?php echo $value->final_mark ? number_format( $value->final_mark, 2 ) : NULL; ?></td>
										
										<td class="text-center">
											<?php
											$class = 'default';
											if ( $value->status == 0 ) {
												echo " <label class=\"badge label-info\">Pending..</label>";
											} elseif ( $value->status == 1 ) {
												echo " <label class=\"badge label-success\">Completed</label>";
											} elseif ( $value->status == 8 ) {
												echo " <label class=\"badge label-inverse\">Started</label>";
											} elseif ( $value->status == 9 ) {
												echo " <label class=\"badge label-warning\">Not Attented</label>";
											} ?>
										
										</td>
										<td class="text-center">
											<label class="label label-primary"><?= user_formated_datetime( $value->open_date ) ?></label>
										</td>
										<td class="text-center">
											<label class="label label-danger"><?= user_formated_datetime( $value->close_date ) ?></label>
										</td>
										<td class="text-center">
											<a href="<?php echo base_url( "result/mcq_details/$value->id" ); ?>" class="btn btn-warning btn-xs" title="MCQ Details" data-toggle="tooltip" data-placement="top">
												MCQ Details
											</a>
											<a href="<?php echo base_url( "result/mcq_result/$value->id" ); ?>" class="btn btn-info btn-xs" title="MCQ Result" data-toggle="tooltip" data-placement="top">
												MCQ Result
											</a>
											<!-- Single button -->
											<div class="btn-group">
												<button type="button" class="btn btn-white btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													Status Change <span class="caret"></span>
												</button>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="<?= site_url( "result/status_change/{$value->id}/{$value->exam_id}/9" ) ?>" onclick="return confirm('Are You Sure? You want to perform this action.')">Open</a></li>
													<li><a href="<?= site_url( "result/status_change/{$value->id}/{$value->exam_id}/8" ) ?>" onclick="return confirm('Are You Sure? You want to perform this action.')">Started</a></li>
													<li><a href="<?= site_url( "result/status_change/{$value->id}/{$value->exam_id}/1" ) ?>" onclick="return confirm('Are You Sure? You want to perform this action.')">Completed</a></li>
												</ul>
											</div>
										</td>
									</tr>
									
									<?php
								}
								?>
								</tbody>
							</table>
						<?php else: ?>
							<h4 class="text-center text-warning">Nothing Found..</h4>
						<?php endif; ?>
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
