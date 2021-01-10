<?php
if ($this->ion_auth->logged_in()) {
    $this->load->view('header/view_header');
} else {
    $this->load->view('header/view_student_header');
}
$current_date = date('Y-m-d');
?>
<?php if ($this->ion_auth->in_group(4) || $this->ion_auth->is_admin()) {
    $con = 'teacher';
} else {
    $con = 'student_dashboard';
} ?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <?php //print_r($doctor_detail_routine);//var_dump('doctor_detail_routine');//if (isset($class_routine) && $class_routine) : ?>

        <div class="row">
            <div class="col-lg-12">

                <section class="panel panel-info">
                    <header class="panel-heading">
                        Assignments Replies
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php echo $msg; ?>
                        <table class="table table-bordered table-striped">
                            <?php if ($this->ion_auth->in_group(4) && $assignment->status != 'A') : ?>
                                <thead>

                                <tr>
                                    <th>Actions</th>
                                    <td colspan="5">
                                        <!--                                            <a href="-->
                                        <?php //echo site_url( "teacher/assignment_resend/{$assignment->id}/{$assignment->doc_id}" ) ?><!--" class="btn btn-info">Feedback</a>-->
                                        <a href="<?php echo site_url("teacher/assignment_accept/{$assignment->id}") ?>"
                                           class="btn btn-success">Accept Assignment</a>
                                    </td>
                                </tr>
                                </thead>
                            <?php endif; ?>
                            <tbody>
                            <tr>
                                <th>Status</th>
                                <td colspan="2">
                                    <?php if ($assignment->status == 'A'): ?>
                                        <label class="label label-success">Accepted</label>
                                    <?php elseif ($assignment->status == 'R'): ?>
                                        <label class="label label-warning">Replied..</label>
                                    <?php elseif ($assignment->status == 'F'): ?>
                                        <label class="label label-info">Feedback Given</label>
                                    <?php else: ?>
                                        <label class="label label-default">Pending..</label>
                                    <?php endif; ?>
                                </td>

                                <th>Date</th>
                                <td colspan="2">
                                    <label class="label label-warning">
                                        <?php echo user_formated_datetime($assignment->sent); ?>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>Faculty</th>
                                <td colspan="2"><?php echo get_teacher_name_by_id($assignment->teacher_id); ?></td>
                                <th>Fellow</th>
                                <td colspan="2"><?php echo get_name_by_auto_id('sif_admission', $assignment->doc_id, 'doc_name'); ?></td>
                            </tr>
                            <tr>
                                <th width="15%">Mark</th>
                                <td><?php echo $assignment->mark; ?></td>
                                <th width="15%">Obtained Mark</th>
                                <td><?php echo $assignment->mark_obtained; ?></td>
                                <th width="15%">Percentage</th>
                                <td><?php echo $assignment->mark_percentage; ?>%</td>
                            </tr>
                            <tr>
                                <th>Module</th>
                                <td colspan="2"><?php echo get_name_by_auto_id('modules', $assignment->module, 'name'); ?></td>
                                <th>Unit</th>
                                <td colspan="2"><?php echo get_name_by_auto_id('module_units', $assignment->unit, 'name'); ?></td>
                            </tr>
                            <tr>
                                <th>Title</th>
                                <td colspan="3"><?php echo $assignment->title; ?></td>
                                <th>Attachment</th>
                                <td><?php if ($assignment->attachment) : ?>
                                        <a class="btn btn-xs btn-success"
                                           href="<?= base_url($assignment->attachment) ?>"
                                           target="_blank">Download Attachment</a>
                                    <?php endif; ?></td>
                            </tr>
                            <tr>
                                <th>Details</th>
                                <td colspan="5"><?php echo nl2br(html_entity_decode($assignment->desc)); ?></td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table table-bordered table-striped">
                            <tbody>
                            <tr>
                                <th colspan="5" class="text-center" width="50%">Reply from Fellow</th>
                                <th colspan="<?php echo $this->ion_auth->logged_in() ? 5 : 4; ?>"
                                    class="text-center" width="50%">Faculty Feedbacks
                                </th>
                            </tr>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Title</th>
                                <th>Details</th>
                                <th>Attachment</th>
                                <th>Date</th>
                                <th>Details</th>
                                <th>Attachment</th>
                                <th>Action</th>
                            </tr>
                            <?php
                            if (!empty($replies)) {
                                foreach ($replies as $i => $reply) {
                                    ?>
                                    <tr>
                                        <td><?php echo($i + 1); ?></td>
                                        <td class="text-center">
                                            <label class="label label-warning"><?php echo date('d-m-y, h:i a', strtotime($reply->sent)); ?></label>
                                        </td>
                                        <td><?php echo $reply->title; ?></td>
                                        <td><?php echo word_limiter(strip_tags(html_entity_decode($reply->msg)), 20); ?></td>
                                        <td>
                                            <?php if ($reply->attachment) : ?>
                                                <a class="btn btn-xs btn-success"
                                                   href="<?= base_url($reply->attachment) ?>"
                                                   target="_blank">Download Attachment</a>
                                            <?php endif; ?>
                                        </td>
                                        <td class="text-center">
                                            <?php if ($reply->feedback_at): ?>
                                                <label class="label label-warning"><?php echo date('d-m-y, h:i a', strtotime($reply->feedback_at)); ?></label>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo word_limiter(strip_tags(html_entity_decode($reply->feedback_msg)), 20); ?></td>
                                        <td>
                                            <?php if ($reply->feedback_attachment) : ?>
                                                <a class="btn btn-xs btn-success"
                                                   href="<?= base_url($reply->feedback_attachment) ?>"
                                                   target="_blank">Download Attachment</a>
                                            <?php endif; ?>
                                        </td>
                                        <td class="text-center">
                                            <a href="<?php echo site_url("$con/assignment_details/{$reply->id}") ?>"
                                               class="btn btn-xs btn-warning">View Details</a>
                                            <?php if ($this->ion_auth->logged_in() && $this->ion_auth->in_group(4) && $reply->status != 'F') : ?>
                                                <a href="<?php echo site_url("teacher/assignment_feedback/{$reply->id}") ?>"
                                                   class="btn btn-xs btn-info">Send Feedback</a>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
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
