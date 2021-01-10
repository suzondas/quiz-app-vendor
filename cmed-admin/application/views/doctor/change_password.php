<?php
$this->load->view( 'header/view_student_header' );
$current_date = date( 'Y-m-d' );
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            <?php //echo print_r($res);exit;?>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">

                    <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                          action="<?php echo current_url(); ?>" enctype="multipart/form-data">
<!--                        <input type="hidden" name="auto_id" value="--><?php //echo isset( $user->id ) ? $user->id : ''; ?><!--">-->
                        <section class="panel panel-info">
                            <header class="panel-heading">
                                Change Password
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                            </header>
                            <div class="panel-body">

                                <?= $msg; ?>
                                <div class="form">

                                    <div class="form-group">
                                        <label for="old_password" class="control-label col-lg-4">Old Password <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input type="password" name="old" class="form-control" required id="old_password" value="<?= set_value('old') ?>">
                                            <i class="text-danger"><?= form_error( 'old' ) ?></i>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="new_password" class="control-label col-lg-4">New Password <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input type="password" name="new" class="form-control" required id="new_password" value="<?= set_value('new') ?>">
                                            <i class="text-danger"><?= form_error( 'new' ) ?></i>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="new_password" class="control-label col-lg-4">Confirm Password <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input type="password" name="new_confirm" class="form-control" required id="new_password" value="<?= set_value('new_confirm') ?>">
                                            <i class="text-danger"><?= form_error( 'new_confirm' ) ?></i>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-4 col-lg-6 text-right">
                                            <button class="btn btn-warning" type="submit">Change Password</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </form>
                </div>
            </div>
            <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>