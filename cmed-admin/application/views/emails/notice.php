<?php $this->load->view( 'emails/header' ); ?>
<div class="reg-success">
	<p><?php echo $fellow['name']; ?>,</p>
	
	<div class="main">
		<?php echo html_entity_decode( $notice ); ?>
	</div>
	
	
	<hr>
	<p class="text-center">
		<a href="<?= site_url( 'doctor_login' ) ?>" class="btn btn-success not-print"><i class="fa fa-key"></i> Login</a>
		<a href="<?= config_item( 'home_url' ) ?>" class="btn btn-info not-print"><i class="fa fa-home"></i> Home</a>
	</p>
</div>
<?php $this->load->view( 'emails/footer' ); ?>
