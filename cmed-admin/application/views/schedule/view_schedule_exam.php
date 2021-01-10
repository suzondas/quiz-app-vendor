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
        <tr>
           
            <th width="12%">Date</th>
            <th width="10%">Exam</th>            
            <th width="35%">Topics</th>          
        </tr>
        <tr>
            <td colspan="3">Basic Preparatory Phase(5 months)</td>
        </tr>
        <?php
        if ($rec) {
            $i =0;
            foreach ($rec as $item) { 
                $i++;
                ?> 
            
           
                <tr>                                       
                    <td><?= date('m-d-Y', strtotime($item[0]->date)); ?><br><?= date('l', strtotime($item[0]->date))?></td>
                    <td>Exam(<?=$i;?>)</td>                  
                    <td>
                        <?=                                                                               
                            get_topic_name($item[0]->course_code,$item[0]->faculty_code,$item[0]->topic_id);                                                          
                        ?>
                    </td>
                   
                </tr>
            <?php }
             // echo '<pre>';
             // print_r($topics);exit;          
        }
        ?>

    </table>
<?php
//var_dump($rec);
$this->load->view('footer/view_footer_print');
?>