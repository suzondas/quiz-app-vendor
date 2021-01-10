<?php
$this->load->view('header/view_student_header');
$current_date = date('m/d/Y');
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-8">
                <div class="event-calendar clearfix">
                    <div class="col-lg-7 calendar-block">
                        <div class="cal1 ">
                        </div>
                    </div>
                    <div class="col-lg-5 event-list-block">
                        <div class="cal-day">
<!--                            <span>Today</span>-->
                            Notice
                        </div>
                        <ul class="event-list">
                            <?php
                            if ($notices) {
                                foreach ($notices as $notice) {
                                    ?>
                                    <li class="clearfix">
                                        <a href="<?= site_url('student_dashboard/notice_details/'.$notice->id); ?>" class="todo-title">
                                            <?= $notice->subject; ?>
                                        </a>
                                    </li>
                                    <?php
                                }
                            }
                            ?>
                        </ul>
<!--                        <input type="text" class="form-control evnt-input" placeholder="NOTES">-->
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="profile-nav alt">
                    <section class="panel">
                        <div class="user-heading alt clock-row terques-bg">
                            <h1><?= date('F d'); ?></h1>
                            <p class="text-left"><?= date('Y, D'); ?></p>
                            <!--                            <p class="text-left">7:53 PM</p>-->
                        </div>
                        <ul id="clock">
                            <li id="sec"></li>
                            <li id="hour"></li>
                            <li id="min"></li>
                        </ul>

                        <ul class="clock-category">
                            <li>
                                <a href="#" class="active">
                                    <i class="ico-clock2"></i>
                                    <span>Clock</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="ico-alarm2 "></i>
                                    <span>Alarm</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="ico-stopwatch"></i>
                                    <span>Stop watch</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class=" ico-clock2 "></i>
                                    <span>Timer</span>
                                </a>
                            </li>
                        </ul>

                    </section>

                </div>

                <!--widget weather start-->
                <section class="weather-widget clearfix">
                    <div class="pull-left weather-icon">
                        <canvas id="icon1" width="60" height="60"></canvas>
                    </div>
                    <div>
                        <ul class="weather-info">
                            <li class="weather-city">Dhaka, Bangladesh <i class="ico-location"></i></li>
                            <li class="weather-cent"><span>28</span></li>
                            <li class="weather-status">Sunny Day</li>
                        </ul>
                    </div>
                </section>
                <!--widget weather end-->
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>
