<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <?php if ( $this->input->post() ): ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            MODULE RESULT
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <th>Year</th>
                                    <td><?= $input['year']; ?></td>
                                    <th>Session</th>
                                    <td><?= $session_list[$input['session']]; ?></td>
                                    <th>Module</th>
                                    <td><?= $module_list[$input['module']]; ?></td>
                                </tr>
                            </table>
                            <table class="table table-bordered">
                                <thead>

                                <?php
                                $mcq = ($ec->mcq_mark * $ec->mcq_ques_count * $unit_count);
                                $assessment = ($ec->assesment_total * $unit_count);
                                $online_total = $mcq + $assessment;
                                $saq = $ec->on_site['mcq'];
                                $practical = $ec->on_site['essay'];
                                $oral = $ec->on_site['oral'];
                                $onsite_total = $saq + $practical + $oral;
                                $total = $online_total + $onsite_total;
                                ?>

                                <tr class="active">
                                    <th rowspan="2">#</th>
                                    <th rowspan="2" width="20%">Fellow Name</th>
                                    <th class="text-center" colspan="3">Online Marks</th>
                                    <th class="text-center" colspan="4">On Site Marks</th>
                                    <th rowspan="2" class="text-center success">Total <span class="badge bg-warning">Out of <?= $total; ?></span></th>
                                    <!--                                    <th rowspan="2">Percent (%)</th>-->
                                    <th rowspan="2">Status</th>
                                </tr>
                                <tr class="active">
                                    <th class="text-center">MCQ <span class="badge bg-warning">Out of <?= $mcq; ?></span></th>
                                    <th class="text-center">Assessment <span class="badge bg-warning">Out of <?= $assessment; ?></span></th>
                                    <th class="warning text-center">Total <span class="badge bg-warning">Out of <?= $online_total; ?></span></th>
                                    <th class="text-center">SAQ <span class="badge bg-warning">Out of <?= $saq; ?></span></th>
                                    <th class="text-center">Practical <span class="badge bg-warning">Out of <?= $practical; ?></span></th>
                                    <th class="text-center">Oral <span class="badge bg-warning">Out of <?= $oral; ?></span></th>
                                    <th class="warning text-center">Total <span class="badge bg-warning">Out of <?= $onsite_total; ?></span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                if ( !empty( $rec ) ) {
                                    $doc_id = 0;
                                    $i = 1;
                                    foreach ( $rec as $item ) {
                                        foreach ( $item as $key => $value ) {
//                                            print_r( $value );
                                            ?>
                                            <tr>
                                                <?php if ( $doc_id != $value->doc_id ): ?>
                                                    <td rowspan="<?= count( $item ); ?>"><?php echo $i++; ?></td>
                                                    <td rowspan="<?= count( $item ); ?>"><?php echo get_name_by_auto_id( 'sif_admission', $value->doc_id, 'doc_name' ); ?></td>
                                                <?php endif; ?>
                                                <!--Online Marks-->
                                                <td class="text-center"><?php echo $value->mcq_correct_mark ? number_format( $value->mcq_correct_mark, 2 ) : NULL; ?></td>
                                                <td class="text-center"><?php echo $value->assignment_mark ? number_format( $value->assignment_mark, 2 ) : NULL; ?></td>
                                                <?php $row_online_total = $value->mcq_correct_mark + $value->assignment_mark; ?>
                                                <td class="text-center warning"><?php echo $row_online_total ? number_format( $row_online_total, 2 ) : NULL; ?></td>
                                                <!--On Site Marks-->
                                                <td class="text-center"><?php echo $value->saq_mark ? number_format( $value->saq_mark, 2 ) : NULL; ?></td>
                                                <td class="text-center"><?php echo $value->essay_mark ? number_format( $value->essay_mark, 2 ) : NULL; ?></td>
                                                <td class="text-center"><?php echo $value->oral_mark ? number_format( $value->oral_mark, 2 ) : NULL; ?></td>
                                                <?php $row_onsite_total = $value->saq_mark + $value->essay_mark + $value->oral_mark; ?>
                                                <td class="text-center warning"><?php echo ($row_onsite_total) ? number_format( $row_onsite_total, 2 ) : NULL; ?></td>

                                                <?php
                                                $row_total = $row_online_total + $row_onsite_total;
                                                $percent = number_format( $row_total / $total * 100, 2 );
                                                ?>
                                                <td class="text-center success">
                                                    <?php echo ($row_total) ? number_format( $row_total, 2 ) : NULL; ?>
                                                    <span class="badge bg-info"><?= "$percent%"; ?></span>
                                                </td>


                                                <td class="text-center">
                                                    <?php
                                                    $class = 'default';
                                                    $title = "Not Attented";
                                                    if ( $percent >= $ec->pass ) {
                                                        $class = "success";
                                                        $title = "PASSED";
                                                    } else {
                                                        $class = "danger";
                                                        $title = "FAILED";
                                                    } ?>
                                                    <label class="label label-<?= $class ?>"><?= $title; ?></label>
                                                </td>
                                            </tr>

                                            <?php
                                            $doc_id = $value->doc_id;
                                        }
                                    }
                                } else {
                                    echo '<tr><td colspan="10" align="center">No Data Available</td></tr>';
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        <?php else: ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Search Wizard :: MODULE RESULT
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <?php echo $msg; ?>
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                      action="<?php echo current_url(); ?>">

                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown( 'year', $n_year, set_value( 'year', date( 'Y' ) ), $ddp )
                                            ?>
                                        </div>
                                        <label for="Name" class="control-label col-lg-1">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-2">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown( 'session', $session_list, set_value( 'session' ), $ddp );
                                            ?>
                                        </div>
                                        <label for="module" class="control-label col-lg-1">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-3">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required'; // onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '"
                                            echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
                                            ?>
                                        </div>
                                        <!--                                        <label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i> </label>-->
                                        <!--                                        <div class="col-lg-4">-->
                                        <!---->
                                        <!--                                            --><?php
                                        //                                            $ddp = 'class="form-control m-bot15" id="unit" required';
                                        //                                            echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
                                        //                                            ?>
                                        <!--                                        </div>-->
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
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>    
