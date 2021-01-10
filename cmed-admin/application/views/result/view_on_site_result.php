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
                            On Site Exam Result
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
                                    <th rowspan="2">#</th>
                                    <th rowspan="2" width="20%">Fellow Name</th>
                                    <th rowspan="2">Module</th>
                                    <th class="text-center" colspan="4">Marks</th>
                                    <th rowspan="2">Status</th>
                                </tr>
                                <tr>
                                    <th>SAQ <span class="badge bg-warning">Out of <?= $ec->on_site['mcq']; ?></span></th>
                                    <th>Practical <span class="badge bg-warning">Out of <?= $ec->on_site['essay']; ?></span></th>
                                    <th>Oral <span class="badge bg-warning">Out of <?= $ec->on_site['oral']; ?></span></th>
                                    <th>Total <span class="badge bg-warning">Out of <?= ($ec->on_site['mcq'] + $ec->on_site['essay'] + $ec->on_site['oral']); ?></span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                if ( !empty( $rec ) ) {
                                    $doc_id = 0;
                                    $i = 1;
                                    foreach ( $rec as $item ) {
                                        foreach ( $item as $key => $value ) {
                                            ?>
                                            <tr>
                                                <?php if ( $doc_id != $value->doc_id ): ?>
                                                    <td rowspan="<?= count( $item ); ?>"><?php echo $i++; ?></td>
                                                    <td rowspan="<?= count( $item ); ?>"><?php echo get_name_by_auto_id( 'sif_admission', $value->doc_id, 'doc_name' ); ?></td>
                                                <?php endif; ?>
                                                <td><?php echo get_name_by_auto_id( 'modules', $value->module_id ); ?></td>
                                                <td class="text-center"><?php echo $value->mcq_obtained ? number_format( $value->mcq_obtained, 2 ) : NULL; ?></td>
                                                <td class="text-center"><?php echo $value->essay_obtained ? number_format( $value->essay_obtained, 2 ) : NULL; ?></td>
                                                <td class="text-center"><?php echo $value->oral_obtained ? number_format( $value->oral_obtained, 2 ) : NULL; ?></td>
                                                <?php $total = $value->mcq_obtained + $value->essay_obtained + $value->oral_obtained; ?>
                                                <td class="text-center"><?php echo ($total) ? number_format( $total, 2 ) : NULL; ?></td>
                                                <td class="text-center">
                                                    <?php
                                                    $class = 'default';
                                                    $title = "Not Attented";
                                                    if ( $value->status == 1 ) {
                                                        $class = "success";
                                                        $title = "PASSED";
                                                    } elseif ( $value->status == 0 ) {
                                                        $class = "danger";
                                                        $title = "FAILED";
                                                    } else {
                                                        $class = "warning";
                                                        $title = "Not Attented";
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
                            Search Wizard :: ON SITE EXAM RESULT
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
                                        <label for="module" class="control-label col-lg-1">Module</label>
                                        <div class="col-lg-3">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"'; // onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '"
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
