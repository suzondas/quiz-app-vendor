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
                            Add Visitor
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
                                if ($form_action == "add") {
                                $action_url = base_url() . 'visitor/save_visitor';
                                $btnval = 'SAVE';
                                } elseif ($form_action == "edit") {
                                    $action_url = base_url() . 'visitor/update_visitor';
                                    $btnval = 'UPDATE';
                                }
                              
                                ?>
                                
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo $action_url; ?>">
                                    <input type="hidden" name="auto_id" value="<?php echo isset($res)?$res->id:''?>">
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Name</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="name" type="text" value="<?php echo isset($res) ? $res->name : ''; ?>" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Name" class="control-label col-lg-3">Visitor Type</label>
                                        <div class="col-lg-8">
                                            <label class="control-label col-lg-2">
                                                <input type="radio" name="visitor_type" value="1" <?= (isset($res) && $res->visitor_type == '1' ? 'checked' : ''); ?>> VIP
                                            </label>
                                            <label class="control-label col-lg-2">
                                                <input type="radio" name="visitor_type" value="2" <?= (isset($res) && $res->visitor_type == '2' ? 'checked' : ''); ?>> Normal
                                            </label>
                                            <label class="control-label col-lg-2">
                                                <input type="radio" name="visitor_type" value="3" <?= (isset($res) && $res->visitor_type == '3' ? 'checked' : ''); ?>> Intern
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Purpose</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="purpose" type="text" value="<?php echo isset($res->purpose) ? $res->purpose : ''; ?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <label for="Name" class="control-label col-lg-3">Medical College Name</label>
                                    <div class="col-lg-6">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="course_list"';
                                        echo form_dropdown('med_coll', $collage_list,isset($res)?$res->med_coll:'', $ddp);
                                        ?>
                                    </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Course</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="course" type="text" value="<?php echo isset($res->course) ? $res->course : ''; ?>" required/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Subject</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="subject" type="text" value="<?php echo isset($res->subject) ? $res->subject : ''; ?>" required/>
                                        </div>
                                    </div>
                                     <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Degree</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="degree" type="text" value="<?php echo isset($res->degree) ? $res->degree : ''; ?>" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <label for="cell_no" class="control-label col-lg-3">Mobile No </label>
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">+88</span>
                                            <input type="text" class="form-control" id="cell_no" name="mobile"
                                                   type="text" value="<?php echo isset($res->mobile) ? $res->mobile : ''; ?>" required minlength="11" maxlength="11" pattern="\d{11}">
                                        </div>
                                        <i class="text-info">EX: 01700000000</i>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Name" class="control-label col-lg-3">Email Address </label>
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>

                                            <input class=" form-control" id="email" name="email" type="text" value="<?php echo isset($res->email) ? $res->email : ''; ?>"/>
                                        </div>
                                    </div>
                                    </div>    
                                    <div class="form-group ">
                                    <label for="Status" class="control-label col-lg-3 col-sm-3">Status</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <?php
                                        //echo $status_array[$res->status];
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown('status', $status_array, isset($res->status) ? $status_array[$res->status] : '', $ddp);
                                        ?>
                                    </div>
                                </div>                                                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                                          <button class="btn btn-primary" type="submit"><?php echo $btnval;?></button>
                                        </div>
                                    </div>
                                </form>
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