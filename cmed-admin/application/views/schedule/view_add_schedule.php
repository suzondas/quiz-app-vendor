<?php
$this->load->view('header/view_header');
$current_date = date('Y-m-d');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->

            <?php
            if ($action == 'Add') {
                $url = base_url('schedule/save');
                $btn_val = 'Save';
            } elseif ($action == 'Edit') {
                $btn_val = 'Update';
                $url = base_url("schedule/update/{$schedule->id}");
            } else {
                $btn_val = 'Save';
                $url = base_url('schedule');
            }
            ?>

            <div class="row">
                <div class="col-lg-12">
                    <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                          action="<?php echo $url; ?>" enctype="multipart/form-data">
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
                        <section class="panel panel-info">
                            <header class="panel-heading">
                                <?= $action; ?> Schedule Form
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                            </header>
                            <div class="panel-body">
                                <div class="form">
                                    <div class="form-group">
                                        <label class="control-label col-lg-2">Schedule Type <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15' required";
                                            echo form_dropdown('schedule_type', $schedule_type, (isset($schedule) ? $schedule->schedule_type : ''), $ddp);
                                            ?>
                                        </div>
                                        <label class="control-label col-lg-2">Schedule Name</label>
                                        <div class="col-lg-2">
                                            <input type="text" class="form-control" name="schedule_name" value="<?= (isset($schedule) ? $schedule->schedule_name : '') ?>">
                                        </div>
                                        <label class="control-label col-lg-2">Paper</label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15'";
                                            echo form_dropdown('paper', $paper_list, (isset($schedule) ? $schedule->paper : ''), $ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="year" class="control-label col-lg-2">Year <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15' id='year' required";
                                            echo form_dropdown('year', $current_fut_year, (isset($schedule) ? $schedule->year : date('Y')), $ddp);
                                            ?>
                                        </div>
                                        <label class="control-label col-lg-2">Session <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"  required';
                                            echo form_dropdown('session', $session_list, (isset($schedule) ? $schedule->session : ''), $ddp);
                                            ?>
                                        </div>
                                        <label class="control-label col-lg-2">Service Package <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15' required";
                                            echo form_dropdown('service_pack_id', $service_package, (isset($schedule) ? $schedule->service_pack_id : ''), $ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="course_code" class="control-label col-lg-2">Course <i
                                                class="fa fa-asterisk ipd-star"></i></label>

                                        <div class="col-lg-2">
                                            <?php
                                            $url = base_url('setting/ajax_get_batch_topic');
                                            $ddp = "class='form-control m-bot15' id='course_code' required onchange=get_faculty_id('$url') required";
                                            //                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';
                                            echo form_dropdown('course_code', $course_list, (isset($schedule) ? $schedule->course_code : ''), $ddp);
                                            ?>
                                        </div>
                                        <label for="batch_code" class="control-label col-lg-2">Batch/Subject <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" id="batch_code" required';
                                            echo form_dropdown('batch_code', $batch_list, (isset($schedule) ? $schedule->batch_code : ''), $ddp);
                                            ?>
                                        </div>
                                        <label class="control-label col-md-2">Room Name <i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-md-2">
                                            <?php
                                            $ddp = "class='form-control' required";
                                            echo form_dropdown('room_id', $room_list, (isset($schedule) ? $schedule->room_id : ''), $ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="from-group">
                                        <div class="row">
                                            <label for="Name" class="control-label col-md-2">Date <i
                                                    class="fa fa-asterisk ipd-star"></i></label>
                                            <div class="col-md-2 m-bot15">
                                                <div data-date-viewmode="years" data-date-format="yyyy--mm--dd"
                                                     data-date="<?= (isset($schedule) ? $schedule->date : $current_date) ?>"
                                                     class="input-append date dpYears">
                                                    <input type="text" name="date" readonly=""
                                                           value="<?= (isset($schedule) ? $schedule->date : $current_date) ?>" size="16"
                                                           class="form-control">
                                                        <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i
                                                            class="fa fa-calendar"></i></button>
                                                </span>
                                                </div>
                                            </div>
                                            <label for="Name" class="control-label col-md-2">Time Range <i
                                                    class="fa fa-asterisk ipd-star"></i></label>
                                            <div class="col-md-4">
                                                <div class="input-group bootstrap-timepicker">
                                                    <input type="text" class="form-control timepicker"
                                                           name="time_from" value="<?= (isset($schedule) ? $schedule->time_from : '') ?>">
                                                    <span class="input-group-addon">To</span>
                                                    <input type="text" class="form-control timepicker" name="time_to" value="<?= (isset($schedule) ? $schedule->time_to : '') ?>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group">

                                        <label for="topic_code" class="control-label col-lg-2">Topic</label>
                                        <div class="col-lg-4">
                                            <?php
                                            $ddp = 'class="form-control m-bot15 multi-select" id="topic_code" multiple';
                                            echo form_dropdown('topic_id[]', $topic_list, (isset($schedule) ? explode(',',$schedule->topic_id) : ''), $ddp);
                                            ?>
                                        </div>

                                        <label for="subject_code" class="control-label col-lg-1">Subject</label>
                                        <div class="col-lg-4">
                                            <?php
                                            $ddp = 'class="form-control m-bot15 multi-select" id="subject_code" multiple';
                                            echo form_dropdown('subject_id[]', $subject_list, (isset($schedule) ? explode(',',$schedule->subject_id) : ''), $ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <label class="control-label col-lg-2">Faculty<i
                                                class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15' required";
                                            echo form_dropdown('teacher_id', $teacher_list, (isset($schedule) ? $schedule->teacher_id : ''), $ddp);
                                            ?>
                                        </div>

                                        <label class="control-label col-lg-2">Executive</label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15'";
                                            echo form_dropdown('executive', $executive_list, (isset($schedule) ? $schedule->executive_id : ''), $ddp);
                                            ?>
                                        </div>

                                        <label class="control-label col-lg-2">Support Stuff</label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = "class='form-control m-bot15'";
                                            echo form_dropdown('support_stuff', $support_stuff_list, (isset($schedule) ? $schedule->support_stuff_id : ''), $ddp);
                                            ?>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-2">
                                            <button class="btn btn-primary" type="submit"><?= $btn_val; ?></button>

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
$this->load->view('footer/view_footer');
?>