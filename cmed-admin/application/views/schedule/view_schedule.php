<?php $this->load->view('header/view_header_print'); ?>
<?php //var_dump($rec); ?>

    <table>
        <tr>
            <td width="15%" align="center">
                <?php if ($company->logo) : ?>
                    <img src="<?= base_url('images/logo.png') ?>" width="100" height="100" alt="<?= $company->name; ?>">
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
        <tr>
            <th width="15%">Date</th>
            <th width="20%">Lecture</th>
            <th rowspan="<?= count($rec) + 1; ?>">BREAK</th>
            <th width="20%">Exam</th>
            <th width="20%">Lecture</th>
        </tr>

        <?php
        if ($rec) {
            foreach ($rec as $i => $row) {
                echo "<tr><td>" . date('d.m.y', strtotime($row[0]->date)); ?>
                <br><?= date('l', strtotime($row[0]->date)) . "</td>";
                foreach ($row as $item) { ?>
                    <td>
                        <?= date('H:i A', strtotime($item->time_from)) . " - " . date('H:i A', strtotime($item->time_to)); ?>
                        <br>
                        <?= get_topic_name($item->course_code, $item->topic_id); ?>
                    </td>
                <?php }
                echo ' </tr>';
            }
        }
        ?>

    </table>
<?php
//var_dump($rec);
$this->load->view('footer/view_footer_print');
?>