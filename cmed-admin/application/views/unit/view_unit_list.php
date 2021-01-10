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

                <div class="panel panel-primary">
                    <div class="panel-heading">Unit List</div>
                    <div class="panel-body">
                        <?php
                        echo $msg;
                        ?>

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Module Name</th>
                                <th>Unit Code</th>
                                <th>Unit Name</th>
                                <th>Links</th>
                                <th>Duration</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if ( $rec ) : foreach ( $rec as $i => $row ) : ?>
                                <tr>
                                    <td><?php echo($i + 1); ?></td>
                                    <td width="30%"><?php echo get_name_by_auto_id( 'modules', $row->module_id ); ?></td>
                                    <td><?php echo $row->code; ?></td>
                                    <td width="30%"><?php echo $row->name; ?></td>
                                    <td><?php echo implode( ', ', json_decode( $row->links ) ); ?></td>
                                    <td><?php echo $row->duration; ?></td>
                                    <td class="text-center">
                                        <?php if ( $this->ion_auth->is_admin() ): ?>
                                            <a href="<?php echo site_url( "unit/edit/$row->id" ) ?>" class="btn btn-xs btn-warning">Edit</a>
                                            <a href="<?php echo site_url( "examination/add_exam/$row->id" ) ?>" class="btn btn-xs btn-info">Add Exam </a>
                                        <?php endif; ?>
                                        <a href="<?php echo site_url( "unit/details/$row->id" ) ?>" class="btn btn-xs btn-success">Study Guide </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
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
