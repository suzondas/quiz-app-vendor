<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">
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

                if ( $form_action == "add" ) {
                    $action_url = site_url( 'unit/save' );
                    $btnval = 'SAVE';
                } elseif ( $form_action == "edit" ) {
                    $action_url = site_url( 'unit/update' );
                    $btnval = 'UPDATE';
                }
                ?>
                <form class="cmxform form-horizontal " role="form" method="post" action="<?php echo $action_url; ?>"
                      enctype="multipart/form-data">
                    <input type="hidden" name="auto_id" value="<?php echo isset( $unit->id ) ? $unit->id : ''; ?>">
                    <input type="hidden" name="course_id" value="1">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            <?= $form_action; ?> Unit Form
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="module_id" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown( 'module_id', $module_list, isset( $unit ) ? $unit->module_id : '', $ddp );
                                        ?>
                                    </div>

                                    <label for="code" class="control-label col-lg-2">Code <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="code" name="code" type="text" value="<?php echo isset( $unit ) ? $unit->code : '' ?>" required/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="name" class="control-label col-lg-2">Unit Name<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="name" name="name" type="text" value="<?php echo isset( $unit ) ? $unit->name : '' ?>" required/>
                                    </div>

                                    <label for="duration" class="control-label col-lg-2">Duration <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="duration" name="duration" type="text" value="<?php echo isset( $unit ) ? $unit->duration : '' ?>" required/>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>

                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Study Guide Details
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group ">
                                    <div class="col-md-12">
                                        <textarea name="details" id="" cols="30" rows="10"
                                                  class="summernote form-control"><?php echo isset( $unit ) ? base64_decode( $unit->details, TRUE ) : '' ?></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Study Guide Links &amp; Attachments
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form">

                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Ref links</th>
                                                <th>Action</th>
                                            </tr>
                                            <?php
                                            if ( isset( $unit ) ) : $links = json_decode( $unit->links );
                                                foreach ( $links as $i => $link ) : ?>
                                                    <tr class="each-row">
                                                        <td>
                                                            <input type="url" class="form-control" name="links[]" value="<?= $link; ?>">
                                                        </td>
                                                        <td class="text-center">
                                                            <?php if ( count( $links ) == ($i + 1) ): ?>
                                                                <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                                <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                            <?php else: ?>
                                                                <a href="#" onclick="add_more(this, event)" class="btn btn-primary remove">Add More</a>
                                                                <a href="#" onclick="remove_item(this, event)" class="btn btn-danger">Remove</a>
                                                            <?php endif; ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; else: ?>
                                                <tr class="each-row">
                                                    <td>
                                                        <input type="url" class="form-control" name="links[]" value="">
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                        <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                    </td>
                                                </tr>
                                            <?php endif; ?>
                                        </table>
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Title</th>
                                                <th>Desctiption</th>
                                                <?php if ( isset( $attachments ) && $attachments ) : ?>
                                                    <th>Old Attachment</th>
                                                <?php endif; ?>
                                                <th>New Attachment</th>
                                                <th>Action</th>
                                            </tr>
                                            <?php if ( isset( $attachments ) && $attachments ) : foreach ( $attachments as $j => $attachment ) : ?>
                                                <tr class="each-row">
                                                    <td>
                                                        <input type="text" class="form-control" name="title[]" value="<?= $attachment->title; ?>">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="desc[]" value="<?= $attachment->desc; ?>">
                                                    </td>
                                                    <td class="text-center">
                                                        <?php if ( $attachment->attachment ) : ?>
                                                            <a href="<?= base_url( $attachment->attachment ); ?>" class="btn btn-info btn-xs" download>Download Attachment</a>
                                                        <?php endif; ?>
                                                    </td>
                                                    <td>
                                                        <input type="file" name="attachment[]" value="">
                                                    </td>
                                                    <td class="text-center">
                                                        <?php if ( count( $attachments ) == ($j + 1) ): ?>
                                                            <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                            <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                        <?php else: ?>
                                                            <a href="#" onclick="add_more(this, event)" class="btn btn-primary remove">Add More</a>
                                                            <a href="#" onclick="remove_item(this, event)" class="btn btn-danger">Remove</a>
                                                        <?php endif; ?>
                                                    </td>
                                                </tr>
                                            <?php endforeach; else: ?>
                                                <tr class="each-row">
                                                    <td>
                                                        <input type="text" class="form-control" name="title[]" value="">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="desc[]" value="">
                                                    </td>
                                                    <td>
                                                        <input type="file" name="attachment[]" value="">
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                        <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                    </td>
                                                </tr>
                                            <?php endif; ?>
                                        </table>


                                        <div class="form-group">
                                            <div class="col-lg-12 text-right">
                                                <button class="btn btn-primary btn-lg" type="submit"><?php echo $btnval; ?></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>    