<?php $this->load->view( 'emails/header' ); ?>
<div class="reg-success">
    <h1>Congratulations! <?php echo $name; ?>. <br> Your Account Created in CMEd as a Faculty!</h1>
    <p>Your Username: <i><?php echo $username; ?></i></p>
    <p>Password: <i><?php echo $password; ?></i></p>
    <hr>
    <p class="text-center">Please Keep this for future use.</p>
    <p class="text-center">You can change your Password after Login</p>
    <hr>
    <p class="text-center">
        <a href="<?= site_url( 'login?type=faculty' ) ?>" class="btn btn-success not-print"><i class="fa fa-key"></i> Login</a>
        <a href="<?= config_item( 'home_url' ) ?>" class="btn btn-info not-print"><i class="fa fa-home"></i> Home</a>
    </p>
</div>
<?php $this->load->view( 'emails/footer' ); ?>
