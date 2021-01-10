<?php
$this->load->view('header/view_header');
$current_date = date('Y-m-d');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Send SMS to Teacher's
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:"></a>
                                <a class="fa fa-cog" href="javascript:"></a>
                                <a class="fa fa-times" href="javascript:"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form action="<?php echo base_url('notice/sms_to_teacher')?>" method="post" class="form-horizontal">
                                    
                                    <?php                            
                                    if(validation_errors()){
                                        echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>','</div>');
                                    }

                                    if ($this->session->flashdata('smsOK')) {
                                        echo"<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                        echo $this->session->flashdata('smsOK');
                                        echo"</div>";
                                    }
                                    if ($this->session->flashdata('smsError')) {
                                        echo"<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                        echo $this->session->flashdata('smsError');
                                        echo"</div>";
                                    }
                                    ?>
                                                               
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Teacher's List</label>
                                        <div class="col-lg-6">
                                            <?php
                                            $ddp = 'class="multi-select student_list" multiple="" id="teacher"';
                                            echo form_dropdown('teacher[]',$teacher,'',$ddp);
                                            ?>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group ">
                                        <label class="control-label col-lg-3 col-sm-3">Message</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <textarea class="form-control" rows="6" name="mess_age" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <button class="btn btn-primary" type="submit">Send Mail</button>
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