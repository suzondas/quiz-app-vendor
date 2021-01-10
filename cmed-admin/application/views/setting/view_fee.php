<?php
$this->load->view('header/view_header');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            
            <div class="row">
                <div class="col-lg-9">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Add Fee
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <?php                            
                                if(validation_errors()){
                                    echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>','</div>');
                                }
                                if ($this->session->flashdata('flashOK')) {
                                    echo"<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                    echo $this->session->flashdata('flashOK');
                                    echo"</div>";
                                }
                                if ($this->session->flashdata('flashError')) {
                                    echo"<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                    echo $this->session->flashdata('flashError');
                                    echo"</div>";
                                }
                                ?>
                                <?php
                                if($form_action == "add"){
                                    $action_url = base_url().'setting/save_fee';
                                    $btnval = 'SAVE';
                                }elseif($form_action == "edit"){
                                    $action_url = base_url().'setting/update_fee';
                                    $btnval = 'UPDATE';
                                }
                                
                                ?>
                                
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo $action_url; ?>">
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Course</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('course_code',$course_list,(isset($res) ? $res->course_code : ''), $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Service Package</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('ser_pack_id',$service_package,(isset($res) ? $res->ser_pack_id : ''), $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Fee Amount</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="fee_amount" type="text" value="<?php echo isset($res) ? $res->fee_amount : ''; ?>" required/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Old Fee Amount</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="old_fee_amount" type="text" value="<?php echo isset($res) ? $res->old_fee_amount : ''; ?>" required/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Status</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"';
                                            echo form_dropdown('status', $status_array, set_value('status', (isset($res->status)) ? $res->status : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                                            <button class="btn btn-primary" type="submit"><?php echo $btnval; ?></button>
                                            
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Fee List
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
                                    <th>Course Name</th>
                                    <th>Package</th>
                                    <th>Fee Amount</th>
                                    <th>Old Fee Amount</th>
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
                                            <?php //echo $value->course_code;?>
                                            <td><?php echo get_name_by_id('sif_course',$value->course_code,'course_code','course_name'); ?></td>
                                           <td><?php echo get_name_by_auto_id('sif_service_pack',$value->ser_pack_id,'ser_pack'); ?></td>
                                           <td><?php echo $value->fee_amount; ?></td>
                                           <td><?php echo $value->old_fee_amount; ?></td>
                                           <td><?php echo $value->created_by; ?></td>
                                           <td><?php echo $value->created_at; ?></td>
                                           <td>
                                                <?php
                                                    if ($value->status == '1') {
                                                    echo '<span class="label label-success">Active</span>';
                                                    } else {
                                                             echo '<span class="label label-warning">Inactive</span>';
                                                    }
?>
                                            </td>
                                            <td>
                                                <a href="<?php echo base_url().'setting/edit_fee/'.$value->id; ?>" class="btn btn-warning btn-xs" title="Edit" data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square-o"></i></a>
<!--                                                <a href="#"><i class="fa fa-times"></i></a>-->
                                            </td>
                                        </tr>
                                        <?php
                                        }
                                    }else{
                                        echo'<tr><td colspan="7" align="center">No Data Available</td></tr>';
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