<?php
$this->load->view('header/view_header');
$current_date = date('Y-m-d');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Search Wizard - <?= $module_name; ?>
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                      action="<?php echo base_url() . 'payment/search'; ?>">
                                    <input type="hidden" name="type" value="P">
                                    <!--<div class="form-group ">
                                        <label for="Faculty" class="control-label col-lg-2">Year</label>
                                        <div class="col-lg-2">
                                            <?php
                                    /*                                            $ddp = "class='form-control m-bot15' id='year'";
                                                                                echo form_dropdown('year', $current_fut_year, (isset($res) ? $res->year : ''), $ddp);
                                                                                */ ?>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Session</label>
                                        <div class="col-lg-2">
                                            <?php
                                    /*                                            $ddp = 'class="form-control m-bot15"';
                                                                                echo form_dropdown('session', $session_list, '', $ddp);
                                                                                */ ?>
                                        </div>
                                        <label for="Course" class="control-label col-lg-2">Course </label>

                                        <div class="col-lg-2">
                                            <?php
                                    /*                                            $url = base_url('setting/ajax_get_faculty_by_course');
                                                                                $ddp = "class='form-control m-bot15' id='course_id' onchange=get_faculty_by_course('$url')";
                                                                                echo form_dropdown('course_code', $course_list, (isset($res) ? $res->course : ''), $ddp);
                                                                                */ ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Faculty" class="control-label col-lg-2">Faculty </label>
                                        <div class="col-lg-2">
                                            <?php
                                    /*                                            $url = base_url('setting/ajax_get_course_by_faculty_id');
                                                                                $ddp = "class='form-control m-bot15' id='faculty_id'  onchange=get_faculty_id('$url')";
                                                                                echo form_dropdown('faculty_code', $faculty_list, (isset($res) ? $res->faculty : ''), $ddp);
                                                                                */ ?>
                                        </div>
                                        <label for="Status" class="control-label col-lg-2">Batch/Subject </label>
                                        <div class="col-lg-2">
                                            <?php
                                    /*                                            $ddp = 'class="form-control m-bot15" id="batch_id"';
                                                                                echo form_dropdown('batch_code', $batch_list, (isset($res) ? $res->subject : ''), $ddp);
                                                                                */ ?>
                                        </div>

                                    </div>-->
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Reg No.</label>
                                        <div class="col-lg-3">
                                            <input type="text" name="reg_no" class="form-control">
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">BMDC No.</label>
                                        <div class="col-lg-3">
                                            <input type="text" name="bmdc_no" class="form-control">
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
            } ?>
            <?php if (isset($rec)) : ?>
                <?php //var_dump($payments);?>
                <div class="row">
                    <div class="col-lg-12">
                        <aside class="profile-nav alt">
                            <section class="panel">
                                <div class="user-heading alt gray-bg">
                                    <a href="#">
                                        <?php if ($rec->photo) {
                                            echo '<img src="' . base_url($rec->photo) . '" alt="">';
                                        } else {
                                            echo '<img src="' . base_url("images/no-image.gif") . '" alt="">';
                                        } ?>

                                    </a>
                                    <h1><?= $rec->doc_name; ?></h1>
                                    <p>Reg No.: <span class="badge label-success r-activity"><?= $rec->reg_no; ?></span>
                                    </p>
                                </div>

                                <table class="table table-bordered m-bot15 text-center">
                                    <tr>
                                        <th>Date</th>
                                        <th>Fee Amount</th>
                                        <th>Discount Amount</th>
                                        <th>Final Amount</th>
                                        <th>Received By</th>
                                    </tr>
                                    <tr>
                                        <td><?= date('d M, Y', strtotime($rec->created_at)); ?></td>
                                        <td><?= number_format($rec->fee_amount); ?> TK</td>
                                        <td><?= $rec->discount_amont; ?> TK</td>
                                        <td><?= number_format($rec->final_amount); ?> TK</td>
                                        <td><?= $rec->dis_auth_by; ?></td>
                                    </tr>
                                    <tr>
                                        <th colspan="5">Payments</th>
                                    </tr>

                                    <tr>
                                        <th>Date</th>
                                        <th>Money Receipt No</th>
                                        <th>VAT/TAX</th>
                                        <th>Final Amount</th>
                                        <th>Received By</th>
                                    </tr>

                                    <?php
                                    $tot_paid = 0;
                                    if ($payments) :
                                        foreach ($payments as $payment) : ?>
                                            <tr>
                                                <td><?= date('d M, Y', strtotime($payment->date)); ?></td>
                                                <td><?= $payment->mr_no; ?></td>
                                                <td><?php if ($payment->vat_tax == 'Y') {
                                                        echo 'Yes';
                                                    } elseif ($payment->vat_tax == 'N') {
                                                        echo 'No';
                                                    }
                                                    {

                                                    }; ?></td>
                                                <td class="text-success"><?= number_format($payment->amount); ?> TK</td>
                                                <td><?= $payment->auth_by; ?></td>
                                            </tr>
                                            <?php
                                            $tot_paid += $payment->amount;
                                        endforeach;
                                    endif;
                                    ?>
                                    <tr>
                                        <th colspan="3" class="text-right">Total Due</th>
                                        <td class="text-danger"><?= number_format($rec->final_amount - $tot_paid); ?>
                                            TK
                                        </td>
                                        <td></td>
                                    </tr>

                                </table>
                                <div class="clearfix"></div>

                                <hr>
                                <div class="col-md-12">
                                    <h3>Payment</h3>
                                    <hr>
                                </div>
                                <div class="col-md-12">
                                    <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                          action="<?php echo base_url() . 'payment/save'; ?>"
                                          enctype="multipart/form-data">
                                        <?php
                                        echo form_hidden('doc_id', $rec->id);
                                        echo form_hidden('doc_reg_no', $rec->reg_no);
                                        ?>
                                        <div class="form">
                                            <div class="form-group">
                                                <label for="Name" class="control-label col-md-2">Date <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd"
                                                         data-date="<?php echo $current_date; ?>"
                                                         class="input-append date dpYears">
                                                        <input type="text" name="date" readonly=""
                                                               value="<?php echo $current_date; ?>" size="16"
                                                               class="form-control">
                                                        <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i
                                                            class="fa fa-calendar"></i></button>
                                                </span>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-md-2">Amount <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <input type="number" name="amount" class="form-control">
                                                </div>
                                                <label for="Name" class="control-label col-md-2">Received By </label>
                                                <div class="col-md-2 m-bot15">
                                                    <input type="text" name="auth_by" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Name" class="control-label col-md-2">Money Receipt
                                                    No</label>
                                                <div class="col-md-3 m-bot15">
                                                    <input type="text" name="mr_no" class="form-control">
                                                </div>
                                                <label for="Name" class="control-label col-md-1">VAT/TAX</label>
                                                <div class="col-md-2 m-bot15">
                                                    <label class="radio-inline col-md-3">
                                                        <input type="radio" name="vat_tax" value="Y"> Yes
                                                    </label>
                                                    <label class="radio-inline col-md-3">
                                                        <input type="radio" name="vat_tax" value="N" checked> No
                                                    </label>
                                                </div>

                                                <label for="Name" class="control-label col-md-1">Comment</label>
                                                <div class="col-md-3 m-bot15">
                                                    <input type="text" name="comment" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">

                                                <div class="col-lg-offset-1 col-lg-2 m-bot15">
                                                    <button class="btn btn-primary" type="submit">Pay Now</button>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="clearfix"></div>
                            </section>
                        </aside>
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