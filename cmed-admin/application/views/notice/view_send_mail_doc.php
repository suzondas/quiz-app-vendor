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
                            Send Mail to Doctor's
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:"></a>
                                <a class="fa fa-cog" href="javascript:"></a>
                                <a class="fa fa-times" href="javascript:"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form action="<?php echo base_url('notice/mail_to_doctor');?>" class="form-horizontal" method="post">
                                    
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
                                    <label for="Faculty" class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">                                          
                                        <?php
                                            $url = base_url('notice/get_doctor_lists');
                                            $ddp = "class='form-control m-bot15' id='year' onchange=get_doctor_list('$url')";
                                            echo form_dropdown('year', $current_fut_year, (isset($res) ? $res->year : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">                                          
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='session_id'  required onchange=get_doctor_list('$url')";
                                        echo form_dropdown('session', $session_list, '', $ddp);
                                        ?>
                                    </div>
                                    <label for="Course" class="control-label col-lg-2">Course <i class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">                                          
                                        <?php
                                        $url = base_url('setting/ajax_get_faculty_by_course');
                                        $ddp = "class='form-control m-bot15' id='course_code' required onchange=get_faculty_by_course('$url')";
//                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';                                           
                                        echo form_dropdown('course_code', $course_list, (isset($res) ? $res->course : ''), $ddp);
                                        ?>
                                    </div>
                                    
                                    <label for="Faculty" class="control-label col-lg-2">Faculty <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">                                          
                                        <?php
                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                        $ddp = "class='form-control m-bot15' id='faculty_code'  onchange=get_faculty_id('$url')";
                                        echo form_dropdown('faculty_code', $faculty_list, (isset($res) ? $res->faculty : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Batch/Subject <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">                                          
                                        <?php
                                        $url = base_url('notice/get_doctor_lists');
                                        $ddp = "class='form-control m-bot15' id='batch_code' required onchange=get_doctor_list('$url')";
                                        echo form_dropdown('batch_code', ['' => ''], (isset($res) ? $res->subject : ''), $ddp);
                                        ?>
                                    </div>
                                </div>                                   
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Doctor's List</label>
                                        <div class="col-lg-6">
                                            <?php
                                            $ddp = 'class="multi-select student_list" multiple="" id="doctor_id"';
                                            echo form_dropdown('doctor[]', ['' => ''],'',$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Name" class="control-label col-lg-2">Attach File</label>
                                        <div class="col-lg-4">
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
                                        <label for="Name" class="control-label col-lg-2">Subject</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="exam_name" name="email_sub" type="text" required/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label col-lg-2 col-sm-2">Message</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <textarea class="form-control" rows="6" name="mess_age" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-6">
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