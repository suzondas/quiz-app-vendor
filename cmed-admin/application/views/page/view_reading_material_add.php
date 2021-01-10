<?php
$this->load->view( 'header/view_header' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        <?= $form_action; ?> Reading Material
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">

                        <div class="text-right m-bot15">
                            <a href="<?= site_url( 'page/reading_materials' ) ?>" class="btn btn-info">Reading Materials</a>
                        </div>
                        <div class="form">
                            <?php
                            if ( validation_errors() ) {
                                echo validation_errors( '<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>' );
                            }
                            
                            if ( $this->session->flashdata( 'flashOK' ) ) {
                                echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                echo $this->session->flashdata( 'flashOK' );
                                echo "</div>";
                            }
                            if ( $this->session->flashdata( 'flashError' ) ) {
                                echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                echo $this->session->flashdata( 'flashError' );
                                echo "</div>";
                            }
                            ?>
                            <?php
                            if ( $form_action == "add" ) {
                                $action_url = site_url( "page/save_reading_material" );
                                $btnval     = 'SAVE';
                            } elseif ( $form_action == "edit" ) {
                                $action_url = site_url( "page/update_reading_material/$record->id" );
                                $btnval     = 'UPDATE';
                            }
                            
                            ?>

                            <form class="cmxform form-horizontal" enctype="multipart/form-data" id="commentForm" role="form" method="post" action="<?php echo $action_url; ?>">

                                <table class="table table-bordered">
                                    <tr>
                                        <th width="8%">Type <i class="fa fa-asterisk ipd-star"></i></th>
                                        <td>
                                            <?php
                                            $ddp = 'class="form-control" required';
                                            echo form_dropdown( 'type', $reading_material_types, set_value( 'type' ), $ddp );
                                            ?>
                                        </td>
                                        <th>Module</th>
                                        <td colspan="">
                                            <?php
                                            $ddp = 'class="form-control" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '"';
                                            echo form_dropdown( 'module', $module_list, set_value( 'module' ), $ddp );
                                            ?>
                                        </td>
                                        <th>Unit</th>
                                        <td colspan="4" width="40%">
                                            <?php
                                            $ddp = 'class="form-control" id="unit"';
                                            echo form_dropdown( 'unit', $unit_list, set_value( 'unit' ), $ddp );
                                            ?>
                                        </td>
                                    </tr>
                                    <tr class="each-row">
                                        <th>Title <i class="fa fa-asterisk ipd-star"></i></th>
                                        <td>
                                            <?= form_input( 'title[]', '', ['class' => 'form-control', 'required' => 'required'] ) ?>
                                        </td>
                                        <th>Link</th>
                                        <td>
                                            <?= form_input( ['type' => 'url', 'name' => 'link[]'], '', ['class' => 'form-control', 'placeholder' => 'http://demo.com'] ) ?>
                                        </td>
                                        <th>File</th>
                                        <td>
                                            <?= form_upload( 'file[]', '', ['class' => 'form-control'] ) ?>
                                        </td>
                                        <th>SL</th>
                                        <td width="8%">
                                            <?= form_input( 'sl[]', 1, ['class' => 'form-control'] ) ?>
                                        </td>
                                        <td>
                                            <a href="javascript:;" onclick="add_more(this, event)" class="btn btn-xs btn-primary" title="Add New Row"><i class="fa fa-plus"></i></a>
                                            <a href="javascript:;" onclick="remove_item(this, event)" class="btn btn-xs btn-danger remove" title="Delete this Row"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Status</th>
                                        <td>
                                            <?php
                                            $ddp = 'class="form-control"';
                                            echo form_dropdown( 'status', $status_array, set_value( 'status', ( isset( $record->status ) ) ? $record->status : '' ), $ddp );
                                            ?>
                                        </td>
                                        <th>Is Free ?</th>
                                        <td>
                                            <label>
                                                <input type="radio" name="is_free" value="1">
                                                Yes
                                            </label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label>
                                                <input type="radio" name="is_free" value="0" checked>
                                                No
                                            </label>
                                        </td>
                                        <td colspan="5"></td>
                                    </tr>
                                </table>

                                <button class="btn btn-success" type="submit"><?php echo $btnval; ?> READING MATERIAL</button>

                            </form>
                        </div>
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
<script src="<?php echo base_url( 'ckeditor/ckeditor.js' ); ?>"></script>
<script>
    CKEDITOR.replace('news_details');
</script>