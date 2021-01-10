<?php $this->load->view('header/view_header_print'); ?>

    <table cellpadding="3" cellspacing="4" border="0" style="border-collapse: collapse;">

        <tr>
            <td width="15%" align="center">
                <?php if ($company->logo) : ?>
                    <img src="<?= base_url('images/logo.png') ?>" width="100" height="100" alt="<?= $company->name; ?>">
                <?php endif; ?>
            </td>
            <td width="70%" colspan="2">
                <h1 align="center" style="margin: 0; line-height: 1;"><?= $company->name; ?></h1>
                <p align="center"><?php echo $company->tagline; ?></p>
                <p align="center"><b>FCPS/MD/MS/M.Phil/Diploma/Basic Sciences</b></p>
            </td>
            <?php
            if ($record->photo) {
                ?>
                <td width="15%" style="text-align: right;"><img src="<?php echo base_url($record->photo); ?>"
                                                                width="120px" height="110px"></td>
                <?php
            }
            ?>
        </tr>
    </table>
    <table cellpadding="3" cellspacing="4" border="0" style="border-collapse: collapse;">
        <tr>
            <td colspan="4" align="center" style="font-size:24px;color:#FF0000;"><b>Admission Form</b></td>
        </tr>
        <tr>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td><b>Batch</b></td>
            <td>
                <?php
                echo ': ' . get_batch_name($record->course_code, $record->batch_code);
                ?>
            </td>
        </tr>
        <tr>
            <td><b>Reg No.</b></td>
            <td><?php echo ': ' . $record->reg_no; ?></td>
            <td></td>
            <td style="text-align: right;">
                Date: <?php echo date('d-m-Y', strtotime($record->created_at)); ?>
            </td>
        </tr>
        <tr>
            <td><b>Fellow's Name </b></td>
            <td><?php echo ': ' . $record->doc_name ?></td>
            <td><b>Blood Group :</b></td>
            <td><?php echo ': ' . $blood_group[$record->blood_gro]; ?></td>
        </tr>
        <tr>
            <td><b>Father's Name </b></td>
            <td><?php echo ': ' . $record->father_name; ?></td>
            <td><b>Mother's Name </b></td>
            <td><?php echo ': ' . $record->mother_name; ?></td>
        </tr>
        <tr>
            <td><b>Job Description </b></td>
            <td colspan="4"><?php echo ': ' . $record->job_des; ?></td>
        </tr>

        <tr>
            <td><b>Mailing Address </b></td>
            <td colspan="4"><?php if ($record->mai_address) {
                    echo ': ' . 'Village:- ' . $record->mai_address . ' Division:- ' . $division_list[$record->mai_divi] . ' District :-' . $mai_district_list[$record->mai_dist] . ' Thana :-' . $mai_upazilla_list[$record->mai_thana];
                } ?></td>
        </tr>

        <tr>
            <td><b>Contact No </b></td>
            <td colspan="4"><?php echo ': ' . $record->phone; ?></td>
        </tr>

        <tr>
            <td><b>Email </b></td>
            <td><?php echo ': ' . $record->email; ?></td>
            <td><b>Facebook ID </b></td>
            <td><?php echo ':' . $record->f_id; ?></td>
        </tr>
        <tr>
            <td><b>BMDC No</b></td>
            <td colspan="2"><?php echo ': ' . $record->bmdc_no; ?></td>
        </tr>
    </table>
