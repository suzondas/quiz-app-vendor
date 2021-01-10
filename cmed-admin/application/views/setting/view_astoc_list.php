<?php
$this->load->view('header/view_header');
?> 
<!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Assigned Subject List
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Class</th>
                                    <th>Group</th>
                                    <th>Subject</th>
                                    <th>Created By</th>
                                    <th>Creation Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($record)) {

                                        foreach ($record as $key => $value) {
                                        ?>
                                        <tr>
                                            <td>
                                                <?php 
                                                    $class_name = get_name_by_auto_id('class',$value->class_id,'name');
                                                    if(!empty($class_name)){
                                                        echo $class_name;
                                                    }else{
                                                        echo"";
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <?php 
                                                    $group_name = get_name_by_auto_id('group',$value->group_id,'name');
                                                    if(!empty($group_name)){
                                                        echo $group_name;
                                                    }else{
                                                        echo"";
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <?php 
                                                    $subject_list = helper_sub_list_by_class_group_id($value->class_id,$value->group_id);
                                                    //print_r($subject_list);
                                                    foreach ($subject_list as $key => $subject_list_res) {
                                                        echo $subject_list_res->subject_name."<br>";
                                                    }
                                                ?>
                                            </td>
                                            <td><?php echo $value->created_by; ?></td>
                                            <td><?php echo $value->created_date_time; ?></td>
                                            <td>
                                                <?php 
                                                if($value->status==1){
                                                    echo "Active"; 
                                                }elseif($value->status==2){
                                                    echo "Inactive"; 
                                                }else{
                                                    echo"";
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <a href="<?php echo base_url().'setting/edit_astoc/'.$value->id.'/'.$value->class_id.'/'.$value->group_id; ?>"><i class="fa fa-pencil-square-o"></i></a>
                                            </td>
                                        </tr>
                                        <?php
                                        }
                                    }else{
                                        echo'<tr><td colspan="5" align="center">No Data Available</td></tr>';
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
            <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>    
