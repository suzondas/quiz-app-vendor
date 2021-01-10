<?php
$this->load->view( 'header/view_landing_header' );
?>

<!--main content start-->
<section id="" class="container">
        <!-- page start-->

        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-info">
                <div class="panel-body">
                    <?php echo $msg; ?>
                    <h4><?= $page_title; ?></h4>
                    <hr>
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <td><strong>Module</strong></td>
                            <td><?= get_name_by_auto_id('modules', $exam->exam_data->module_id); ?></td>
                            <td><strong>Unit</strong></td>
                            <td><?= get_name_by_auto_id('module_units', $exam->exam_data->unit_id); ?></td>
                        </tr>

                        <tr>
                            <td><strong>Title</strong></td>
                            <td><?= $exam->exam_data->name; ?></td>
                            <td><strong>Duration</strong></td>
                            <td>
                                <span class="label label-warning"><?= $exam->exam_data->time; ?> Min</span>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Mark</strong></td>
                            <td><span class="label label-info"><?= $exam->exam_data->total_mark; ?></span></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><strong>Rules</strong></td>
                            <td colspan="3">
                                <?= base64_decode($rules, TRUE); ?>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <a href="<?= site_url("exam/exam_start/{$exam->id}"); ?>" class="btn btn-success btn-lg">Start Now</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- page end-->


</section>
<!--main content end-->


<?php
$this->load->view( 'footer/view_landing_footer' );
?>
