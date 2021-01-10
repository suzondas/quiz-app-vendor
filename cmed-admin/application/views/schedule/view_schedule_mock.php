<?php $this->load->view('header/view_header_print'); ?>

    <table>
        <tr>
            <td width="15%" align="center" >
                <?php if ($company->logo) : ?>
                    <img src="<?= base_url('images/logo.png') ?>" width="100" height="100" alt="<?= $company->name; ?>" >
                <?php endif; ?>
            </td>
            <td width="70%" colspan="2">
                <h1 align="center" style="margin: 0; line-height: 1;"><?= $company->name; ?></h1>
                <p align="center"><?php echo $company->tagline; ?></p>
            </td>
            
                <td width="15%" style="text-align: right;border:none;"></td>
                   
        </tr>
    </table>
 <h3 align="center"><?= $schedule_name; ?></h3>
    <table cellpadding="3" border="1" style="border-collapse: collapse; text-align: center;">
        <!--        <tr>
                    <th width="12%">Date</th>
                    <th width="10%">Day</th>
                    <th width="20%">Time</th>
                    <th width="35%">Topics</th>
                    <th width="23%">Place</th>
                </tr>-->
        <tr>
            <td colspan="5">Mock Test Schedule</td>
        </tr>

        <tr>
            <td>Subject Name</td>
            <td></td>
            <td>Paper-I</td>
            <td>Paper-II</td>
            <td>Paper-III</td>
        </tr>
        <?php
        if ($rec) {
            foreach ($rec as $i => $row) {

                echo "<tr><td>" . get_subject_name($row['I']->subject_id)."<br><strong>(".date('h:i a', strtotime($row['I']->time_from))." - ".date('h:i a', strtotime($row['I']->time_to)). ")</strong></td>";
                echo "<td>" . $i . "</td>";
                foreach ($row as $item) { ?>
                    <td>
                        <?= $item->date . '; ' . date('l', strtotime($item->date)); ?>

                        <?php //echo get_topic_name($item->course_code, $item->faculty_code, $item->topic_id);
                        ?>
                    </td>
                <?php }
                echo '</tr>';
            }

        }
        ?>


        <!--                <tr>
                    <td><?php //echo date('m-d-Y', strtotime($item[0]->date)); ?></td>
                    
                    <td><?php //echo date('l', strtotime($item[0]->date)); ?></td>
                    <td><?php //echo date('H:i A', strtotime($item[0]->time_from))." to ".date('H:i A', strtotime($item[0]->time_to)); ?></td>
                    <td><?php //echo get_topic_name($item[0]->course_code,$item[0]->faculty_code,$item[0]->topic_id); ?></td>
                    <td><?php //echo get_name_by_auto_id('sif_room_type', $item[0]->room_id,'room_name') ?></td>
                </tr>-->
    </table>
<?php
//var_dump($rec);
$this->load->view('footer/view_footer_print');
?>