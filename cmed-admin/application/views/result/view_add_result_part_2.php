<?php
$this->load->view('header/view_header');
$current_date = date('Y-m-d');
?>

<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <?php
        if (validation_errors()) {
            echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>');
        }

        if ($this->session->flashdata('flashOK')) {
            echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
            echo $this->session->flashdata('flashOK');
            echo "</div>";
        }
        if ($this->session->flashdata('flashError')) {
            echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
            echo $this->session->flashdata('flashError');
            echo "</div>";
        }
        ?>

        <div class="row">
            <div class="col-lg-12">
                <form class="cmxform form-horizontal" enctype="multipart/form-data" id="commentForm" role="form"
                      method="post"
                      action="<?php echo base_url('result/processing_part_2'); ?>">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Result Processing Part II
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <!--                                <div class="form-group ">-->
                                <div class="form-group ">
                                    <label for="institute" class="control-label col-lg-2">Exam <i
                                            class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='institute' required";
                                        echo form_dropdown('exam_id', $exam_list_part_2, '', $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
                                    </div>
                                </div>

                            </div><!--dfadsfd-->
                        </div>
                    </section>
                    <!--Permanant address section-->


                </form>
            </div>
        </div>
        <!-- page end-->

        <?php if (isset($rec)) : ?>
            <div class="row">
                <div class="col-lg-12">
                    <form class="cmxform form-horizontal" id="commentForm" role="form" method="post"
                          action="<?php echo base_url() . 'result/save_part_2'; ?>">
                        <section class="panel panel-info">
                            <header class="panel-heading">
                                FCPS Part-II
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                            </header>
                            <div class="panel-body">
                                <div class="form">
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>#</th>
                                            <th>Reg No</th>
                                            <th>Name</th>
                                            <th>Year</th>
                                            <th>Session</th>
                                            <th>Course</th>
<!--                                            <th>Faculty</th>-->
                                            <th>Batch/Subject</th>
                                            <th>Subject</th>
                                            <th>Mark Obtained</th>
                                        </tr>
                                        <?php if ($rec) : foreach ($rec as $i => $row): ?>
                                            <tr>
                                                <td><?= ($i + 1); ?></td>
                                                <td><?= $row->doc_reg_no; ?></td>
                                                <td><?= $row->doc_reg_no; ?></td>
                                                <td><?= $row->year; ?></td>
                                                <td><?= $row->session; ?></td>
                                                <td><?= get_name_by_auto_id('sif_course', $row->course_code, 'course_name'); ?></td>
                                                <!--<td><?/*= get_faculty_name_by_course_code_faculty_code($row->course_code, $row->faculty_code); */?></td>-->
                                                <td><?= get_batch_name($row->course_code, $row->batch_code); ?></td>
                                                <td><?= get_name_by_auto_id('sif_subject', $row->subject_id, 'subject'); ?></td>
                                                <td>
                                                    <input type="number" class="form-control" name="marks[]">
                                                    <input type="hidden" name="ids[]" value="<?= $row->id; ?>">
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                            <tr>
                                                <td colspan="10" class="text-right">
                                                    <input type="submit" value="SAVE" class="btn btn-success">
                                                </td>
                                            </tr>
                                        <?php endif; ?>
                                    </table>
                                </div>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
            <!-- page end-->
        <?php endif; ?>

    </section>
</section>
<!--main content end-->


<?php
$this->load->view('footer/view_footer');
?>    