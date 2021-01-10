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
                            On Site Exam Mark Entry <span class="badge bg-info"><?= count( $doc_list ); ?></span>
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <?php echo $msg; ?>
                            <?php if ( !empty( $doc_list ) ) : ?>
                                <?php if ( $doc_list[0]->ose ): ?>
                                    <div class="alert alert-danger">
                                        <b>Note: </b> Mark already entered. If you want to change the marks then change the mark of the fellows and submit. The marks will be updated.
                                    </div>
                                <?php endif; ?>
                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th>Year</th>
                                        <td><?php echo $doc_list[0]->year; ?></td>
                                        <th>Session</th>
                                        <td><?php echo isset( $session_list[$doc_list[0]->session] ) ? $session_list[$doc_list[0]->session] : ""; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Module</th>
                                        <td colspan="3"><?php echo get_name_by_auto_id( 'modules', $doc_list[0]->module ); ?></td>
                                    </tr>
                                </table>
                                <?= form_open( 'examination/save_on_site_exam' ); ?>
                                <?= form_hidden( 'year', $this->input->post( 'year' ) ); ?>
                                <?= form_hidden( 'session', $this->input->post( 'session' ) ); ?>
                                <?= form_hidden( 'module', $this->input->post( 'module' ) ); ?>
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th rowspan="2">#</th>
                                        <th rowspan="2" width="10%">Fellow Reg</th>
                                        <th rowspan="2" width="30%">Fellow Name</th>
                                        <th class="text-center" colspan="3">Mark Entry</th>
                                    </tr>
                                    <tr>
                                        <th class="text-center">SAQ <span class="badge bg-success">Out of <?= $ec->on_site['mcq']; ?></span></th>
                                        <th class="text-center">Practical <span class="badge bg-success">Out of <?= $ec->on_site['essay']; ?></span></th>
                                        <th class="text-center">Oral <span class="badge bg-success">Out of <?= $ec->on_site['oral']; ?></span></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ( $doc_list as $key => $value ) : ?>
                                        <?php echo $value->ose ? form_hidden( "ose_id[{$value->doc_id}]", $value->ose->id ) : ""; ?>
                                        <tr>
                                            <td><?php echo $key + 1; ?></td>
                                            <td><?= $value->reg_no; ?></td>
                                            <td><?php echo get_name_by_auto_id( 'sif_admission', $value->doc_id, 'doc_name' ); ?></td>
                                            <td><input type="number" min="0" class="form-control number-only" name="mark[<?= $value->doc_id; ?>][mcq]" value="<?= $value->ose ? $value->ose->mcq_obtained : ""; ?>"></td>
                                            <td><input type="number" min="0" class="form-control number-only" name="mark[<?= $value->doc_id; ?>][essay]" value="<?= $value->ose ? $value->ose->essay_obtained : ""; ?>"></td>
                                            <td><input type="number" min="0" class="form-control number-only" name="mark[<?= $value->doc_id; ?>][oral]" value="<?= $value->ose ? $value->ose->oral_obtained : ""; ?>"></td>
                                        </tr>
                                    <?php endforeach; ?>
                                    <tfoot>
                                    <tr>
                                        <td colspan="6" class="text-right">
                                            <button class="btn btn-lg btn-success">Submit</button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                    </tbody>
                                </table>
                                <?= form_close(); ?>
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
                                            $ddp = 'class="form-control m-bot15" required'; // onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '"
                                            echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
                                            ?>
                                        </div>
                                        <!--<label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i> </label>
                                        <div class="col-lg-4">

                                            <?php
                                        /*                                            $ddp = 'class="form-control m-bot15" id="unit" required';
                                                                                    echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
                                                                                    */ ?>
                                        </div>-->
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
