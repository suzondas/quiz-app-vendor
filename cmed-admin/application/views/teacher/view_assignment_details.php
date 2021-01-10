<?php
if ($this->ion_auth->logged_in()) {
    $this->load->view('header/view_header');
} else {
    $this->load->view('header/view_student_header');
}
$current_date = date('m/d/Y');
?>

<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Assignment Reply Details
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?= $msg; ?>
                        <table class="table table-bordered table-striped">
                            <tbody>
                            <tr>
                                <th width="10%">Date</th>
                                <td width="40%"><label
                                            class="label label-warning"><?php echo date('d-m-y, h:i a', strtotime($reply->sent)); ?></label>
                                </td>
                                <th width="10%">Attachment</th>
                                <td width="40%">
                                    <?php if ($reply->attachment) : ?>
                                        <a class="btn btn-xs btn-white"
                                           href="<?= base_url($reply->attachment) ?>"
                                           target="_blank">Download Attachment</a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <th>Title</th>
                                <td colspan="3"><?php echo $reply->title; ?></td>
                            </tr>
                            <tr>
                                <th>Details</th>
                                <td colspan="3"><?php echo nl2br(html_entity_decode($reply->msg)); ?></td>
                            </tr>

                            <?php if ($reply->feedback_at): ?>
                                <tr>
                                    <th width="10%">Date</th>
                                    <td width="40%"><label
                                                class="label label-warning"><?php echo user_formated_datetime($reply->feedback_at); ?></label>
                                    </td>
                                    <th width="10%">Attachment</th>
                                    <td width="40%">
                                        <?php if ($reply->feedback_attachment) : ?>
                                            <a class="btn btn-xs btn-white"
                                               href="<?= base_url($reply->feedback_attachment) ?>"
                                               target="_blank">Download Attachment</a>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Details</th>
                                    <td colspan="3"><?php echo nl2br(html_entity_decode($reply->feedback_msg)); ?></td>
                                </tr>
                            <?php endif; ?>

                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>
