<?php
$this->load->view('header/view_header');
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
                        Search Wizard - Received Payments
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
                                        $url = base_url('setting/ajax_get_faculty_by_course');
                                        $ddp = "class='form-control m-bot15' id='course_code' onchange=get_faculty_by_course('$url')";
                                        //                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';
                                        echo form_dropdown('course', $course_list, (isset($res) ? $res->course : ''), $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Faculty" class="control-label col-lg-2">Faculty </label>
                                    <div class="col-lg-2">
                                        <?php
                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                        $ddp = "class='form-control m-bot15' id='faculty_code'  onchange=get_faculty_id('$url')";
                                        echo form_dropdown('faculty', ['' => 'Select'], (isset($res) ? $res->faculty : ''), $ddp);
                                        ?>
                                    </div>
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
                                    <!--                                        <label for="Name" class="control-label col-lg-2">Fathers Name</label>
                                                                            <div class="col-lg-2">
                                                                                <input class=" form-control" id="f_name" name="f_name" type="text"/>
                                                                            </div>
                                                                            <label for="Name" class="control-label col-lg-2">Mother Name</label>
                                                                            <div class="col-lg-2">
                                                                                <input class=" form-control" id="m_name" name="m_name" type="text"/>
                                                                            </div>-->
                                    <label for="Name" class="control-label col-lg-2">Registration No:</label>
                                    <div class="col-lg-2">
                                        <input class=" form-control" id="reg_no" name="reg_no" type="text"/>
                                    </div>

                                    <label for="Name" class="control-label col-lg-2">Organization</label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown('reg_type', $stu_type_list, '', $ddp);
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

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Received Payments
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Doc Name</th>
                                <th>Reg. No</th>
                                <th>BMDC No</th>
                                <th>Phone</th>
                                <th>Fee Amount</th>
                                <th>Discount</th>
                                <th>Final Amount</th>
                                <th>Total Paid</th>
                                <th>Due</th>
                                <th>Last Payment Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            if (!empty($rec)) {
                                foreach ($rec as $key => $value) {
                                    ?>
                                    <tr>
                                        <td><?= ($key + 1) ?></td>
                                        <td><?php echo $value->doc_name; ?></td>
                                        <td><?php echo $value->reg_no; ?></td>
                                        <td><?php echo $value->bmdc_no; ?></td>
                                        <td><?php echo "+88" . $value->phone; ?></td>
                                        <td class="text-right"><?php echo $value->fee_amount ? number_format($value->fee_amount, 2) : ''; ?></td>
                                        <td class="text-right"><?php echo $value->discount_amont ? number_format($value->discount_amont, 2) : ''; ?></td>
                                        <td class="text-right"><?php echo $value->final_amount ? number_format($value->final_amount, 2) : ''; ?></td>
                                        <td class="text-right text-success"><?php echo $value->paid ? number_format($value->paid, 2) : ''; ?></td>
                                        <td class="text-right text-danger"><?php echo $value->due ? number_format($value->due, 2) : ''; ?></td>
                                        <td><?= $value->last_pay_date ? date('d M, Y', strtotime($value->last_pay_date)) : ''; ?></td>
                                    </tr>
                                    <?php
                                }
                            } else {
                                echo '<tr><td colspan="11" align="center">No Data Available</td></tr>';
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