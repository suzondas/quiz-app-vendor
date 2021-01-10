<?php $this->load->view( 'emails/header' ); ?>
<div class="reg-success">
	<h4><em><?= $teacher_name; ?></em> Sent you new assignment for the module of "<?php echo "$module_name\" unit \"$unit_name\""; ?>". </h4>
	<table>
		<tr>
			<th width="10%">Title</th>
			<th width="2%">:</th>
			<td><?= $title; ?></td>
		</tr>
		<tr>
			<th width="10%">Details</th>
			<th width="2%">:</th>
			<td><?= $desc; ?></td>
		</tr>
	</table>
	<p class="text-center">Please login and see more details</p>
	<hr>
	<p class="text-center">
		<a href="<?= site_url( 'doctor_login' ) ?>" class="btn btn-success not-print"><i class="fa fa-key"></i> Login</a>
		<a href="<?= config_item( 'home_url' ) ?>" class="btn btn-info not-print"><i class="fa fa-home"></i> Home</a>
	</p>
</div>
<?php $this->load->view( 'emails/footer' ); ?>
