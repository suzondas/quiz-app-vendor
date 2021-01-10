<?php $this->load->view('header/view_header_print'); ?>
    <p><?= $schedule_name; ?></p>
    <table cellpadding="3" border="1" style="border-collapse: collapse; text-align: center;">
        <tr>
            <th width="12%">Date</th>
            <th width="10%">Day</th>
            <th width="20%">Time</th>
            <th width="35%">Topics</th>
            <th width="23%">Place</th>
        </tr>

        <?php
        if ($rec) {
            foreach ($rec as $item) { ?>
                <tr>
                    <td><?= date('d M, Y', strtotime($item->date)); ?></td>
                    <td><?=  date('l', strtotime($item->date)); ?></td>
                    <td><?= date('H:i A', strtotime($item->time_from))." to ".date('H:i A', strtotime($item->time_to)); ?></td>
                    <td><?= get_topic_name($item->course_code,$item->faculty_code,$item->topic_id); ?></td>
                    <td><?= get_name_by_auto_id('sif_room_type', $item->room_id,'room_name') ?></td>
                </tr>
            <?php }
        }
        ?>

    </table>
<?php
//var_dump($rec);
$this->load->view('footer/view_footer_print');
?>