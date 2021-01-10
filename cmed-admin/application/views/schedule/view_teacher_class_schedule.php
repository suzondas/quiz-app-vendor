<?php
$this->load->view('header/view_header');
$current_date = date('Y-m-d');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->

            <?php if ($this->ion_auth->is_admin()): ?>

                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel panel-info">
                            <header class="panel-heading">
                                Search Wizard - Schedule
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                            </header>
                            <div class="panel-body">
                                <div class="form">
                                    <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                          action="<?php echo current_url(); ?>">
                                        <div class="form-group ">
                                            <label for="Faculty" class="control-label col-lg-2">Year</label>
                                            <div class="col-lg-2">
                                                <?php
                                                $ddp = "class='form-control m-bot15' id='year'";
                                                echo form_dropdown('year', $current_fut_year, (isset($res) ? $res->year : ''), $ddp);
                                                ?>
                                            </div>
                                            <label for="Name" class="control-label col-lg-2">Session</label>
                                            <div class="col-lg-2">
                                                <?php
                                                $ddp = 'class="form-control m-bot15"';
                                                echo form_dropdown('session', $session_list, '', $ddp);
                                                ?>
                                            </div>
                                            <label for="Course" class="control-label col-lg-2">Course </label>

                                            <div class="col-lg-2">
                                                <?php
                                                $url = base_url('setting/ajax_get_course_by_faculty_id');
                                                $ddp = "class='form-control m-bot15' id='course_code' required onchange=get_faculty_id('$url')";
                                                echo form_dropdown('course_code', $course_list, (isset($res) ? $res->course : ''), $ddp);
                                                ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <!--<label for="Faculty" class="control-label col-lg-2">Faculty </label>
                                    <div class="col-lg-2">
                                        <?php
                                            /*                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                                                                    $ddp = "class='form-control m-bot15' id='faculty_code'  onchange=get_faculty_id('$url')";
                                                                                    echo form_dropdown('faculty_code', array(''=>'Select'), '', $ddp);
                                                                                    */?>
                                    </div>-->
                                            <label for="Status" class="control-label col-lg-2">Batch/Subject </label>
                                            <div class="col-lg-2">
                                                <?php
                                                $ddp = 'class="form-control m-bot15" id="batch_code" required';
                                                echo form_dropdown('batch_code', array(''=>'Select'), '', $ddp);
                                                ?>
                                            </div>
                                            <label for="Status" class="control-label col-lg-2">Schedule Type </label>
                                            <div class="col-lg-2">
                                                <?php
                                                $ddp = 'class="form-control m-bot15" id="batch_code" required';
                                                echo form_dropdown('type', $schedule_type, '', $ddp);
                                                ?>
                                            </div>

                                        </div>
                                        <div class="form-group ">
                                            <!--<label for="Name" class="control-label col-lg-2">Service Package</label>
                                    <div class="col-lg-3">
                                        <?php
                                            /*                                        $ddp = 'class="form-control m-bot15" required';
                                                                                    echo form_dropdown('service_pack_id', $service_package, '', $ddp);
                                                                                    */?>
                                    </div>-->
                                            <label for="Name" class="control-label col-lg-2">Date Range</label>
                                            <div class="col-lg-4">
                                                <div class="input-group input-large" data-date="<?php echo $current_date; ?>"
                                                     data-date-format="mm/dd/yyyy">
                                                    <input type="text" class="form-control datepicker" name="date_from">
                                                    <span class="input-group-addon">To</span>
                                                    <input type="text" class="form-control datepicker" name="date_to">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Room Name</label>
                                                <div class="col-md-3">
                                                    <?php
                                                    $ddp = "class='form-control'";
                                                    echo form_dropdown('room_id', $room_list, '', $ddp);
                                                    ?>
                                                </div>
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
            <?php endif; ?>

            <div class="row">
                <div class="col-lg-12">

                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Schedules
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped routine">
                                <tbody>
                                <!--                                    <tr>
                                                                        <th></th>

                                                                    </tr>-->
                                <tr>
                                    <th>Date/Time</th>
                                    <th>Course/Batch</th>
                                    <th>Topics/Subjects</th>
                                    <th>Faculty</th>
                                    <th>Executive/Stuff</th>
                                    <th>Place</th>
                                    <th>Action</th>
                                </tr>
                                <?php
                                if (!empty($schedules)) {
                                    foreach ($schedules as $i => $schedule) {
                                        ?>
                                        <tr>
                                            <td>
                                                <?php $date = strtotime($schedule->date); ?>
                                                <label
                                                    class="label label-primary"><?php echo date('d/m/Y', $date) ?></label><br>
                                                <label class="label label-warning">
                                                    <?php
                                                    echo $dayofweek = date('l', $date);
                                                    ?>
                                                </label> <br>
                                                <label class="label label-primary">
                                                    <?php echo date('h:i A', strtotime($schedule->time_from)) . ' To ' . date('h:i A', strtotime($schedule->time_to)); ?></label>
                                            </td>
                                            <td>
                                                <?php
                                                if ($schedule->course_code) {

                                                    ?>
                                                    <label
                                                        class="label label-success"><?php echo get_name_by_id('sif_course', $schedule->course_code, 'course_code', 'course_name'); ?></label>
                                                    <?php
                                                }
                                                ?>
                                                <br>
                                                <?php
                                                if ($schedule->batch_code) {

                                                    ?>
                                                    <label
                                                        class="label label-primary"><?php echo get_batch_name($schedule->course_code, $schedule->batch_code); ?></label>
                                                    <?php
                                                }
                                                ?>
                                            </td>

                                            <td>

                                                <?php
                                                if ($schedule->topic_id) {
                                                    $topics = get_topic_name($schedule->course_code, $schedule->faculty_code, $schedule->topic_id);
                                                    $topics = explode(',', $topics);
                                                    foreach ($topics as $topic) {
                                                        if ($topic) {
                                                            echo '<label class="label label-primary" data-toggle="tooltip" data-placement="top" title="Topic"> ' . $topic . ' </label>' . ' ';
                                                        }

                                                    }
                                                }
                                                if ($schedule->subject_id) {
                                                    $subs = get_subject_name($schedule->subject_id);
                                                    $subs = explode(',', $subs);
                                                    foreach ($subs as $sub) {
                                                        if ($sub) {
                                                            echo '<label class="label label-info" data-toggle="tooltip" data-placement="top" title="Subject"> ' . $sub . ' </label>' . ' ';
                                                        }

                                                    }
                                                }

                                                echo '<br>';

                                                ?>


                                            </td>
                                            <td>
                                                <label
                                                    class="label label-success"><?= get_teacher_name($schedule->teacher_id); ?></label>
                                                <label
                                                    class="label label-info"><?= get_name_by_auto_id('sif_teacher', $schedule->teacher_id, 'mobile'); ?></label>
                                            </td>
                                            <td>
                                                <label class="label label-info" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Executive"><?= get_name_by_auto_id('sif_exe_stuff', $schedule->executive_id, 'name'); ?></label>
                                                <label class="label label-primary" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Support Stuff"><?= get_name_by_auto_id('sif_exe_stuff', $schedule->support_stuff_id, 'name'); ?></label>
                                            </td>
                                            <td>
                                                <?php
                                                if ($room_list[$schedule->room_id]) {
                                                    ?>
                                                    <label
                                                        class="label label-primary"><?php echo $room_list[$schedule->room_id]; ?></label>
                                                    <?php
                                                } else {
                                                    ?>
                                                    <label></label>
                                                    <?php
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <a href="<?php echo site_url('teacher/evaluation_result/' . $schedule->id) ?>"
                                                   class="btn btn-info btn-xs m-bot5" data-toggle="tooltip"
                                                   data-placement="top" title="Evaluation"><i
                                                        class="fa fa-chain"></i></a>
                                                <?php if ($this->ion_auth->is_admin()) : ?>
                                                    <a href="<?php echo base_url('schedule/edit/' . $schedule->id); ?>"
                                                       class="btn btn-warning btn-xs" data-toggle="tooltip"
                                                       data-placement="top" title="Edit"><i
                                                            class="fa fa-pencil-square-o"></i></a>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                }
                                ?>
                                </tbody>
                            </table>
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