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
                        Search Wizard - Fellow List
                        <span class="tools pull-right">
                            <a class="fa fa-chevron-down" href="javascript:;"></a>
                            <a class="fa fa-cog" href="javascript:;"></a>
                            <a class="fa fa-times" href="javascript:;"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?php echo base_url() . 'admission/institute_roll_no'; ?>">
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

                                    <label for="Name" class="control-label col-lg-2">Organization</label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown('reg_type', $stu_type_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Course" class="control-label col-lg-2">Course </label>

                                    <div class="col-lg-2">
                                        <?php
                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                        $ddp = "class='form-control m-bot15' id='course_code' onchange=get_faculty_id('$url')";
                                        //                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';
                                        echo form_dropdown('course', $course_list, (isset($res) ? $res->course : ''), $ddp);
                                        ?>
                                    </div>
                                    <!--<label for="Faculty" class="control-label col-lg-2">Faculty </label>
                                    <div class="col-lg-2">
                                        <?php
                                    /*                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                                                            $ddp = "class='form-control m-bot15' id='faculty_code'  onchange=get_faculty_id('$url')";
                                                                            echo form_dropdown('faculty', ['' => 'Select'], (isset($res) ? $res->faculty : ''), $ddp);
                                                                            */?>
                                    </div>-->
                                    <label for="Status" class="control-label col-lg-2">Batch/Subject </label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="batch_code"';
                                        echo form_dropdown('batch',['' => 'Select'], (isset($res) ? $res->subject : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">BMDC No </label>
                                    <div class="col-lg-2">
                                        <input class=" form-control" id="bmdc_no" name="bmdc_no" type="text"/>
                                    </div>

                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Registration No:</label>
                                    <div class="col-lg-2">
                                        <input class=" form-control" id="reg_no" name="reg_no" type="text"/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Date Range</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-large" data-date="<?php echo $current_date; ?>"
                                             data-date-format="mm/dd/yyyy">
                                            <input type="text" class="form-control datepicker" name="from_date_time">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control datepicker" name="to_date_time">
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
        <?php
        if (!empty($rec)) {
            ?>
            <div class = "row">
                <div class = "col-lg-12">
                    <form class="cmxform form-horizontal" id="commentForm" role="form" method="post" action="<?php echo base_url() . 'admission/save_institute_roll_number'; ?>">
                    <section class = "panel panel-info">
                        <header class = "panel-heading">
                            Fellow List
                            <span class = "tools pull-right">
                                <a class = "fa fa-chevron-down" href = "javascript:;"></a>
                                <a class = "fa fa-cog" href = "javascript:;"></a>
                                <a class = "fa fa-times" href = "javascript:;"></a>
                            </span>
                        </header>
                        <div class = "panel-body">
                            <table class = "table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Registration No</th>
                                        <th>Organization</th>
                                        <th>Name</th>
                                        <th>Course</th>
                                        <th>Session</th>
                                        <th>Cell Number</th>
                                        <th>Image</th>
                                        <th>Institute Roll No</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    foreach ($rec as $key => $value) {
                                        ?>
                                        <tr>
                                            <td><?php echo $key + 1; ?></td>
                                            <td><?php echo $value->reg_no; ?></td>
                                            <td><?php echo $value->reg_type; ?></td>
                                            <td><?php echo $value->doc_name; ?></td>
                                            <td><?php echo get_name_by_id('sif_course', $value->course_code, 'course_code', 'course_name'); ?></td>

                                            <td>
                                                <?php
                                                echo $session_list[$value->session];
                                                ?>
                                            </td>
                                            <td><?php echo $value->phone; ?></td>
                                            <td>
                                                <?php
                                                if ($value->photo) {
                                                    ?>
                                                    <img src="<?php echo base_url() . $value->photo; ?>" width="auto" height="50px">
                                                    <?php
                                                } else {
                                                    ?>
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" width="auto" height="50px"/>
                                                    <?php
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <?php //echo $value->id; ?>
                                                <input type="text" class="form-control" name="ins_roll_no[]">
                                                <input type="hidden" name="ids[]" value="<?= $value->id; ?>">
                                            </td>
                                           

                                        </tr>

                                        <?php
                                    }
                                    ?>
                                    <tr>
                                        <td colspan="10" class="text-right">
                                                <input type="submit" value="SAVE" class="btn btn-success">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    </form>
                </div>
            </div>
            <!-- page end-->
            <?php
        }
        ?>
    </section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>    
