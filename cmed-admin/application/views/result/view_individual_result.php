<?php
if ( $this->ion_auth->logged_in() ) {
    $this->load->view( 'header/view_header' );
} else {
    $this->load->view( 'header/view_student_header' );
}
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Search Wizard
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php echo $msg; ?>
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?php echo current_url(); ?>">

                                <div class="form-group ">
                                    <label class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = ['class' => 'form-control', 'onchange' => 'getDocByYearSession(this)', 'data-url' => site_url( 'result/get_doc_list_by_year_session' )];
                                        echo form_dropdown( 'year', $n_year, set_value( 'year', date( 'Y' ) ), $ddp )
                                        ?>
                                    </div>
                                    <label class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = ['class' => 'form-control', 'onchange' => 'getDocByYearSession(this)', 'data-url' => site_url( 'result/get_doc_list_by_year_session' )];
                                        echo form_dropdown( 'session', $session_list, set_value( 'session' ), $ddp );
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Fellow <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown( 'doc_id', $doc_list, set_value( 'doc_id' ), $ddp );
                                        ?>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
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
