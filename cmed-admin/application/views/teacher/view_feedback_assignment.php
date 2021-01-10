<?php
$this->load->view('header/view_header');
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
                        Send Feedback
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
										<a class="btn btn-sm btn-info"
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
                                <td colspan="3"><?php echo $reply->msg; ?></td>
                            </tr>
                            </tbody>
                        </table>
                        <hr>
                        <div class="form">
                            <?php echo $msg; ?>
                            <form class="cmxform form-horizontal " role="form" method="post"
                                  action="<?php echo base_url("teacher/save_assignment_feedback/$reply->id"); ?>"
                                  enctype="multipart/form-data">
                                <?= form_hidden('assignment_id', $reply->assignment_id); ?>
                                <div class="form-group">
                                    <label for="desc" class="control-label col-lg-2">Feedback Details </label>
                                    <div class="col-lg-10">
                                        <textarea name="desc" id="desc" rows="5" class="form-control summernote"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="attachment" class="control-label col-lg-2">Feedback Attachment </label>
                                    <div class="col-lg-4">
                                        <input type="file" name="attachment">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-primary" type="submit">Send Feedback</button>
                                    </div>
                                </div>
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
$this->load->view('footer/view_footer');
?>