<?php
if ($edu_record) {
    ?>
    <h3>Academic Information</h3>
    <table border='1' cellpadding="3" cellspacing="4" style="border-collapse: collapse;text-align: center;">
        <tr>
            <td><b>Exam</b></td>
            <td><b>Passing Year</b></td>
            <td><b>Institute,Batch</b></td>
            <td><b>GPA/Result</b></td>
        </tr>
        <?php

        foreach ($edu_record as $rec) {
            ?>
            <tr>
                <td>
                    <?php echo $rec->exam_name; ?>
                </td>
                <td>
                    <?php echo $rec->pass_year; ?>
                </td>


                <td><?php echo get_name_by_auto_id('sif_medical_collage', $rec->exam_ins, 'collage_name') ? get_name_by_auto_id('sif_medical_collage', $rec->exam_ins, 'collage_name') : $rec->exam_ins; ?></td>


                <td>
                    <?php echo $rec->exam_result; ?>
                </td>
            </tr>
            <?php

        }

        ?>
    </table>
    <?php
}
?>
    <table cellpadding="3" cellspacing="4">
        <tr>
            <td><b>Payment</b></td>
            <td><?php echo ': ' . $payment_info->amount; ?></td>
            <td><b>Received </b></td>
            <td><?php echo ': ' . $payment_info->auth_by; ?></td>
        </tr>
        <tr>
            <td><b>Due(If any)</b></td>
            <td><?php echo ': ' . $due = ($record->fee_amount - $payment_info->amount);
                $due ? $due : ''; ?></td>
            <td><b>Date of Payment </b></td>
            <td><?php echo ': ' . date('d-m-Y', strtotime($payment_info->date)); ?></td>
        </tr>

    </table>
    <table>
        <tr>
            <td>
                <?php if($record->sign) {
                    echo '<img src="'.base_url($record->sign).'" height="80" width="auto" alt="sign">';
                } else {
                    echo '<br>';
                }?>

                -----------------------------------------------<br>
                Signature of the Fellow & Date
            </td>
            <td></td>
            <td style="text-align:right;"><br><br><br>
                -----------------------------------------------<br>
                Signature of the Coordinator/Executive
            </td>
        </tr>
    </table>
    <table cellpadding="3" cellspacing="4">
        <tr>
            <td><b>Institute</b></td>
            <td><?php echo ': ' . get_name_by_auto_id('sif_institute', $record->institute, 'institute_name'); ?></td>
            <td><b>Year</b></td>
            <td><?php echo ': ' . get_name_by_auto_id('sif_institute', $record->institute, 'institute_name'); ?></td>
        </tr>
        <tr>
            <td><b>Session</b></td>
            <td><?php echo ': ' . $session_list[$record->session]; ?></td>
            <td><b>Course</b></td>
            <td><?php echo ': ' . get_name_by_id('sif_course', $record->course_code, 'course_code', 'course_name'); ?></td>
        </tr>
        <!--<tr>
            <td><b>Faculty</b></td>
            <td colspan="2"><?php /*echo ': ' . get_faculty_name_by_course_code_faculty_code('sif_faculty', $record->course_code, $record->faculty_code, 'faculty_name'); */?></td>

        </tr>-->
        <tr>
            <td><b>Subject</b></td>
            <td><?php echo ': ' . get_subject_name($record->course_code, $record->faculty_code, $record->subject); ?></td>
            <td><b>Service Package</b></td>
            <td><?php echo ': ' . get_name_by_auto_id('sif_service_pack', $record->service_pack_id, 'ser_pack'); ?></td>
        </tr>
        <tr>
            <td><b>Admission Type</b></td>
            <td colspan="2"><?php echo $record->admi_type ? ': ' . $admi_type[$record->admi_type] : '' ?></td>
        </tr>
        <tr>
            <td><b>Medical College Type</b></td>
            <td><?php echo ': ' . $record->collage_type; ?></td>
            <td><b>Medical College</b></td>
            <td><?php echo ': ' . get_name_by_auto_id('sif_medical_collage', $record->medical_col, 'collage_name'); ?></td>
        </tr>
        <tr>
            <td><b>Passport no</b></td>
            <td><?php echo ': ' . $record->passport; ?></td>
            <td><b>National ID</b></td>
            <td><?php echo ': ' . $record->n_id; ?></td>
        </tr>
        <tr>
            <td><b>Job Description</b></td>
            <td colspan="2"><?php echo ': ' . $record->job_des; ?></td>
        </tr>
        <tr>
            <td><b>Contact person/spouse mobile no</b></td>
            <td><?php echo ': ' . $record->pouse_mobile; ?></td>
            <td><b>Contact person/spouse name</b></td>
            <td><?php echo ': ' . $record->spouse_name; ?></td>
        </tr>

        <?php
        if ($reference) {
            ?>
            <tr>
                <td><b>Important Reference</b></td>
            </tr>
            <tr>
                <td><b>Name</b></td>
                <td><b>Designation</b></td>
                <td><b>Mobile</b></td>
                <td><b>Relation</b></td>
            </tr>
            <?php foreach ($reference as $ref) { ?>
                <tr>
                    <td><?php echo $ref->name; ?></td>
                    <td><?php echo $ref->designation; ?></td>
                    <td><?php echo $ref->mobile; ?></td>
                    <td><?php echo $ref->relation; ?></td>
                </tr>
                <?php
            }
        }
        ?>
    </table>

<?php
$this->load->view('footer/view_footer_print');
?>
