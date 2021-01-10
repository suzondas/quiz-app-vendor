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
                                            <label for="Name" class="control-label col-lg-2">Year/Month</label>
                                            <div class="col-lg-4">
                                                <div class="input-group input-large"
                                                     data-date="<?php echo $current_date; ?>"
                                                     data-date-format="mm/dd/yyyy">
                                                    <input type="text" class="form-control monthpicker" name="year_month">
<!--                                                    <span class="input-group-addon">To</span>-->
<!--                                                    <input type="text" class="form-control datepicker" name="date_to">-->
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
                        <div class="panel-body table-responsive">
                            <table class="table table-bordered table-striped routine-rooms">
                                <tbody>

                                <?php
                                if (!empty($schedules)) {
                                    echo "<tr>
                                            <th>Date</th>
                                            <th>Day</th>
                                            <th>Time</th>
                                            <th colspan='" . count($schedules[1]['rooms']) . "'>Room No</th>
                                        </tr>";
                                    foreach ($schedules as $i => $schedule) {
                                        ?>
                                        <tr>
                                            <td rowspan="3"><?= date('d-M-y', strtotime($schedule['date'])); ?></td>
                                            <td rowspan="3"><?= date('D', strtotime($schedule['date'])); ?></td>
                                            <td></td>
                                            <?php foreach ($schedule['rooms'] as $room): ?>
                                                <th>
                                                    <?= $room; ?>
                                                </th>
                                            <?php endforeach; ?>
                                        </tr>
                                        <?php
                                        foreach ($schedule['times'] as $time) : ?>
                                            <tr>
                                                <th><?= $time['time'] ?></th>
                                                <?php foreach ($time['schedule'] as $schedule): ?>
                                                    <td>
                                                        <?php
                                                        if ($schedule) {
                                                            echo get_batch_name($schedule->course_code, $schedule->batch_code);
                                                            echo " : ";
                                                            echo get_topic_name($schedule->course_code, $schedule->topic_id);
                                                        }
                                                        ?>
                                                    </td>
                                                <?php endforeach; ?>
                                            </tr>
                                        <?php endforeach;
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