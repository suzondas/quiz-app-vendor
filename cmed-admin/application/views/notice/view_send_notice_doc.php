<?php
$this->load->view( 'header/view_header' );

$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row">
			<div class="col-lg-12" id="send-notice">
				<section class="panel panel-info">
					<header class="panel-heading">
						<?= $form_action ?> Notice
						<span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:"></a>
                                <a class="fa fa-cog" href="javascript:"></a>
                                <a class="fa fa-times" href="javascript:"></a>
                             </span>
					</header>
					<div class="panel-body">
						<div class="form">
							<form action="<?= current_url(); ?>" class="form-horizontal" method="POST"
								  enctype="multipart/form-data">
								<?php if ( isset( $notice ) ) {
									echo form_hidden( 'id', $notice->id );
								} ?>
								<?php echo form_hidden( 'send_to', 'S' ); ?>
								<?php
								if ( validation_errors() ) {
									echo validation_errors( '<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>' );
								}
								
								if ( $this->session->flashdata( 'flashOK' ) ) {
									echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
									echo $this->session->flashdata( 'flashOK' );
									echo "</div>";
								}
								if ( $this->session->flashdata( 'flashError' ) ) {
									echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
									echo $this->session->flashdata( 'flashError' );
									echo "</div>";
								}
								?>
								
								
								<div class="form-group ">
									<label class="control-label col-sm-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-sm-3">
										<?php
										$ddp = [ 'class' => 'form-control', 'required' => 'required', 'onchange' => 'getDocByYearSession(this)', 'data-url' => site_url( 'result/get_doc_list_by_year_session' ) ];
										echo form_dropdown( 'year', $n_year, ( isset( $notice->year ) ? $notice->year : '' ), $ddp );
										?>
									</div>
									<label for="subject" class="control-label col-sm-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-sm-3">
										<?php
										$ddp = [ 'class' => 'form-control', 'required' => 'required', 'onchange' => 'getDocByYearSession(this)', 'data-url' => site_url( 'result/get_doc_list_by_year_session' ) ];
										echo form_dropdown( 'session', $session_list, ( isset( $notice->session ) ? $notice->session : '' ), $ddp );
										?>
									</div>
								</div>
								<div class="form-group ">
									<label for="module" class="control-label col-lg-2">Fellow </label>
									<div class="col-md-8">
										<?php
										$ddp = 'class="form-control m-bot15 multi-select" id="doc_id"';
										echo form_multiselect( 'doc_id[]', $doc_list, set_value( 'doc_id', ( isset( $notice ) ? $notice->doc_ids : '' ) ), $ddp );
										?>
									</div>
								</div>
								<div class="form-group ">
									<label for="subject" class="control-label col-sm-2">Subject <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-sm-8">
										<input class=" form-control" id="subject" name="subject" type="text" required value="<?= isset( $notice->subject ) ? $notice->subject : '' ?>"/>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-2">Details <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-sm-8">
										<textarea class="form-control summernote" rows="6" name="notice"><?= isset( $notice->notice ) ? $notice->notice : '' ?></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Attachment</label>
									<div class="controls col-sm-6">
										<div class="fileupload fileupload-new" data-provides="fileupload">
                                                <span class="btn btn-white btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                <input type="file" name="attachment" class="default"/>
                                                </span>
											<span class="fileupload-preview" style="margin-left:5px;"></span>
											<a href="#" class="close fileupload-exists" data-dismiss="fileupload"
											   style="float: none; margin-left:5px;"></a>
										</div>
									</div>
									
									<?php if ( isset( $notice->attachment ) ) : ?>
										<div class="col-sm-4">
											<a href="<?= base_url( $notice->attachment ) ?>" class="btn btn-xs btn-info" download>
												Previous File
											</a>
										</div>
									<?php endif; ?>
								</div>
								
								<div class="form-group ">
									<label class="control-label col-sm-2">Status <i class="fa fa-asterisk ipd-star"></i></label>
									<div class="col-sm-3">
										<?= form_dropdown( 'status', $status_array, isset( $notice->status ) ? $notice->status : '', [ 'class' => 'form-control' ] ) ?>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-2">
										<button class="btn btn-success" type="submit"><?= ucfirst( $form_action ) ?> Notice</button>
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
