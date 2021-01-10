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
						Assign Faculty Fellow
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
					</header>
					<div class="panel-body">
						<?php echo $msg; ?>
						<div class="form">
							<form class="cmxform form-horizontal " role="form" method="post"
								  action="<?php echo base_url( 'teacher/assign_doctors' ); ?>">
								
								<div class="form-group ">
									<label for="Year" class="control-label col-lg-2">Year <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required id="year"';
										echo form_dropdown( 'year', $n_year, date( 'Y' ), $ddp );
										?>
									</div>
									<label for="Session" class="control-label col-lg-2">Session <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required id="session"';
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
									<label for="teacher" class="control-label col-lg-2">Faculty <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<?php
										$ddp = 'class="form-control m-bot15" required';
										echo form_dropdown( 'teacher', $teacher_list, '', $ddp );
										?>
									</div>
								</div>
								<div class="form-group ">
									<label for="doctors" class="control-label col-lg-2"></label>
									<div class="col-md-10">
										<label class="fellow one">Admitted Fellow</label>
										<label class="fellow two">Selected Fellow for this Faculty</label>
										<?php
										$ddp = 'class="form-control m-bot15 multi-select" required multiple id="doctors"';
										echo form_dropdown( 'doctors[]', $doctors_list, '', $ddp );
										?>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-2">
										<button class="btn btn-primary" type="submit">Assign</button>
									</div>
								</div>
							</form>
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
