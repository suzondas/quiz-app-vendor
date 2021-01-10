<?php $this->load->view('header/view_header_print'); ?>
    <h3 align="center">Result Sheet</h3>
    <table cellpadding="3" border="0" style="border-collapse: collapse; font-size: 12px;">
        <tr>
            <td colspan="2"><strong>Exam: </strong><?= $exam->exam_name; ?></td>
            <td align="right"><strong>Date:- </strong><?= $exam->exam_date ?></td>
        </tr>
        <tr>
            <td><strong>Batch: </strong> <?= get_batch_name($exam->course_code, $exam->faculty_code, $exam->batch_code); ?></td>
            <td align="center"><strong>Topics: </strong> <?= get_topic_name($exam->course_code, $exam->faculty_code, $exam->topic_id); ?></td>
            <td align="right"><strong>Highest Mark: </strong> <?= $exam->highest_mark; ?></td>
        </tr>
    </table>
    <table cellpadding="3" border="1" style="border-collapse: collapse; text-align: center; font-size: 12px;">
        <thead>
        <tr>
            <th>Reg. No</th>
            <th width="20%">Fellows Name</th>
            <th>Faculty</th>
            <th>Subject</th>
            <th>Marks</th>
            <th>Position</th>
            <th>Subject Position</th>
            <th>Candidate Position</th>
            <th>Wrong Answer</th>
        </tr>
        </thead>

        <tbody>
        <?php
        foreach ($rec as $key => $value) {
            ?>
            <tr>
                <td><?php echo $value->doc_reg_no; ?></td>
                <td><?php echo get_name_by_auto_id('sif_admission', $value->doc_id, 'doc_name'); ?></td>
                <td><?php echo get_faculty_name_by_course_code_faculty_code('sif_faculty', $value->course_code, $value->faculty_code); ?></td>
                <td><?php echo get_subject_name($value->course_code, $value->faculty_code, $value->subject_id); ?></td>
                <td class="text-center"><?php echo $value->obtained_mark; ?></td>
                <td class="text-center"><?php echo $value->merit_pos; ?></td>
                <td class="text-center"><?php echo $value->subject_pos; ?></td>
                <td class="text-center"><?php echo $value->overall_pos; ?></td>
                <td class="text-center"><?php echo $value->no_wrong; ?></td>
            </tr>

            <?php
        }
        ?>
        </tbody>

    </table>
<?php
//var_dump($rec);
$this->load->view('footer/view_footer_print');
?>