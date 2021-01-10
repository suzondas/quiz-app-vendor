<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'Y-m-d' );
?>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->

		<div class="row">
			<div class="col-lg-12">
				<form class="cmxform form-horizontal" id="commentForm" role="form" method="post" action="<?php echo base_url( "examination/update_exam/{$exam->id}" ); ?>">
					<?= form_hidden( 'module_id', $exam->module_id ); ?>
					<?= form_hidden( 'unit_id', $exam->unit_id ); ?>
					<section class="panel panel-info">
						<header class="panel-heading">
							Edit Exam of <?= $unit_name = get_name_by_id( 'module_units', $exam->unit_id ); ?>
							<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
						</header>
						<div class="panel-body">
							<div class="form">
								<?php
								echo $msg;
								?>
							</div>

							<div class="form-group">
								<label class="control-label col-lg-3">Module</label>
								<div class="col-lg-6">
									<input class="form-control" type="text" value="<?= get_name_by_auto_id( 'modules', $exam->module_id ) ?>" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Unit</label>
								<div class="col-lg-6">
									<input class="form-control" type="text" value="<?= $unit_name; ?>" disabled>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-lg-3">Examination Title <i class="fa fa-asterisk ipd-star"></i></label>
								<div class="col-lg-6">
									<input class="form-control" type="text" name="name" value="<?= $exam->name; ?>">
									<i class="text-danger"><?= form_error( 'name' ) ?></i>
								</div>
							</div>

							<div class="form-group">
								<label for="Faculty" class="control-label col-lg-3">Year <i class="fa fa-asterisk ipd-star"></i></label>
								<div class="col-lg-2">
									<?php
									$ddp = "class='form-control m-bot15' id='year'";
									echo form_dropdown( 'year', $n_year, ( isset( $exam ) ? $exam->year : date( 'Y' ) ), $ddp );
									?>
									<i class="text-danger"><?= form_error( 'year' ) ?></i>
								</div>
								<label for="Status" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
								<div class="col-lg-2">
									<?php
									$ddp = 'class="form-control m-bot15" ';
									echo form_dropdown( 'session', $session_list, $exam->session, $ddp );
									?>
									<i class="text-danger"><?= form_error( 'session' ) ?></i>
								</div>

							</div>

							<div class="form-group">
								<label for="Name" class="control-label col-lg-3">Date Range <i class="fa fa-asterisk ipd-star"></i></label>
								<div class="col-lg-6">
									<div class="input-group input-large">
										<input type="text" class="form-control form_datetime" name="from_date_time" placeholder="Date from" value="<?= $exam->open_date ?>" readonly>
										<span class="input-group-addon">To</span>
										<input type="text" class="form-control form_datetime" name="to_date_time" placeholder="Date to" value="<?= $exam->close_date ?>" readonly>
									</div>
									<i class="text-danger"><?= form_error( 'from_date_time' ) . form_error( 'to_date_time' ) ?></i>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-lg-3">Questions <i class="fa fa-asterisk ipd-star"></i></label>
								<div class="col-lg-6">
									<?= form_multiselect( 'ques[]', $question_list, $exam->question_ids, "class='form-control select2'" ); ?>
									<i class="text-danger"><?= form_error( 'from_date_time' ) ?></i>
								</div>
							</div>

							<div class="form-group">
								<label for="Name" class="control-label col-lg-3">Status</label>
								<div class="col-lg-2">
									<?= form_dropdown( 'status', $status_list, $exam->status, 'class="form-control"' ); ?>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-3 col-lg-3">
									<button class="btn btn-success" type="submit" onclick="return confirm('Are You Sure? All users data attended to this exam will be reset!')">Update Exam</button>
								</div>
							</div>

						</div>
					</section>
				</form>
			</div>
		</div><!--dfadsfd-->
	</section>
	<!-- page end-->


</section>
</section>
<!--main content end-->


<?php
$this->load->view( 'footer/view_footer' );
?>
