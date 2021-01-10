<?php
$this->load->view('header/view_student_header');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            <?php //echo $doctor_detail_row_value->topic_id;?>
            <div class="row">
                <div class="col-lg-9">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Faculty Evaluation
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
                                                               
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url('student_dashboard/save_evaluation');?>">
<!--                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Faculty Name</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php 
                                            //$teacher = isset($teacher_id)? get_name_by_auto_id('sif_teacher',$teacher_id,'tec_name'):'';
                                           // $ddp = 'class="form-control m-bot15" required';                                           
                                           // echo form_dropdown('teacher_id',$teacher_list,($teacher)? $teacher : '', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>-->
                                    <input type="hidden" name="schedule_id" value="<?= $schedule_table_id;?>">

                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Introduction</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('introduction',$evaluate_value,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                   <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Knowledge Depth Of The Subject</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('knowledge',$evaluate_value,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Expression Capability</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('express',$evaluate_value,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Interaction</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15" required';                                           
                                            echo form_dropdown('interaction',$evaluate_value,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">                                       
                                        <div class="form-group ">
                                       <label for="Name" class="control-label col-lg-3">Suggestions</label>
                                        <div class="col-lg-6">
                                            <textarea class="form-control" name="suggestions"></textarea>
                                        </div>
                                    </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                                            <button class="btn btn-primary" type="submit">Submit</button>
                                            
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