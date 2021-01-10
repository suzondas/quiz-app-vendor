<?php $this->load->view( 'emails/header' ); ?>
<div class="reg-success">
	<h1>Congratulations! <?php echo $user->doc_name; ?>. <br> Your Application is Approved!</h1>
	
	<table>
		<tr>
			<th>Username</th>
			<th>:</th>
			<td><?php echo $user->user_name; ?></td>
		</tr>
		<tr>
			<th>Password</th>
			<th>:</th>
			<td><?php echo $user->password; ?></td>
		</tr>
	</table>
	
	<hr>
	<p class="text-center">Please Keep this for future use.</p>
	<p class="text-center">You can change your Password after Login</p>
	<hr>
	<p class="text-center">
		<a href="<?= site_url( 'doctor_login' ) ?>" class="btn btn-success not-print"><i class="fa fa-key"></i> Login</a>
		<a href="<?= config_item( 'home_url' ) ?>" class="btn btn-info not-print"><i class="fa fa-home"></i> Home</a>
	</p>
</div>
<?php $this->load->view( 'emails/footer' ); ?>
