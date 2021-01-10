<?php

$this->load->view( 'header/view_student_header' );

?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <!--Search-->
        <div class="row">
            <div class="col-md-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Search
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="get" action="<?php echo current_url(); ?>">

                                <div class="form-group ">
                                    <label class="control-label col-md-1">Title</label>
                                    <div class="col-md-3">
                                        <?= form_input( 'title', set_value( 'title' ), ['class' => 'form-control', 'placeholder' => 'Reading Material Title'] ) ?>
                                    </div>

                                    <label for="module" class="control-label col-md-1">Module</label>
                                    <div class="col-md-3">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '"';
                                        echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="unit" class="control-label col-md-1">Unit </label>
                                    <div class="col-md-3">
                                        
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="unit"';
                                        echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
                                        ?>
                                    </div>

                                    <label class="control-label col-md-1">Type</label>
                                    <div class="col-md-2">
                                        <?= form_dropdown( 'type', $reading_material_types, set_value( 'type' ), 'class="form-control"' ) ?>
                                    </div>
                                    <label class="control-label col-md-2">Date Range</label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control datepicker" name="from_date_time" placeholder="Date From">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control datepicker" name="to_date_time" placeholder="Date To">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="col-md-2 col-md-offset-1">
                                        <button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!--End Search-->

        <div class="row">
            <div class="col-md-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Reading Materials <span class="badge"><?= $total_rows; ?></span>
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        
                        <?php
                        if ( $reading_material_types ) {
                            foreach ( $reading_material_types as $key => $reading_material_type ) {
                                if ( $key ) echo "<a class='btn btn-primary' href='" . site_url( "student_dashboard/reading_materials?type={$key}" ) . "'>{$reading_material_type}</a> ";
                            }
                            echo '<hr>';
                        }
                        ?>


                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Type</th>
                                <th width="30%">Title</th>
                                <th>Module</th>
                                <th>Unit</th>
                                <th>File</th>
                                <th>Link</th>
                                <th>Is Free?</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            if ( !empty( $record ) ) {
                            
                            foreach ( $record
                            
                            as $key => $value ) {
                            ?>
                            <tr>
                                <td><?= ( ++$key ) ?></td>
                                <td><?= get_name_by_id( 'reading_material_types', $value->type, 'code', 'name' ); ?></td>
                                <td><?= $value->title; ?></td>
                                <td><?= get_name_by_auto_id( 'modules', $value->module_id ); ?></td>
                                <td><?= get_name_by_auto_id( 'module_units', $value->unit_id, 'code' ); ?></td>
                                <td class="text-center">
                                    <?php if ( $value->file && is_valid_image( $value->file ) ): ?>
                                        <a href="<?= base_url( $value->file ) ?>" target="_blank">
                                            <img src="<?= base_url( $value->file ) ?>" alt="" width="80" height="80" class="img-thumbnail">
                                        </a>
                                    <?php elseif ( $value->file ): ?>
                                        <a href="<?= base_url( $value->file ) ?>" class="btn btn-info btn-xs" download><i class="fa fa-download"></i> Download</a>
                                    <?php endif; ?>
                                </td>
                                <td class="text-center">
                                    <?php if ( $value->link ): ?>
                                        <a href="<?= $value->link; ?>" title="<?= $value->link ?>" class="btn-info btn btn-xs">Visit Link</a>
                                    <?php endif; ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    if ( $value->is_free == '1' ) {
                                        echo '<span class="badge bg-success">Free</span>';
                                    } else {
                                        echo '<span class="badge bg-primary">Paid</span>';
                                    }
                                    ?>
                                </td>
                                <?php
                                }
                                } else {
                                    echo '<tr><td colspan="8" align="center">No Data Available</td></tr>';
                                }
                                ?>
                            </tbody>
                        </table>
                        
                        <?= $links; ?>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>    