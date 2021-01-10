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
                    <header class="panel-heading">
                        Search Wizard - Evaluation List
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?= current_url(); ?>">
                                <div class="form-group ">
                                    <label for="Status" class="control-label col-lg-3 col-sm-3">Faculty Name</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown('teacher_id', $teacher_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>
                                <!--                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">User</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                //$ddp = 'class="form-control m-bot15"';
                                //echo form_dropdown('user_name',$eval_doctor,'', $ddp);
                                ?>
                                        </div>
                                    </div>-->
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-3">Date Range</label>
                                    <div class="col-lg-6">
                                        <div class="input-group input-large" data-date="<?php //echo $current_date; ?>"
                                             data-date-format="mm/dd/yyyy">
                                            <input type="text" class="form-control datepicker" name="date_from">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control datepicker" name="date_to">
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

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Facultys Payments
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
                                <th>Faculty Name</th>
                                <th>Faculty ID</th>
                                <th>Mobile</th>
                                <th>Payments</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            if (!empty($rec)) {
                                foreach ($rec as $key => $value) {
                                    ?>
                                    <tr>
                                        <td><?= ($key + 1) ?></td>
                                        <td><?php echo $value->tec_name; ?></td>
                                        <td><?php echo $value->teacher_id; ?></td>
                                        <td><?php echo $value->mobile; ?></td>
                                        <td>
                                            <table>
                                                <?php if ($value->payments) : foreach ($value->payments as $payment) : ?>
                                                    <tr>
                                                        <td><?= $payment->date ? date('d M, Y', strtotime($payment->date)) : ''; ?></td>
                                                        <td class="text-right"><?= $payment->amount ? number_format($payment->amount, 2) : ''; ?></td>
                                                        <td><?= $payment->pay_for ? $teacher_pay_type[$payment->pay_for] : ''; ?></td>
                                                    </tr>
                                                <?php endforeach;
                                                else : ?>
                                                    <tr><td>No Payment Found</td></tr>
                                                <?php endif; ?>
                                            </table>
                                        </td>
                                        <!--                                        <td>-->
                                        <?php //echo "+88" . $value->phone; ?><!--</td>-->
                                        <!--                                        <td class="text-right">-->
                                        <?php //echo $value->fee_amount ? number_format($value->fee_amount, 2) : ''; ?><!--</td>-->
                                        <!--                                        <td class="text-right">-->
                                        <?php //echo $value->discount_amont ? number_format($value->discount_amont, 2) : ''; ?><!--</td>-->
                                        <!--                                        <td class="text-right">-->
                                        <?php //echo $value->final_amount ? number_format($value->final_amount, 2) : ''; ?><!--</td>-->
                                        <!--                                        <td class="text-right text-success">-->
                                        <?php //echo $value->paid ? number_format($value->paid, 2) : ''; ?><!--</td>-->
                                        <!--                                        <td class="text-right text-danger">-->
                                        <?php //echo $value->due ? number_format($value->due, 2) : ''; ?><!--</td>-->
                                        <!--                                        <td>-->
                                        <?//= $value->last_pay_date ? date('d M, Y', strtotime($value->last_pay_date)) : ''; ?><!--</td>-->
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