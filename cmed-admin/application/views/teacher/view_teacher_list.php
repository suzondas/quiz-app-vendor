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
						Search Wizard - Faculty
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<div class="form">
							<form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
								  action="<?php echo base_url() . 'teacher/records'; ?>">

								<div class="form-group ">
									<label for="Name" class="control-label col-lg-2">Faculty Name</label>
									<div class="col-lg-4">
										<input class=" form-control" id="teacher_name" name="tec_name" type="text"/>
									</div>
									<label for="Name" class="control-label col-lg-2">Date Range</label>
									<div class="col-lg-4">
										<div class="input-group input-large" data-date="<?php echo $current_date; ?>"
											 data-date-format="mm/dd/yyyy">
											<input type="text" class="form-control datepicker" name="from_date_time">
											<span class="input-group-addon">To</span>
											<input type="text" class="form-control datepicker" name="to_date_time">
										</div>
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
		<div class="row">
			<div class="col-lg-12">
				<section class="panel panel-info">
					<header class="panel-heading">
						Faculty List <span class="badge bg-info"><?= $total_rows; ?></span>
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?= $msg; ?>
						<table class="table table-bordered table-striped table-sm">
							<thead>
							<tr>
								<th>#</th>
								<th>ID</th>
								<th>Name</th>
								<th>Email/Password</th>
								<th>Phone</th>
								<th>Joining Date</th>
								<th>Image</th>
								<th>Status</th>
								<th colspan="3">Action</th>
							</tr>
							</thead>
							<tbody>
							<?php
							if ( !empty( $rec ) ) {

								foreach ( $rec as $key => $value ) {
									?>
									<tr>
										<td><?= ( ++$key ) ?></td>
										<td><?php echo $value->teacher_id; ?></td>
										<td><?php echo $value->tec_name; ?></td>
										<td>
											<?php echo $value->email; ?> <br>
											<b>Password: </b> <?php echo get_name_by_id( 'sif_users', $value->teacher_id, 'teacher_id', 'password_view' ); ?>
										</td>
										<td><?php echo $value->mobile; ?></td>
										<td class="text-center"><label class="label label-primary"><?php echo user_date( $value->joining_date ); ?></label></td>
										<td class="text-center">
											<?php
											if ( $value->photo && file_exists( $value->photo ) ) {
												?>
												<img src="<?php echo base_url( $value->photo ); ?>" width="50px" height="50px">
												<?php
											} else {
												?>
												<img src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=Image" alt="" width="50px" height="50px"/>
												<?php
											}
											?>
										</td>
										<td>
											<?php
											if ( $value->status == '1' ) {
												echo '<span class="label label-success">Active</span>';
											} else {
												echo '<span class="label label-warning">Inactive</span>';
											}
											?>
										</td>
										<td class="text-center">
											<a href="<?php echo base_url( 'teacher/profile/' . $value->id ); ?>" class="btn btn-primary btn-xs m-bot5">
												<i class="glyphicon glyphicon-eye-open"></i>
												View Details
											</a>
											<br>
											<a href="<?php echo base_url( 'teacher/edit/' . $value->id ); ?>" class="btn btn-warning btn-xs">
												<i class="fa fa-pencil-square-o"></i>
												Edit
											</a>
										</td>
									</tr>
									<?php
								}
							} else {
								echo '<tr><td colspan="11" align="center">No Data Available</td></tr>';
							}
							?>
							</tbody>
						</table>
					</div>
				</section>
			</div>
			<?php echo $links; ?>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>