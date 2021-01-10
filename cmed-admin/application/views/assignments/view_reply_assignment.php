<?php
$this->load->view( 'header/view_student_header' );
$current_date = date( 'm/d/Y' );
$id           = $this->uri->segment( 3 );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Reply Assignment
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
                            <?php echo $msg; ?>
                            <form class="cmxform form-horizontal " role="form" method="post"
                                  action="<?php echo site_url( "student_dashboard/save_reply_assignment/{$assignment->id}" ); ?>"
                                  enctype="multipart/form-data">
                                <div class="form-group ">

                                    <label for="doctors" class="control-label col-lg-2">Fellow</label>
                                    <div class="col-lg-4">
                                        <input type="text"
                                               value="<?= get_name_by_auto_id( 'sif_admission', $assignment->doc_id, 'doc_name' ); ?>"
                                               class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Module</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control"
                                               value="<?= get_name_by_auto_id('modules', $assignment->module) ?>" disabled>
                                    </div>
                                    <label for="unit" class="control-label col-lg-2">Unit </label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control"
                                               value="<?= get_name_by_auto_id('module_units', $assignment->unit) ?>" disabled>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="title" class="control-label col-lg-2">Title <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-10">
                                        <input type="text" name="title" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="desc" class="control-label col-lg-2">Details</label>
                                    <div class="col-lg-10">
                                        <textarea name="desc" id="desc" rows="5" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="attachment" class="control-label col-lg-2">Attachment <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input type="file" name="attachment" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-2">
                                        <label class="label label-primary">Note: Please prepare your Assignment in your PC/Laptop and upload here..</label> <br> <br>
                                        <label class="label label-warning">Allowed File Types: doc, docx, pdf</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-primary" type="submit">Reply</button>
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
