<?php
$this->load->view('header/view_header');

$current_date = date('Y-m-d');
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->

		<div class="row">
			<div class="col-lg-12">
				<!--todolist start-->
				<section class="panel panel-info">
					<header class="panel-heading">
						Notice
						<span class="tools pull-right">
                            <a href="javascript:" class="fa fa-chevron-down"></a>
                            <a href="javascript:" class="fa fa-cog"></a>
                            <a href="javascript:" class="fa fa-times"></a>
                        </span>
					</header>
					<div class="panel-body">
						<?php
						if (validation_errors()) {
							echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>');
						}

						if ($this->session->flashdata('flashOK')) {
							echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
							echo $this->session->flashdata('flashOK');
							echo "</div>";
						}
						if ($this->session->flashdata('flashError')) {
							echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
							echo $this->session->flashdata('flashError');
							echo "</div>";
						}
						?>

						<div class="m-bot15 text-right">
							<a href="<?= site_url('notice/add_notice_to_doctor') ?>" class="btn btn-primary">Send New Notice</a>
						</div>

						<table class="table table-bordered table-striped">
							<thead>
							<tr>
								<th>#</th>
								<th>Title</th>
								<th>Details</th>
								<th>Attachment</th>
								<th>Sent At</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							</thead>

							<tbody>
							<?php if ($notices) : ?>
								<?php foreach ($notices as $i => $notice) : ?>
									<tr>
										<td><?= (++$i); ?></td>
										<td><?= $notice->subject; ?></td>
										<td><?= word_limiter($notice->notice, 20); ?></td>
										<td class="text-center">
											<?php if ($notice->attachment && file_exists($notice->attachment)) : ?>
												<a href="<?= base_url($notice->attachment); ?>" download class="btn btn-white btn-xs">Download Attachment</a>
											<?php endif; ?>
										</td>
										<td class="text-center">
											<?php echo user_formated_datetime( $notice->updated_at ); ?>
										</td>
										<td class="text-center">
											<?php if ($notice->status == 1) : ?>
												<span class="label label-success">Active</span>
											<?php else: ?>
												<span class="label label-warning">Inactive</span>
											<?php endif; ?>
										</td>
										<td class="text-center">
											<a href="<?= site_url("notice/notice_std_details/$notice->id") ?>" class="btn btn-xs btn-info">View Details</a>
											<a href="<?= site_url("notice/edit_notice_to_doctor/$notice->id") ?>" class="btn btn-xs btn-warning">Edit</a>
											<a href="<?= site_url("notice/delete_notice_to_doctor/$notice->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('Notice will be deleted permanently. Are You Sure?')">Delete</a>
										</td>
									</tr>
								<?php endforeach; ?>
							<?php endif; ?>
							</tbody>
						</table>
					</div>
				</section>
				<!--todolist end-->
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>    
