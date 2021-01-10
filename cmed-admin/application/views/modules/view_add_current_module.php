<?php
$this->load->view('header/view_header');
$current_date = date('m/d/Y');
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Current Module
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
                                    <label for="Name" class="control-label col-md-3">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('year', $n_year, date('Y'), $ddp)
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-md-3">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('session', $session_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="module" class="control-label col-md-3">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('module', $module_list, '', $ddp);
                                        ?>
                                    </div>
                                   <!-- <label for="unit" class="control-label col-md-3">Unit </label>
                                    <div class="col-lg-4">

                                        <?php
/*                                        $ddp = 'class="form-control m-bot15" id="unit"';
                                        echo form_dropdown('unit', $unit_list, '', $ddp);
                                        */?>
                                    </div>-->
                                </div>


                                <div class="form-group">
                                    <div class="col-lg-offset-3 col-md-3">
                                        <button class="btn btn-success" type="submit">Set Current Module</button>
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
$this->load->view('footer/view_footer');
?>
