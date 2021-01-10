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
                            Send Mail to Teacher's
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:"></a>
                                <a class="fa fa-cog" href="javascript:"></a>
                                <a class="fa fa-times" href="javascript:"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form action="<?php echo base_url()?>/notification/mail_to_teacher" method="post" class="form-horizontal">
                                    
                                    <?php                            
                                    if(validation_errors()){
                                        echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>','</div>');
                                    }

                                    if ($this->session->flashdata('emailOK')) {
                                        echo"<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                        echo $this->session->flashdata('emailOK');
                                        echo"</div>";
                                    }
                                    if ($this->session->flashdata('emailError')) {
                                        echo"<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                        echo $this->session->flashdata('emailError');
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
                                     <div class="form-group">
                                        <label for="Name" class="control-label col-lg-3">Attach File</label>
                                        <div class="col-lg-6">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                   
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Upload File" alt="" />
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 100px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select File</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="doctor_file" class="default"/>
                                                    </span>
                                                    <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Subject</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="exam_name" name="email_sub" type="text" required/>
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