<?php
$this->load->view( 'header/view_landing_header' );
$current_date = date( 'Y-m-d' );
?>

<!--main content start-->
<section id="" class="container">
    <section class="wrapper">
        <!-- page start-->

        <div class="col-md-8 col-md-offset-2">
            <div class="reg-success">
                <h1>Hello, <?php echo $ret['data']['doc_name']; ?>. <br> Your Application is Successful!</h1>
                <h2>Your Username: <i><?php echo $ret['data']['user_name']; ?></i> and Password: <i><?php echo $ret['data']['password']; ?></i></h2>
                <h3>Please Keep this for future use.</h3>
                <h4>You can change your Password after Login</h4>
                <hr>
                <p class="text-center">
                    <a href="#" onclick="return window.print()" class="btn btn-info not-print"><i class="fa fa-print"></i> Print</a>
                    <a href="<?= site_url('doctor_login') ?>" class="btn btn-success not-print"><i class="fa fa-key"></i> Login</a>
                    <a href="<?= config_item('home_url') ?>" class="btn btn-warning not-print"><i class="fa fa-home"></i> Home</a>
                </p>
            </div>
        </div>
        <!-- page end-->


    </section>
</section>
<!--main content end-->


<?php
$this->load->view( 'footer/view_landing_footer' );
?>
