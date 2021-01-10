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
                            Search Wizard - Faculty Payment
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                      action="<?php echo base_url('payment/teacher'); ?>">
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Faculty ID</label>
                                        <div class="col-lg-3">
                                            <input type="text" name="teacher_id" class="form-control">
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
                                    <h1><?= $rec->tec_name; ?></h1>
                                    <p>Reg No.: <span class="badge label-success r-activity"><?= $rec->teacher_id; ?></span>
                                    </p>
                                </div>

                                <table class="table table-bordered m-bot15 text-center">
                                    <tr>
                                        <th colspan="5">Payments</th>
                                    </tr>
                                    <tr>
                                        <th>Date</th>
                                        <th>Pay For</th>
                                        <th>Note</th>
                                        <th>Auth By</th>
                                        <th>Amount</th>
                                    </tr>

                                    <?php
                                    $tot_paid = 0;
                                    if (isset($payments) && !empty($payments)) :
                                        foreach ($payments as $payment) : ?>
                                            <tr>
                                                <td><?= date('d M, Y', strtotime($payment->date)); ?></td>
                                                <td><?= $teacher_pay_type[$payment->pay_for]; ?></td>
                                                <td><?= $payment->note; ?></td>
                                                <td><?= $payment->auth_by; ?></td>
                                                <td class="text-success"><?= number_format($payment->amount); ?> TK</td>
                                            </tr>
                                            <?php
                                            $tot_paid += $payment->amount;
                                        endforeach;
                                    endif;
                                    ?>
                                    <tr>
                                        <th colspan="4" class="text-right">Total =</th>
                                        <td class="text-danger"><?= number_format($tot_paid); ?> TK</td>
                                    </tr>

                                </table>
                                <div class="clearfix"></div>

                                <hr>
                                <div class="col-md-12">
                                    <h3>Payment</h3>
                                </div>
                                <div class="col-md-12">
                                    <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url() . 'payment/save_teacher_payment'; ?>" enctype="multipart/form-data">
                                        <?php
                                            echo form_hidden('teacher_id', $rec->teacher_id);
                                        ?>
                                        <div class="form">
                                            <div class="form-group">
                                                <label for="Name" class="control-label col-md-1">Date <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd"
                                                         data-date="<?php echo $current_date; ?>"
                                                         class="input-append date dpYears">
                                                        <input type="text" name="date" readonly=""
                                                               value="<?php echo $current_date; ?>" size="16"
                                                               class="form-control" required>
                                                        <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i
                                                            class="fa fa-calendar"></i></button>
                                                </span>
                                                    </div>
                                                </div>
                                                <label class="control-label col-md-2">Voucher No<i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <input type="text" name="VRNO" class="form-control" value="">
                                                </div>
                                                <label for="Name" class="control-label col-md-2">Auth By <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <input type="text" name="auth_by" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1">Pay For<i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <?= form_dropdown('pay_for', $teacher_pay_type, '', 'class="form-control"'); ?>
                                                </div>
                                                <label for="Name" class="control-label col-md-2">Amount <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-2 m-bot15">
                                                    <input type="number" name="amount" class="form-control" required>
                                                </div>
                                                <label class="control-label col-md-1">Note <i
                                                        class="fa fa-asterisk ipd-star"></i></label>
                                                <div class="col-md-3 m-bot15">
                                                    <input type="text" name="note" class="form-control" required>
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
