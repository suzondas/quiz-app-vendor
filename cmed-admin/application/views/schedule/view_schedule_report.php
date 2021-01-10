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
                                  action="<?php echo base_url() . 'schedule/report'; ?>" target="_blank">
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
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>
