<table style="width:980px;" cellpadding="3" border="0">
    <tr>
    <td width="25%" style="border-right-style: dotted;">
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="2" style="text-align:center;">
                    <font style="font-size:12px;font-weight: bold; ">SCHOOL NAME AND LOGO</font><br>
                    House No: 223, Road No: 15, Mohakhali New DOHS, Dhaka<br>
                    Cell No: 0191143-0370<br>
                    <font style="font-size:12px;font-weight: bold; ">MOHAKHALI BRANCH</font><br>
                    Account No: 18529046233
                </td>
            </tr>
            <tr>
                <td style="text-align: left;">For Month:</td>
                <td style="text-align: right;">Date:</td>
            </tr>
            <tr>
                <td>Shift : Morning</td>
                <td style="text-align: right;">Medium : English</td>
            </tr>
            <tr>
                <td colspan="2">Student Name : <?php echo $res->first_name." ".$res->middle_name." ".$res->last_name?></td>
            </tr>
            <tr>
                <td colspan="2">Student ID : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
                <td colspan="2">Roll : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
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
                <td style="text-align: right;">Section : 
                <?php
                $section_name = get_name_by_auto_id('section', $res->section_id, 'name');
                if (!empty($section_name)) {
                    echo $section_name;
                } else {
                    echo"";
                }
                ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="1">
            <tr>
                <td width="75%">
                    Fee Details
                </td>
                <td width="25%"> Taka</td>
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
                        <td><?php echo number_format($fee_trans_unpaid_value->total_fee_amount,2); ?></td>
                    </tr>
                    <?php
                    $sum_fee_amount += $fee_trans_unpaid_value->total_fee_amount;
                }//end foreach
            }//end if
            ?>
            <tr>
                <td> Total ( Without VAT )</td>
                <td><?php echo number_format($sum_fee_amount,2);?></td>
            </tr>
            <tr>
                <td> VAT <?php echo $vat_per;?>%</td>
                <td><?php
                    $vat_amount = ($vat_per*$sum_fee_amount)/100;
                    echo number_format($vat_amount,2);
                    ?>
                </td>
            </tr>
            <tr>
                <td> Total Payable Amount Including VAT</td>
                <td><?php
                    $total_including_vat = $sum_fee_amount+$vat_amount;
                    echo number_format($total_including_vat,2);
                    ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="3" height="80"></td>
            </tr>
            <tr>
                <td>___________</td>
                <td>___________</td>
                <td>___________</td>
            </tr>
            <tr>
                <td>Parent/Student</td>
                <td>Cashier</td>
                <td>Officer</td>
            </tr>
            <tr>
                <td colspan="3">Parents Mobile No : <?php echo $res->f_cell_no;?></td>
            </tr>
            <tr>
                <td colspan="3" height="45" style="text-align:center;">Please Don't Write/Stamp Inside Barcode Area</td>
            </tr>
            <tr>
                <td colspan="3"><font style="text-align: center;font-size:12px;font-weight: bold; ">Parent / Student Copy</font></td>
            </tr>
        </table>
    </td>
    <td width="25%" style="border-right-style: dotted;">
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="2" style="text-align:center;">
                    <font style="font-size:12px;font-weight: bold; ">SCHOOL NAME AND LOGO</font><br>
                    House No: 223, Road No: 15, Mohakhali New DOHS, Dhaka<br>
                    Cell No: 0191143-0370<br>
                    <font style="font-size:12px;font-weight: bold; ">MOHAKHALI BRANCH</font><br>
                    Account No: 18529046233
                </td>
            </tr>
            <tr>
                <td style="text-align: left;">For Month:</td>
                <td style="text-align: right;">Date:</td>
            </tr>
            <tr>
                <td>Shift : Morning</td>
                <td style="text-align: right;">Medium : English</td>
            </tr>
            <tr>
                <td colspan="2">Student Name : <?php echo $res->first_name." ".$res->middle_name." ".$res->last_name?></td>
            </tr>
            <tr>
                <td colspan="2">Student ID : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
                <td colspan="2">Roll : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
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
                <td style="text-align: right;">Section : 
                <?php
                $section_name = get_name_by_auto_id('section', $res->section_id, 'name');
                if (!empty($section_name)) {
                    echo $section_name;
                } else {
                    echo"";
                }
                ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="1">
            <tr>
                <td width="75%">
                    Fee Details
                </td>
                <td width="25%"> Taka</td>
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
                        <td><?php echo number_format($fee_trans_unpaid_value->total_fee_amount,2); ?></td>
                    </tr>
                    <?php
                    $sum_fee_amount += $fee_trans_unpaid_value->total_fee_amount;
                }//end foreach
            }//end if
            ?>
            <tr>
                <td> Total ( Without VAT )</td>
                <td><?php echo number_format($sum_fee_amount,2);?></td>
            </tr>
            <tr>
                <td> VAT <?php echo $vat_per;?>%</td>
                <td><?php
                    $vat_amount = ($vat_per*$sum_fee_amount)/100;
                    echo number_format($vat_amount,2);
                    ?>
                </td>
            </tr>
            <tr>
                <td> Total Payable Amount Including VAT</td>
                <td><?php
                    $total_including_vat = $sum_fee_amount+$vat_amount;
                    echo number_format($total_including_vat,2);
                    ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="3" height="80"></td>
            </tr>
            <tr>
                <td>___________</td>
                <td>___________</td>
                <td>___________</td>
            </tr>
            <tr>
                <td>Parent/Student</td>
                <td>Cashier</td>
                <td>Officer</td>
            </tr>
            <tr>
                <td colspan="3">Parents Mobile No : <?php echo $res->f_cell_no;?></td>
            </tr>
            <tr>
                <td colspan="3" height="45" style="text-align:center;">Please Don't Write/Stamp Inside Barcode Area</td>
            </tr>
            <tr>
                <td colspan="3"><font style="text-align: center;font-size:12px;font-weight: bold; ">School Copy</font></td>
            </tr>
        </table>
    </td>
    <td width="25%" style="border-right-style: dotted;">
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="2" style="text-align:center;">
                    <font style="font-size:12px;font-weight: bold; ">SCHOOL NAME AND LOGO</font><br>
                    House No: 223, Road No: 15, Mohakhali New DOHS, Dhaka<br>
                    Cell No: 0191143-0370<br>
                    <font style="font-size:12px;font-weight: bold; ">MOHAKHALI BRANCH</font><br>
                    Account No: 18529046233
                </td>
            </tr>
            <tr>
                <td style="text-align: left;">For Month:</td>
                <td style="text-align: right;">Date:</td>
            </tr>
            <tr>
                <td>Shift : Morning</td>
                <td style="text-align: right;">Medium : English</td>
            </tr>
            <tr>
                <td colspan="2">Student Name : <?php echo $res->first_name." ".$res->middle_name." ".$res->last_name?></td>
            </tr>
            <tr>
                <td colspan="2">Student ID : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
                <td colspan="2">Roll : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
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
                <td style="text-align: right;">Section : 
                <?php
                $section_name = get_name_by_auto_id('section', $res->section_id, 'name');
                if (!empty($section_name)) {
                    echo $section_name;
                } else {
                    echo"";
                }
                ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="1">
            <tr>
                <td width="75%">
                    Fee Details
                </td>
                <td width="25%"> Taka</td>
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
                        <td><?php echo number_format($fee_trans_unpaid_value->total_fee_amount,2); ?></td>
                    </tr>
                    <?php
                    $sum_fee_amount += $fee_trans_unpaid_value->total_fee_amount;
                }//end foreach
            }//end if
            ?>
            <tr>
                <td> Total ( Without VAT )</td>
                <td><?php echo number_format($sum_fee_amount,2);?></td>
            </tr>
            <tr>
                <td> VAT <?php echo $vat_per;?>%</td>
                <td><?php
                    $vat_amount = ($vat_per*$sum_fee_amount)/100;
                    echo number_format($vat_amount,2);
                    ?>
                </td>
            </tr>
            <tr>
                <td> Total Payable Amount Including VAT</td>
                <td><?php
                    $total_including_vat = $sum_fee_amount+$vat_amount;
                    echo number_format($total_including_vat,2);
                    ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="3" height="80"></td>
            </tr>
            <tr>
                <td>___________</td>
                <td>___________</td>
                <td>___________</td>
            </tr>
            <tr>
                <td>Parent/Student</td>
                <td>Cashier</td>
                <td>Officer</td>
            </tr>
            <tr>
                <td colspan="3">Parents Mobile No : <?php echo $res->f_cell_no;?></td>
            </tr>
            <tr>
                <td colspan="3" height="45" style="text-align:center;">Please Don't Write/Stamp Inside Barcode Area</td>
            </tr>
            <tr>
                <td colspan="3"><font style="text-align: center;font-size:12px;font-weight: bold; ">VAT Office Copy</font></td>
            </tr>
        </table>
    </td>
    <td width="25%">
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="2" style="text-align:center;">
                    <font style="font-size:12px;font-weight: bold; ">SCHOOL NAME AND LOGO</font><br>
                    House No: 223, Road No: 15, Mohakhali New DOHS, Dhaka<br>
                    Cell No: 0191143-0370<br>
                    <font style="font-size:12px;font-weight: bold; ">MOHAKHALI BRANCH</font><br>
                    Account No: 18529046233
                </td>
            </tr>
            <tr>
                <td style="text-align: left;">For Month:</td>
                <td style="text-align: right;">Date:</td>
            </tr>
            <tr>
                <td>Shift : Morning</td>
                <td style="text-align: right;">Medium : English</td>
            </tr>
            <tr>
                <td colspan="2">Student Name : <?php echo $res->first_name." ".$res->middle_name." ".$res->last_name?></td>
            </tr>
            <tr>
                <td colspan="2">Student ID : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
                <td colspan="2">Roll : <?php echo $res->student_id;?></td>
            </tr>
            <tr>
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
                <td style="text-align: right;">Section : 
                <?php
                $section_name = get_name_by_auto_id('section', $res->section_id, 'name');
                if (!empty($section_name)) {
                    echo $section_name;
                } else {
                    echo"";
                }
                ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="1">
            <tr>
                <td width="75%">
                    Fee Details
                </td>
                <td width="25%"> Taka</td>
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
                        <td><?php echo number_format($fee_trans_unpaid_value->total_fee_amount,2); ?></td>
                    </tr>
                    <?php
                    $sum_fee_amount += $fee_trans_unpaid_value->total_fee_amount;
                }//end foreach
            }//end if
            ?>
            <tr>
                <td> Total ( Without VAT )</td>
                <td><?php echo number_format($sum_fee_amount,2);?></td>
            </tr>
            <tr>
                <td> VAT <?php echo $vat_per;?>%</td>
                <td><?php
                    $vat_amount = ($vat_per*$sum_fee_amount)/100;
                    echo number_format($vat_amount,2);
                    ?>
                </td>
            </tr>
            <tr>
                <td> Total Payable Amount Including VAT</td>
                <td><?php
                    $total_including_vat = $sum_fee_amount+$vat_amount;
                    echo number_format($total_including_vat,2);
                    ?>
                </td>
            </tr>
        </table>
        <table style="" cellpadding="3" border="0">
            <tr>
                <td colspan="3" height="80"></td>
            </tr>
            <tr>
                <td>___________</td>
                <td>___________</td>
                <td>___________</td>
            </tr>
            <tr>
                <td>Parent/Student</td>
                <td>Cashier</td>
                <td>Officer</td>
            </tr>
            <tr>
                <td colspan="3">Parents Mobile No : <?php echo $res->f_cell_no;?></td>
            </tr>
            <tr>
                <td colspan="3" height="45" style="text-align:center;">Please Don't Write/Stamp Inside Barcode Area</td>
            </tr>
            <tr>
                <td colspan="3"><font style="text-align: center;font-size:12px;font-weight: bold; ">Bank Copy</font></td>
            </tr>
        </table>
    </td>
    </tr>
</table>