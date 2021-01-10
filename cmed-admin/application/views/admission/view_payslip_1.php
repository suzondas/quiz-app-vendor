<table style="width:565px;" cellpadding="3" border="0">
    <tr>
        <td colspan="2" style="text-align:center;">
            <img src="<?php echo base_url();?>images/mangrove-logo.png" alt="" width="200px"><br>
            <font style="font-size:12px;font-weight: bold; ">An English Medium School</font><br>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center;">____________________________________________________________________________________________________</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
            <font style="font-size:14px;font-weight: bold; ">Payment Statement</font>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td>Date : <?php echo date('d-m-Y');?></td>
        <td>Account No : 123456789</td>
    </tr>
    <tr>
        <td>Student ID : <?php echo $res->student_id;?></td>
        <td>Class : 
            <?php
            $class_name = get_name_by_auto_id('class', $res->candidate_for_class, 'name');
            if (!empty($class_name)) {
                echo $class_name;
            } else {
                echo"";
            }
            ?>
        </td>
    </tr>
    <tr>
        <td>Session : 
            <?php
            $session_name = get_name_by_auto_id('session', $res->session, 'name');
            if (!empty($session_name)) {
                echo $session_name;
            } else {
                echo"";
            }
            ?>
        </td>
        <td>Year : <?php echo $res->year;?></td>
    </tr>
    <tr>
        <td>Fellow Name : <?php echo $res->first_name . " " . $res->middle_name . " " . $res->last_name ?></td>
        <td>Cell N0 : <?php echo $res->cell_no;?></td>
    </tr>
    <tr>
        <td>Father's Name : <?php echo $res->f_name;?></td>
        <td>Cell No : <?php echo $res->f_cell_no;?></td>
    </tr>
    <tr>
        <td colspan="2">Address : <?php echo $res->f_home_add;?></td>
    </tr>
    <tr>
        <td>Mother's Name : <?php echo $res->m_name;?></td>
        <td>Cell No : <?php echo $res->m_cell_no;?></td>
    </tr>
     <tr>
        <td colspan="2">Address : <?php echo $res->m_home_add;?></td>
    </tr>
    <tr>
        <td height="25px" colspan="2"></td>
    </tr>
</table>
<table style="width:565px;" cellpadding="3" border="1">
    <tr>
        <td width="50%">Fee Details</td>
        <td width="50%">Taka</td>
    </tr>
    <?php
    $sum_fee_amount = 0;
    if (!empty($res_fee_trans_unpaid_list)) {
        //echo '<pre>';
        //print_r($res_fee_trans_unpaid_list);
        $total_fee_info = count($res_fee_trans_unpaid_list);
        foreach ($res_fee_trans_unpaid_list as $fee_trans_unpaid_key => $fee_trans_unpaid_value) {
            //echo '<pre>';
            //print_r($fee_trans_unpaid_value);
            ?>
            <tr>
                <td>
                    <?php
                    if ($fee_trans_unpaid_value->fee_type_code != 'mtf') {
                        echo get_name_by_auto_id('fee_type', $fee_trans_unpaid_value->fee_type_id, 'name');
                    }
                    if ($fee_trans_unpaid_value->fee_type_code == 'mtf') {
                        echo "Tution Fee - " . get_month_name($fee_trans_unpaid_value->month);
                    }
                    ?>
                </td>
                <td><?php echo number_format($fee_trans_unpaid_value->total_fee_amount, 2); ?></td>
            </tr>
            <?php
            $sum_fee_amount += $fee_trans_unpaid_value->total_fee_amount;
        }//end foreach
    }//end if
    ?>
    <tr>
        <td> Total ( Without VAT )</td>
        <td><?php echo number_format($sum_fee_amount, 2); ?></td>
    </tr>
    <tr>
        <td> VAT <?php echo $vat_per; ?>%</td>
        <td><?php
            $vat_amount = ($vat_per * $sum_fee_amount) / 100;
            echo number_format($vat_amount, 2);
            ?>
        </td>
    </tr>
    <tr>
        <td> Total Payable Amount Including VAT</td>
        <td><?php
            $total_including_vat = $sum_fee_amount + $vat_amount;
            echo number_format($total_including_vat, 2);
            ?>
        </td>
    </tr>
</table>
<table style="width:565px;" cellpadding="5" border="0">
    <tr>
        <td height="35px" colspan="2"></td>
    </tr>
    <tr>
        <td>_______________________</td>
        <td align="right">_______________________</td>
    </tr>
    <tr>
        <td>Depositor</td>
        <td align="right">Accountant</td>
    </tr>
</table>