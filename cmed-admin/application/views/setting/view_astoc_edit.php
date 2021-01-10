<?php
$this->load->view('header/view_header');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            
            <div class="row">
            <div class="col-lg-9">
                <section class="panel">
                    <header class="panel-heading">
                        Assign Subject To Class Edit
                        <span class="tools pull-right">
                            <a class="fa fa-chevron-down" href="javascript:;"></a>
                            <a class="fa fa-cog" href="javascript:;"></a>
                            <a class="fa fa-times" href="javascript:;"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9">
                                <form class="cmxform form-horizontal" id="commentForm" role="form" method="post" action="<?php echo base_url().'setting/update_astoc'; ?>">
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
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Class</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown('class_id', $class_list,set_value('class_id', (isset($res->class_id)) ? $res->class_id : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Group</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"';
                                            echo form_dropdown('group_id', $group_list,set_value('group_id', (isset($res->group_id)) ? $res->group_id : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label">Subject</label>

                                        <div class="col-lg-9 col-sm-9 icheck ">
                                            <?php                             
                                            //print_r($subject_mapping_list);
                                            if (!empty($subject_list)) {

                                                foreach ($subject_list as $key => $sub_res) {
                                                    
                                                    if (array_key_exists($sub_res->id, $subject_mapping_list)) {
                                                        $checked_value = "checked";
                                                    } else {
                                                        $checked_value = "";
                                                    }
                                            ?>
                                                    <div class="flat-green single-row">
                                                        <div class="radio ">
                                                            <input type="checkbox" name="subject_id[<?php echo $sub_res->id;?>]" value="<?php echo $sub_res->name;?>" <?php echo $checked_value;?>>
                                                            <label><?php echo $sub_res->name;?></label>
                                                        </div>
                                                    </div>
                                            <?php
                                                }
                                            }
                                            ?>
                                            
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
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo $auto_id;?>">
                                            <input type="hidden" name="hidden_class_id" id="hidden_class_id" value="<?php echo $class_id;?>">
                                            <input type="hidden" name="hidden_group_id" id="hidden_group_id" value="<?php echo $group_id;?>">
                                            <button class="btn btn-primary" type="submit">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            
                        </div>
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