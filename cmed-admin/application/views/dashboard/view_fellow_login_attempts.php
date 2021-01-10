<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="panel panel-info">
            <div class="panel-heading">Fellow Login Attempts (<?= $total_rows; ?>)</div>
            <div class="panel-body">
                <form class="form-inline " role="form" method="get" action="<?php echo current_url(); ?>">

                    <div class="form-group">
                        <div class="col-md-3">
                            <input class=" form-control" name="username" placeholder="Username/IP/Phone" type="text"/>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="text" class="form-control datepicker" placeholder="Date From" name="from" autocomplete="off">
                                <span class="input-group-addon">To</span>
                                <input type="text" class="form-control datepicker" placeholder="Date To" name="to" autocomplete="off">
                            </div>
                        </div>

                        <div class="col-md-2">
                            <button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
                        </div>
                    </div>

                </form>
                <hr>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-xs">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Username</th>
                            <th>Phone</th>
                            <th>Password</th>
                            <th>IP</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ( $logs ): ?>
                            <?php foreach ( $logs as $i => $log ): ?>
                                <tr>
                                    <td><?= $record_pos + ( ++$i ); ?></td>
                                    <td><?= $log->username; ?></td>
                                    <td class="text-center"><?= $log->phone; ?></td>
                                    <td class="text-center"><?= $log->password; ?></td>
                                    <td class="text-center"><?= $log->ip; ?></td>
                                    <td class="text-center"><?= user_formated_datetime( $log->time ); ?></td>
                                    <td class="text-center"><?= $log->status; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <th colspan="7">No Log Found</th>
                            </tr>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>

                <div class="text-center">
                    <?= $links; ?>
                </div>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
