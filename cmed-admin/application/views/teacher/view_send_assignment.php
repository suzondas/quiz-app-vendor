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
                        Send Assignment to Fellow
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
                                  action="<?php echo base_url('teacher/save_doctors_assignment'); ?>"
                                  enctype="multipart/form-data">
                                <input type="hidden" name="teacher_id" value="<?= $authUser->teacher_id; ?>">
                                <input type="hidden" name="doc_id" value="<?= $doc->id; ?>">
                                <?php
                                if (isset($assignment)) {
                                    echo '<input type="hidden" name="assignment_id" value="' . $assignment->id . '">';
                                }
                                ?>
                                <div class="form-group ">
                                    <label for="teacher" class="control-label col-lg-2">Faculty <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input type="text" value="<?= get_teacher_name_by_id($authUser->teacher_id); ?>"
                                               class="form-control" disabled>
                                    </div>
                                    <label for="doctors" class="control-label col-lg-2">Fellow <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input type="text"
                                               value="<?= get_name_by_auto_id('sif_admission', $doc->id, 'doc_name'); ?>"
                                               class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input type="text" value="<?= get_name_by_auto_id('modules', $doc->module); ?>"
                                               class="form-control" disabled>
                                        <?= form_hidden('module', $doc->module); ?>
                                    </div>
                                    <label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">

                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="unit" required';
                                        echo form_dropdown('unit', $unit_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="subject" class="control-label col-lg-2">Title <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-10">
                                        <input type="text" name="subject" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="desc" class="control-label col-lg-2">Details </label>
                                    <div class="col-lg-10">
                                        <textarea name="desc" id="desc" rows="5" class="form-control summernote"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="attachment" class="control-label col-lg-2">Attachment </label>
                                    <div class="col-lg-4">
                                        <input type="file" name="attachment">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="mark" class="control-label col-lg-2">Mark <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-3">
                                        <input type="text" name="mark" class="form-control number-only" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-success" type="submit">Send Assignment</button>
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
