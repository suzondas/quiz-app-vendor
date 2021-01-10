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
                        Exams
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php if ( $exams ): ?>
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Exam Name</th>
                                    <th>Module</th>
                                    <th>Unit</th>
									<th>Start Date - End Date</th>
                                    <th width="10%">Status</th>
                                    <th width="15%">Action</th>
                                </tr>

                                <?php foreach ( $exams as $i => $exam ): ?>
                                    <tr>
                                        <td><?= (++$i); ?></td>
                                        <td><?= $exam->exam_name; ?></td>
                                        <td><?= get_name_by_auto_id( 'modules', $exam->module_id ); ?></td>
										<td class="text-center"><?= get_name_by_auto_id( 'module_units', $exam->unit_id, 'code' ); ?></td>
										<td class="text-center">
											<label class="label label-primary"><?= user_formated_datetime( $exam->open_date ) ?></label>
											-
											<label class="label label-danger"><?= user_formated_datetime( $exam->close_date ) ?></label></td>
                                        <td class="text-center">
                                            <?php
                                            $class = 'default';
                                            if ( $exam->status == 1 ) {
												$class = "success";
                                            } elseif ( $exam->status == 0 ) {
                                                $class = "danger";
                                            } elseif ( $exam->status == 8 ) {
                                                $class = "info";
                                            } elseif ( $exam->status == 9 ) {
												$class = "warning";
                                            } ?>
											<label class="badge bg-<?= $class ?>"><?= exam_status( $exam->status ); ?></label>
                                        </td>
                                        <td class="text-center">
                                            <?php if ( (strtotime( $exam->open_date ) <= now()) && (strtotime( $exam->close_date ) >= now()) && $exam->status == 9 ): //  ?>
                                                <a href="<?= site_url( "exam/exam_prompt/{$exam->id}" ); ?>" class="btn btn-xs btn-success" target="_blank">Start Exam</a>
                                            <?php elseif ( $exam->status == 1 ): ?>
                                                <a href="<?= site_url( "exam/exam_answer/{$exam->id}" ); ?>" class="btn btn-xs btn-primary m-bot5" target="_blank">Answer Details</a>
                                                <a href="<?= site_url( "exam/exam_result/{$exam->id}" ); ?>" class="btn btn-xs btn-success" target="_blank">View Result</a>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                                </thead>
                            </table>
                        <?php else: ?>
                            <h2 class="text-warning">You don't have any exams available.</h2>
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
