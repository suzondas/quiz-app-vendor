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
                        Results
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php if ( $doc ) : ?>
    
                            <?php if ( $this->ion_auth->logged_in() ): ?>
                                <div class="text-right m-bot15">
                                    <a href="<?= site_url( "result/download_individual_result/$doc->id" ); ?>" class="btn btn-info"><i class="fa fa-download"></i> Download PDF</a>
                                </div>
                            <?php endif; ?>

                            <table class="table table-bordered table-striped">
                                <tr>
                                    <th width="10%">Name</th>
                                    <td width="40%"><?= $doc->doc_name; ?></td>
                                    <th width="10%">Course</th>
                                    <td width="40%"><?= get_name_by_auto_id( 'sif_course', 1, 'course_name' ); ?></td>
                                </tr>
                                <tr>
                                    <th>Year</th>
                                    <td><?= $doc->year; ?></td>
                                    <th>Session</th>
                                    <td><?= isset( $session_list[$doc->session] ) ? $session_list[$doc->session] : ""; ?></td>
                                </tr>
                            </table>
                        <?php endif; ?>
                        <?php if ( $results ) : ?>
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr class="text-center">
                                    <th width="25%" rowspan="2">Module Name</th>
                                    <th width="30%" rowspan="2">Unit Name</th>
                                    <th colspan="3" class="text-center">Online Exam</th>
                                    <th colspan="5" class="text-center">On Site Exam</th>
                                </tr>
                                <tr>
									<th class="text-center">MCQ<span class="badge bg-warning">10</span></th>
									<th class="text-center">Assessment<span class="badge bg-warning">40</span></th>
									<th class="text-center">Total<span class="badge bg-warning">50</span></th>
									<th class="text-center">SAQ <span class="badge bg-warning">100</span></th>
									<th class="text-center">Practical <span class="badge bg-warning">50</span></th>
									<th class="text-center">Oral <span class="badge bg-warning">150</span></th>
									<th class="text-center">Total <span class="badge bg-warning">300</span></th>
									<th class="text-center">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $module_id             = 0;
                                foreach ( $results as $module => $units ) :
                                    $module_mcq_total = $module_assignment_total = $module_online_total = $module_saq_total = $module_essay_total = $module_oral_total = $module_onsite_total = $module_total = 0;
                                    ?>
    
                                    <?php foreach ( $units as $unit ) :
                                    $assignment_mark = $unit->assignment ? $unit->assignment->mark : 0;
                                    $mcq_mark                = $unit->mcq ? $unit->mcq->mark : 0;
                                    $online_total            = $assignment_mark + $mcq_mark;
                                    $module_mcq_total        += $mcq_mark;
                                    $module_assignment_total += $assignment_mark;
                                    ?>
                                    <tr>
                                        <?php if ( $module != $module_id ): ?>
                                            <td rowspan="<?= count( $units ); ?>"><?= $unit->module_name; ?></td>
                                        <?php endif; ?>
                                        <td><?= $unit->unit_name; ?></td>
                                        <td class="text-center"><?= $mcq_mark ? number_format( $mcq_mark, 2 ) : ''; ?></td>
                                        <td class="text-center"><?= $assignment_mark ? number_format( $assignment_mark, 2 ) : ''; ?></td>
                                        <td class="text-center"><?= $online_total ? number_format( $online_total, 2 ) : ''; ?></td>
                                        <!--<td class="text-center">
                                                <?php
                                        /*                                                $class = '';
                                                                                        $title = NULL;
                                                                                        if ( $unit->online_status == 1 ) {
                                                                                            $class = "success";
                                                                                            $title = "PASSED";
                                                                                        } elseif ( $unit->online_status == 0 ) {
                                                                                            $class = "danger";
                                                                                            $title = "FAILED";
                                                                                        } */ ?>
                                                <label class="label label-<? /*= $class */ ?>"><? /*= $title; */ ?></label>
                                            </td>-->
                                        <?php if ( $module != $module_id ): ?>
                                            <td class="text-center"
                                                rowspan="<?= count( $units ); ?>"><?= ( $unit->osa && $unit->osa->mcq_obtained ) ? number_format( $unit->osa->mcq_obtained, 2 ) : ''; ?></td>
                                            <td class="text-center"
                                                rowspan="<?= count( $units ); ?>"><?= ( $unit->osa && $unit->osa->essay_obtained ) ? number_format( $unit->osa->essay_obtained, 2 ) : ''; ?></td>
                                            <td class="text-center"
                                                rowspan="<?= count( $units ); ?>"><?= ( $unit->osa && $unit->osa->oral_obtained ) ? number_format( $unit->osa->oral_obtained, 2 ) : ''; ?></td>
                                            <td class="text-center" rowspan="<?= count( $units ); ?>"><?= ( $unit->osa && $unit->osa->mark ) ? number_format( $unit->osa->mark, 2 ) : ''; ?></td>
                                            <td class="text-center" rowspan="<?= count( $units ); ?>">
                                                <?php
                                                if ( $unit->osa ) {
                                                    $class = 'default';
                                                    $title = "Not Attented";
                                                    if ( $unit->osa->status == 1 && $unit->osa->mark > 0 ) {
                                                        $class = "success";
                                                        $title = "PASSED";
                                                    } elseif ( $unit->osa->status == 0 && $unit->osa->mark > 0 ) {
                                                        $class = "danger";
                                                        $title = "FAILED";
                                                    } else {
                                                        $class = "warning";
                                                        $title = "Not Attented";
                                                    }
                                                    echo '<label class="label label-' . $class . ' ?>">' . $title . '</label>';
    
                                                    $module_saq_total   += $unit->osa->mcq_obtained;
                                                    $module_essay_total += $unit->osa->essay_obtained;
                                                    $module_oral_total  += $unit->osa->oral_obtained;
                                                }
                                                ?>

                                            </td>
                                        <?php endif; ?>
                                    </tr>
                                    <?php $module_id = $module; endforeach; ?>
                                    <?php
                                    $module_online_total = $module_mcq_total + $module_assignment_total;
                                    $module_onsite_total = $module_saq_total + $module_essay_total + $module_oral_total;
                                    $module_total        = $module_online_total + $module_onsite_total;
                                    ?>

                                    <tr>
                                        <th colspan="2" class="text-right">Module Total</th>
                                        <th class="text-center"><?= number_format( $module_mcq_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_assignment_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_online_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_saq_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_essay_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_oral_total, 2 ); ?></th>
                                        <th class="text-center"><?= number_format( $module_onsite_total, 2 ); ?></th>
                                        <th class="text-center">= <?= number_format( $module_total, 2 ); ?></th>
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
