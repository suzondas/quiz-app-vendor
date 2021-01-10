<?php
if ( $this->ion_auth->logged_in() ) {
    $this->load->view( 'header/view_header' );
} else {
    $this->load->view( 'header/view_student_header' );
}
$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">

                <!--<section class="panel panel-info">
                    <header class="panel-heading">
                        Current Module
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php /*if ( $current_module ) :
                            $module = $current_module['module']; */ ?>
                            <?php /*if ( $current_module['units'] ): */ ?>
                            <table class="table table-bordered table-striped">

                                <tbody>
                                <tr>
                                    <th width="10%">Unit Code</th>
                                    <th width="45%">Unit Name</th>
                                    <th width="10%">Unit Duration</th>
                                    <th width="25%">Faculty</th>
                                    <th width="15%">Action</th>
                                </tr>
                                <?php /*foreach ( $current_module['units'] as $unit ) : */ ?>
                                    <tr>
                                        <td><?php /*echo $unit->code; */ ?></td>
                                        <td><?php /*echo $unit->name; */ ?></td>
                                        <td class="text-center"><?php /*echo $unit->duration; */ ?></td>
                                        <td>
                                            <?php /*if ( $unit->teacher ) : */ ?>
                                                Name: <? /*= $unit->teacher->name; */ ?> <br>
                                                Mobile: <a href="tel:<? /*= $unit->teacher->mobile; */ ?>"><? /*= $unit->teacher->mobile; */ ?></a> <br>
                                                Email: <a href="mailto:<? /*= $unit->teacher->email; */ ?>"><? /*= $unit->teacher->email; */ ?></a> <br>
                                            <?php /*endif; */ ?>
                                        </td>
                                        <td class="text-center">
                                            <a href="<?php /*echo site_url( "student_dashboard/unit/$unit->id" ) */ ?>"
                                               class="btn btn-xs btn-success">Study Guide </a>
                                        </td>
                                    </tr>
                                <?php /*endforeach; */ ?>
                                </tbody>
                            </table>
                        <?php /*endif; */ ?>
                        <?php /*else: */ ?>
                            <h3>You Don't have any Course.</h3>
                        <?php /*endif; */ ?>
                    </div>
                </section>-->
                <?php $this->load->view( 'view_current_status', $current ) ?>
                <?php if ( $all_modules ) : ?>
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Course Details
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <?php foreach ( $all_modules as $k => $all_module ) :
                                $module = $all_module['module']; ?>
                                <?php if ( $all_module['units'] ): ?>
                                <table class="table table-bordered table-striped">

                                    <thead>
                                    <tr>
                                        <th colspan="5">Module <?= ( ++$k ); ?>: <?= $module->name; ?></th>
                                    </tr>
                                    <tr>
                                        <th width="10%">Unit Code</th>
                                        <th width="40%">Unit Name</th>
                                        <th width="12%">Unit Duration</th>
                                        <th width="28%">Faculty</th>
                                        <th width="15%">Action</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <?php foreach ( $all_module['units'] as $unit ) : ?>
                                        <tr>
                                            <td><?php echo $unit->code; ?></td>
                                            <td><?php echo $unit->name; ?></td>
                                            <td class="text-center"><?php echo $unit->duration; ?></td>
                                            <td>
                                                <?php if ( $unit->teacher ) : ?>
                                                    Name: <?= $unit->teacher->name; ?> <br>
                                                    Mobile: <a href="tel:<?= $unit->teacher->mobile; ?>"><?= $unit->teacher->mobile; ?></a> <br>
                                                    Email: <a href="mailto:<?= $unit->teacher->email; ?>"><?= $unit->teacher->email; ?></a> <br>
                                                <?php endif; ?>
                                            </td>
                                            <td class="text-center">
                                                <a href="<?php echo site_url( "student_dashboard/unit/$unit->id" ) ?>"
                                                   class="btn btn-xs btn-success">Study Guide</a>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </div>
                    </section>
                <?php endif; ?>
            </div>
        </div>


        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
