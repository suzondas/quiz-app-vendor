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

                            <table class="table table-bordered table-striped">

                                <tbody>
                                <tr>
                                    <th>Code</th>
                                    <td><?php echo $unit->code; ?></td>
                                    <th>Name</th>
                                    <td><?php echo $unit->name; ?></td>
                                    <th>Duration</th>
                                    <td><?php echo $unit->duration; ?></td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="table table-bordered table-striped">

                                <tbody>
                                <?php if ( $unit->details ): ?>
                                    <tr>
                                        <th>Study Guide Details</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <?php echo html_entity_decode( base64_decode( $unit->details ) ); ?>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                                <?php $links = json_decode( $unit->links );
                                if ( $links ): ?>
                                    <tr>
                                        <th>Study Guide Links</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ol>
                                                <?php foreach ( $links as $link ): ?>
                                                    <li><a href="<?= $link; ?>" target="_blank"><?= $link; ?></a></li>
                                                <?php endforeach; ?>
                                            </ol>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                                </tbody>
                            </table>
                            <?php
                            if ( $attachments ): ?>

                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th colspan="3">Study Guide Attachments</th>
                                    </tr>
                                    <tr>
                                        <th>Title</th>
                                        <th>Descriptions</th>
                                        <th>Attachment</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ( $attachments as $attachment ): ?>
                                        <tr>
                                            <td><?= $attachment->title; ?></td>
                                            <td><?= $attachment->desc; ?></td>
                                            <td class="text-center">
                                                <?php if ( $attachment->attachment ) : ?>
                                                    <a href="<?= base_url($attachment->attachment); ?>" class="btn btn-info btn-xs" download>Download Attachment</a>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php endif; ?>
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