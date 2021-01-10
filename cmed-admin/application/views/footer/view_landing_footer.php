<!--right sidebar end-->
</section>
<hr>
<footer>
    <div class="text-center">
        <p>&copy; Copyright <?php echo date( 'Y' ) ?>. All Rights Reserved. | By <a href="" title="BANBEIS" class="btn-link">BANBEIS</a> &amp;
            Developed By
            <a href="http://www.bigm-bd.com" title="BIG M RESOURCES LTD." class="btn-link">BIG M RESOURCES LTD.</a>
        </p>
    </div>
</footer>

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<!--<script src="--><?php //echo base_url(); ?><!--js/lib/jquery.js?v=".config_item('app_version')></script>-->
<script type="text/javascript" src="<?php echo base_url( 'js/lib/jquery-1.8.3.min.js?v=' . config_item( 'app_version' ) ); ?>"></script>
<script type="text/javascript" src="<?php echo base_url( 'bs3/js/bootstrap.min.js?v=' . config_item( 'app_version' ) ); ?>"></script>

<?php if ( $this->uri->segment( 1 ) == 'admission' ) : ?>
    <script type="text/javascript" src="<?php echo base_url( 'js/jquery-validate/jquery.validate.min.js?v=' . config_item( 'app_version' ) ); ?>"></script>

    <!--date time plugin script-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bootstrap-datepicker/css/datepicker.css"/>
    <script type="text/javascript" src="<?php echo base_url( 'assets/bootstrap-datepicker/js/bootstrap-datepicker.js?v=' . config_item( 'app_version' ) ); ?>"></script>

    <!--file upload plugin script-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bootstrap-fileupload/bootstrap-fileupload.css"/>
    <script type="text/javascript" src="<?php echo base_url( 'assets/bootstrap-fileupload/bootstrap-fileupload.js?v=' . config_item( 'app_version' ) ); ?>"></script>

    <script type="text/javascript" src="<?php echo base_url( 'js/advanced-form/advanced-form.js?v=' . config_item( 'app_version' ) ); ?>"></script>

    <script type="text/javascript" src="<?php echo base_url( 'js/dashboard.js?v=' . config_item( 'app_version' ) ); ?>"></script>

    <!--custom js function -->
    <script src="<?php echo base_url( 'js/custom.js?v=' . config_item( 'app_version' ) ); ?>"></script>
<?php endif; ?>
<script src="<?php echo base_url( 'js/jnn_submitter.js?v=' . config_item( 'app_version' ) ); ?>"></script>

<?php if ( $this->uri->segment( 1 ) == 'exam' ) : ?>
    <script src="<?php echo base_url( 'js/jTimer.js?v=' . config_item( 'app_version' ) ); ?>"></script>
<?php endif; ?>

</body>
</html>
