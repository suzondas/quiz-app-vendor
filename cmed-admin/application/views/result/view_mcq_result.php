<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="panel panel-info">
            <div class="panel-body">
                <?php echo $msg; ?>

                <h4 class="text-center"><?= $page_title; ?> <span></span></h4>
                <hr>
                <?php if ( $exam ): ?>
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <td><strong>Module</strong></td>
                            <td><?= get_name_by_auto_id( 'modules', $exam->exam_data->module_id ); ?></td>
                            <td><strong>Unit</strong></td>
                            <td><?= get_name_by_auto_id( 'module_units', $exam->exam_data->unit_id ); ?></td>
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
                        </tbody>
                    </table>
                    <table class="table default">
                        <tbody>
                        <tr>
                            <td><strong>Attend Date</strong></td>
                            <td><?= user_formated_date( $exam->attend_date ); ?></td>
                            <td><strong>Started</strong></td>
                            <td><?= user_formated_time( $exam->start_time ); ?></td>
                            <td><strong>Ended</strong></td>
                            <td><?= user_formated_time( $exam->end_time ); ?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><strong>Questions Answered</strong></td>
                            <td><span class="badge"><?= count_answers( $exam->answers ); ?></span></td>
                            <td colspan="2"><strong>Questions Not Answered</strong></td>
                            <td><span class="badge"><?= count_answers( $exam->not_answered ); ?></span></td>
                        </tr>
                        <tr>
                            <td colspan="2"><strong>Correct Answered</strong></td>
                            <td><span class="badge bg-green"><?= count_answers( $exam->correct ); ?></span></td>
                            <td colspan="2"><strong>Wrong Answered</strong></td>
                            <td><span class="badge bg-orange"><?= count_answers( $exam->wrong ); ?></span></td>
                        </tr>
                        <tr>
                            <td><strong>Obtained Mark</strong></td>
                            <td><?= $exam->final_mark; ?></td>
                            <td><strong>Correct Mark</strong></td>
                            <td><?= $exam->correct_mark; ?></td>
                            <td><strong>Wrong Mark</strong></td>
                            <td><?= $exam->wrong_mark; ?></td>
                        </tr>
                        </tbody>
                    </table>
                <?php else: ?>
                    <h4 class="text-center text-warning">
                        Nothing found..
                    </h4>
                <?php endif; ?>
            </div>
        </div>
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>    
