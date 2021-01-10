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
                            Result List <span class="badge bg-info"><?= $total_rows; ?></span>
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <?php if ( !empty( $rec ) ) : ?>
                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th width="15%">Year</th>
                                        <td width="35%"><?= $rec[0]->year; ?></td>
                                        <th width="15%">Session</th>
                                        <td width="35%"><?= isset( $session_list[$rec[0]->session] ) ? $session_list[$rec[0]->session] : ""; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Module</th>
                                        <td><?php echo get_name_by_auto_id( 'modules', $rec[0]->module_id ); ?></td>
                                        <th>Unit</th>
                                        <td><?php echo get_name_by_auto_id( 'module_units', $rec[0]->unit_id ); ?></td>
                                    </tr>
                                </table>
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Fellow Name</th>
                                        <th>Assignment Mark</th>
                                        <th>MCQ Mark</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ( $rec as $key => $value ) {
                                        ?>
                                        <tr>
                                            <td><?php echo $key + 1; ?></td>
                                            <td><?php echo get_name_by_auto_id( 'sif_admission', $value->doc_id, 'doc_name' ); ?></td>
                                            <td class="text-right"><?php echo $value->assignment ? number_format( $value->assignment->mark_obtained, 2 ) : ''; ?></td>
                                            <td class="text-right"><?php echo $value->final_mark ? number_format( $value->final_mark, 2 ) : NULL; ?></td>

                                            <td class="text-center">
                                                <?php
                                                $class = 'default';
                                                if ( $value->status == 1 && $value->final_status == 1 ) {
                                                    echo " <label class=\"label label-success\">PASSED</label>";
                                                } elseif ( $value->status == 1 && $value->final_status == 0 ) {
                                                    echo " <label class=\"label label-danger\">FAILED</label>";
                                                } elseif ( $value->status == 9 ) {
                                                    echo " <label class=\"label label-warning\">Not Attented</label>";
                                                } ?>

                                            </td>
                                            <td class="text-center">
                                                <a href="<?php echo base_url( "result/mcq_details/$value->id" ); ?>" class="btn btn-info btn-xs" title="MCQ Details" data-toggle="tooltip" data-placement="top">
                                                    MCQ Details
                                                </a>
                                                <a href="<?php echo base_url( "result/assignment_details/$value->doc_id/$value->module_id/$value->unit_id" ); ?>" class="btn btn-warning btn-xs" title="MCQ Details" data-toggle="tooltip" data-placement="top">
                                                    Assignment Details
                                                </a>
                                            </td>
                                        </tr>

                                        <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            <?php else: ?>
                                <h4 class="text-center text-warning">Nothing Found..</h4>
                            <?php endif; ?>
                        </div>
                    </section>
                </div>
            </div>
        <?php else: ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Search Wizard
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
                                        <div class="col-lg-4">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown( 'year', $n_year, set_value( 'year', date( 'Y' ) ), $ddp )
                                            ?>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-4">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown( 'session', $session_list, set_value( 'session' ), $ddp );
                                            ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="module" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-4">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '" required';
                                            echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
                                            ?>
                                        </div>
                                        <label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i> </label>
                                        <div class="col-lg-4">

                                            <?php
                                            $ddp = 'class="form-control m-bot15" id="unit" required';
                                            echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
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
        <?php endif; ?>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
