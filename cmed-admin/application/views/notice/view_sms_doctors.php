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
                            Send SMS to Doctor's
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:"></a>
                                <a class="fa fa-cog" href="javascript:"></a>
                                <a class="fa fa-times" href="javascript:"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form action="<?php echo base_url('notice/sms_to_doctors')?>"  method="post" class="form-horizontal ">
                                    
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
                                        <label for="Name" class="control-label col-lg-3">Doctor's Name</label>
                                        <div class="col-lg-6">
                                            <?php
                                            $ddp = 'class="multi-select student_list" multiple="" id="doctor_id"';
                                            echo form_dropdown('doctors[]',['' => ''],'',$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label col-lg-3 col-sm-3">Message</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <textarea name ="message" class="form-control" rows="6"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <button class="btn btn-primary" type="submit">Send SMS</button>
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