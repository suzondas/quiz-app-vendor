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
                    <?php
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
                    <header class="panel-heading">
                        Search Wizard - Result
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?php echo base_url() . 'result'; ?>">
                                <div class="form-group ">
                                    <label for="year" class="control-label col-lg-2">Year <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='year' required";
                                        echo form_dropdown('year', $current_fut_year, date('Y'), $ddp);
                                        ?>
                                    </div>
                                    <label class="control-label col-lg-2">Session <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('session', $session_list, '', $ddp);
                                        ?>
                                    </div>
                                    <label for="course_code" class="control-label col-lg-2">Course <i
                                            class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">
                                        <?php
                                        $url = base_url('setting/ajax_get_batch_topic');
                                        $ddp = "class='form-control m-bot15' id='course_code' onchange=get_faculty_id('$url') required";
                                        //                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';
                                        echo form_dropdown('course_code', $course_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
<!--                                    <label for="faculty_code" class="control-label col-lg-2">Faculty</label>-->
<!--                                    <div class="col-lg-2">-->
<!--                                        --><?php
//                                        $url = base_url('setting/ajax_get_batch_topic');
//                                        $ddp = "class='form-control m-bot15' id='faculty_code' onchange=get_faculty_id('$url')";
//                                        echo form_dropdown('faculty_code', $faculty_list, '', $ddp);
//                                        ?>
<!--                                    </div>-->
                                    <label for="batch_code" class="control-label col-lg-2">Batch/Subject <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="batch_code" required';
                                        echo form_dropdown('batch_code', $batch_list, '', $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Exam </label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="batch_id"';
                                        echo form_dropdown('exam_id', $exam_list, '', $ddp);
                                        ?>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Topic</label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control package_des_list" id="topic_code"';
                                        echo form_dropdown('topic_id', ['' => ''], isset($res->pak_des) ? $res->pak_des : '', $ddp);
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

        <?php if (isset($rec) && !empty($rec)) : ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Results
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="col-sm-12 text-right m-bot15">
                                <a href="<?= base_url('result/print_res'); ?>" class="btn btn-warning"><i class="fa fa-print"></i> Print</a>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <th>Course</th>
                                    <td><?= get_name_by_id('sif_course', $exam->course_code, 'course_code', 'course_name'); ?></td>
                                    <th>Exam</th>
                                    <td><?= $exam->exam_name; ?></td>
                                    <th>Date</th>
                                    <td><?= $exam->exam_date; ?></td>
                                </tr>
                                <tr>
                                    <th>Batch</th>
                                    <td><?= get_batch_name($exam->course_code, $exam->faculty_code, $exam->batch_code) ?></td>
                                    <th>Topics</th>
                                    <td><?= get_topic_name($exam->course_code, $exam->faculty_code, $exam->topic_id) ?></td>
                                    <th>Highest Mark</th>
                                    <td><?= $exam->highest_mark; ?></td>
                                </tr>
                            </table>
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Reg. No</th>
                                    <th>Fellows Name</th>
<!--                                    <th>Faculty</th>-->
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Position</th>
                                    <th>Subject Position</th>
                                    <th>Candidate Position</th>
                                    <th>Wrong Answer</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach ($rec as $key => $value) {
                                    ?>
                                    <tr>
                                        <td><?php echo $value->doc_reg_no; ?></td>
                                        <td><?php echo get_name_by_auto_id('sif_admission', $value->doc_id, 'doc_name'); ?></td>
<!--                                        <td>--><?php //echo get_faculty_name_by_course_code_faculty_code('sif_faculty', $value->course_code, $value->faculty_code); ?><!--</td>-->
                                        <td><?php echo get_subject_name($value->course_code, $value->faculty_code, $value->subject_id); ?></td>
                                        <td class="text-center"><?php echo $value->obtained_mark; ?></td>
                                        <td class="text-center"><?php echo $value->merit_pos; ?></td>
                                        <td class="text-center"><?php echo $value->subject_pos; ?></td>
                                        <td class="text-center"><?php echo $value->overall_pos; ?></td>
                                        <td class="text-center"><?php echo $value->no_wrong; ?></td>
                                    </tr>

                                    <?php
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        <?php endif; ?>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>    
