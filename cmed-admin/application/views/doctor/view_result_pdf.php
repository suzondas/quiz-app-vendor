<?php
$this->load->view( 'print/header' );
?>
<?php if ( $doc ) : ?>

    <table class="table no-border" style="margin-bottom: 5px">
        <tr>
            <th width="10%">Name</th>
            <th width="5px" class="text-center">:</th>
            <td width="25%"><?= $doc->doc_name; ?></td>
            <th width="10%">Year</th>
            <th width="5px" class="text-center">:</th>
            <td><?= $doc->year; ?></td>
            <th width="10%">Session</th>
            <th width="5px" class="text-center">:</th>
            <td><?= isset( $session_list[$doc->session] ) ? $session_list[$doc->session] : ""; ?></td>
        </tr>
    </table>
<?php endif; ?>
<?php if ( $results ) : ?>
    <table class="table table-bordered table-striped">
        <thead>
        <tr class="text-center">
            <th width="12%" rowspan="2">Module Name</th>
            <th width="33%" rowspan="2">Unit Name</th>
            <th colspan="3" width="20%" class="text-center">Online Exam</th>
            <th colspan="5" width="35%" class="text-center">On Site Exam</th>
        </tr>
        <tr>
            <th>MCQ</th>
            <th>Assessment</th>
            <th>Total</th>
            <th>SAQ</th>
            <th>Practical</th>
            <th>Oral</th>
            <th>Total</th>
            <th>Status</th>
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
                <td style="font-size: 12px"><?= $unit->unit_name; ?></td>
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
                <th colspan="2" class="text-right">Total =</th>
                <!--                <th class="text-center">--><? //= number_format( $module_mcq_total, 2 );
                ?><!--</th>-->
                <!--                <th class="text-center">--><? //= number_format( $module_assignment_total, 2 );
                ?><!--</th>-->
                <th class="text-center" colspan="3"><?= number_format( $module_online_total, 2 ); ?></th>
                <!--                <th class="text-center">--><? //= number_format( $module_saq_total, 2 );
                ?><!--</th>-->
                <!--                <th class="text-center">--><? //= number_format( $module_essay_total, 2 );
                ?><!--</th>-->
                <!--                <th class="text-center">--><? //= number_format( $module_oral_total, 2 );
                ?><!--</th>-->
                <th class="text-center" colspan="4"><?= number_format( $module_onsite_total, 2 ); ?></th>
                <th class="text-center"><?= number_format( $module_total, 2 ); ?></th>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
<table class="table no-border va-top">
    <tr>
        <td style="height: 20px;"></td>
    </tr>
    <tr>
        <th>
            <p>Prof Humayun Kabir Chowdhury</p>
            <p>Course Director</p>
            <p>Date:</p>
        </th>
        <th class="text-right">
            <p>Prof Tahmina Begum</p>
            <p>Course Coordinator</p>
        </th>
    </tr>
</table>
<?php
$this->load->view( 'print/footer' );
?>
