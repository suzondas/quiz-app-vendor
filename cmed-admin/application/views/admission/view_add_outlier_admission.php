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

                <?php
                if (validation_errors()) {
                    echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>');
                }

                if ($this->session->flashdata('flashOK')) {
                    echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                    echo $this->session->flashdata('flashOK');
                    echo "</div>";
                }
                if ($this->session->flashdata('flashError')) {
                    echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                    echo $this->session->flashdata('flashError');
                    echo "</div>";
                }

                if ($form_action == "add" || $form_action == 'readmission') {
                    $action_url = base_url() . 'admission/save_outlier';
                    $btnval = 'SAVE';
                } elseif ($form_action == "edit") {
                    $action_url = base_url() . 'admission/update_outlier';
                    $btnval = 'UPDATE';
                }
                ?>
                <form class="cmxform form-horizontal" enctype="multipart/form-data" id="commentForm" role="form"
                      method="post"
                      action="<?php echo $action_url; ?>">
                    <input type="hidden" name="auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                    <input type="hidden" name="master_table_auto_id"
                           value="<?php echo isset($res->master_id) ? $res->master_id : ''; ?>">
                    <input type="hidden" name="readmission" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            <?php
                            if ($form_action == "add") {
                                echo 'Admission Form For Outlier';
                            } elseif ($form_action == "edit") {
                                echo 'Edit Form For Outlier';
                            } else {
                                echo 'Readmission Form For Outlier';
                            }
                            ?>

                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group ">
                                    <label for="Course" class="control-label col-lg-2">Institute <i
                                            class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='institute' required";
                                        echo form_dropdown('institute', $institute_list, (isset($res) ? $res->institute : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Faculty" class="control-label col-lg-2">Year <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='year'";
                                        echo form_dropdown('year', $current_fut_year, (isset($res) ? $res->year : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Session <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"  required';
                                        echo form_dropdown('session', $session_list, isset($res) ? $res->session : '', $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Course" class="control-label col-lg-2">Course <i class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">
                                        <?php
                                        $url = base_url('setting/ajax_get_course_by_faculty_id');
                                        $ddp = "class='form-control m-bot15' id='course_code' required onchange=get_faculty_id('$url')";
                                        //                                            $ddp = 'class="form-control m-bot15" required onchange="get_faculty_by_course('.$url.')"';
                                        echo form_dropdown('course_code', $course_list, (isset($res->course_code) ? $res->course_code : ''), $ddp);
                                        ?>
                                    </div>
                                    <!--                                </div>-->
                                    <!--                                <div class="form-group">-->

                                    <label for="Status" class="control-label col-lg-2">Batch/Subject <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php

                                        $ddp = 'class="form-control m-bot15" id="batch_code" required';
                                        echo form_dropdown('batch_code', $batch_list, (isset($res->batch_code) ? $res->batch_code : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Subject <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="subject_code" required';
                                        echo form_dropdown('subject', $subject_list, (isset($res) ? $res->subject : ''), $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Faculty" class="control-label col-lg-2">Faculty</label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='faculty_code'";
                                        echo form_dropdown('faculty_code', $faculty_list, (isset($res->faculty_code) ? $res->faculty_code : ''), $ddp);
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Admission Type <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        //echo $res->admi_type;
                                        $ddp = 'class="form-control m-bot15" id="admi_type" required';
                                        echo form_dropdown('admi_type', $admi_type, (isset($res->admi_type) ? $res->admi_type : ''), $ddp);
                                        ?>
                                    </div>

                                    <label for="Status" class="control-label col-lg-2">Service Package <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $url = base_url('setting/ajax_get_course_by_service_pack_fee');
                                        $ddp = "class='form-control m-bot15' id='ser_pack_id' onchange=get_course_code('$url')";
                                        echo form_dropdown('service_pack_id', $service_package, (isset($res) ? $res->service_pack_id : ''), $ddp);
                                        ?>
                                    </div>

                                </div>

                                <div class="form-group">

                                    <label for="Name" class="control-label col-lg-2">Medical College <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="medical_col"';
                                        echo form_dropdown('medical_col', $collage_list, isset($res) ? $res->medical_col : '', $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Fellow's Name <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="f_name" name="doc_name" type="text"
                                               value="<?php echo isset($res) ? $res->doc_name : '' ?>" required/>
                                    </div>


                                    <label for="Name" class="control-label col-lg-2">Blood Group <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="blood_gro" required';
                                        echo form_dropdown('blood_gro', $blood_group, (isset($res) ? $res->blood_gro : ''), $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Father's Name <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="f_name" name="father_name" type="text"
                                               value="<?php echo isset($res) ? $res->father_name : '' ?>" required/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Mother's Name <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="mother_name" name="mother_name" type="text"
                                               value="<?php echo isset($res) ? $res->mother_name : '' ?>" required/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">National ID <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="n_id" name="n_id" type="number"
                                               value="<?php echo isset($res) ? $res->n_id : '' ?>" minlength="10"
                                               maxlength="18" required/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Passport No </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="Passport" name="passport" type="text"
                                               value="<?php echo isset($res) ? $res->passport : '' ?>"/>

                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Job Description</label>
                                    <div class="col-lg-10">
                                        <input class=" form-control" id="f_tele_no" name="job_des" type="text"
                                               value="<?php echo isset($res) ? $res->job_des : '' ?>"/>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Contact No <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-10">
                                        <input class=" form-control" id="f_tele_no" name="phone" type="number"
                                               value="<?php echo isset($res) ? $res->phone : '' ?>" maxlength="11"/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Email <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="email" name="email" type="text"
                                               value="<?php echo isset($res) ? $res->email : '' ?>" required/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Facebook ID </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="f_cell_no" name="f_id" type="text"
                                               value="<?php echo isset($res) ? $res->f_id : '' ?>"/>

                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">BMDC No <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="f_name" name="bmdc_no" type="text"
                                               value="<?php echo isset($res) ? $res->bmdc_no : '' ?>" required/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">RCP Registration No <i
                                            class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="f_cell_no" name="rcp_reg_no" type="text"
                                               value="<?php echo isset($res) ? $res->rcp_reg_no : '' ?>"
                                               required/>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Contact person/spouse name </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="spouse_name" name="spouse_name" type="text"
                                               value="<?php echo isset($res) ? $res->spouse_name : '' ?>"/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Contact person/spouse mobile
                                        no </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="pouse_mobile" name="pouse_mobile" type="text"
                                               value="<?php echo isset($res) ? $res->pouse_mobile : '' ?>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Name" class="control-label col-lg-4">How did you become interested about
                                        Outlier? </label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="collage_type"';
                                        echo form_dropdown('answer_type', $answer_type, isset($res) ? $res->answer_type : '', $ddp);
                                        ?>
                                    </div>
                                    <!--                                     <label for="Name" class="control-label col-lg-2">Institute Roll No(After getting)</label>
                                                                        <div class="col-lg-1">
                                                                            <label>
                                                                                <input type="radio" name="ins_roll_status" onclick="javascript:yesnoCheck();" id="yesCheck" name="yesno" value="1"> Yes
                                                                                <input type="radio" name="ins_roll_status" onclick="javascript:yesnoCheck();" id="noCheck"  name="yesno" value="2"> No
                                                                                <input type="radio" onclick="yesnoCheck();" name="ins_roll_status" id="yesCheck" value="1"> Yes
                                                                            </label>
                                                                            <label><input type="radio" onclick="yesnoCheck();" name="ins_roll_status" id="noCheck" value="0"> No</label>
                                                                        </div>
                                                                         <div class="col-lg-3">

                                                                          <input class=" form-control"  type="text" name="ins_roll_no"  id='ifYes'>
                                                                        </div>-->
                                </div>

                            </div><!--dfadsfd-->
                        </div>
                    </section>
                    <!--Permanant address section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Permanant Address
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form">
                                        <!--                                        <header class="panel-heading">
                                                                                   
                                                                                </header>-->
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Division</th>
                                                <th>District</th>
                                                <th> Thana</th>
                                                <th>Address</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $url = base_url('admission/get_district_by_division');
                                                    $dropdown_js = "class='form-control m-bot15' id='division_id' onchange=getDistricttByAjax('$url')";
                                                    echo form_dropdown('per_divi', $division_list, isset($res) ? $res->per_divi : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url = base_url('admission/get_thana_by_district');
                                                    $dropdown_js = "class='form-control m-bot15' id='district_id' onchange=getThanaByAjax('$url')";//onchange="getDistricttByAjax();"
                                                    echo form_dropdown('per_dist', $mai_district_list, isset($res) ? $res->per_dist : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url = base_url() . 'admission/';
                                                    $dropdown_js = 'class="form-control m-bot15" id="thana_id"';
                                                    echo form_dropdown('per_thana', $mai_upazilla_list, isset($res) ? $res->per_thana : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="per_address"
                                                           value="<?php echo isset($res) ? $res->per_address : '' ?>">
                                                </td>
                                            </tr>

                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end address section-->
                    <!--Mailing address section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Mailing Address
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form">

                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Division</th>
                                                <th>District</th>
                                                <th>Thana</th>
                                                <th>Address</th>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $url = base_url('admission/get_district_by_division2');
                                                    $dropdown_js = "class='form-control m-bot15' id='division_id2' onchange=getDistricttByAjax2('$url')";
                                                    echo form_dropdown('mai_divi', $division_list, isset($res) ? $res->mai_divi : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url = base_url('admission/get_thana_by_district2');
                                                    $dropdown_js = "class='form-control m-bot15' id='district_id2' onchange=getThanaByAjax2('$url')";//onchange=getDistricttByAjax()
                                                    echo form_dropdown('mai_dist', $mai_district_list, isset($res) ? $res->mai_dist : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url = base_url() . 'admission/';
                                                    $dropdown_js = 'class="form-control m-bot15" id="thana_id2"';
                                                    echo form_dropdown('mai_thana', $mai_upazilla_list, isset($res) ? $res->mai_thana : '', $dropdown_js);
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="mai_address"
                                                           value="<?php echo isset($res) ? $res->mai_address : '' ?>">
                                                </td>

                                            </tr>

                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end Mailing address section-->

                    <!--add new section-->

                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Educational Qualification
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form">
                                        <!--                                        <header class="panel-heading">
                                                                                   
                                                                                </header>-->
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Name Of Examination</th>
                                                <th>Passing Year</th>
                                                <th>Group/Batch/Session</th>
                                                <th>Board</th>

                                                <th>Institute Name</th>
                                                <th>Result(GPA/DIVISION)</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    //echo $edu_record[0]->exam_name;
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_name[]', $ssc_exam_array, isset($edu_record[0]->exam_name) ? $edu_record[0]->exam_name : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('pass_year[]', $year_array, isset($edu_record[0]) ? $edu_record[0]->pass_year : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_group[]', $group, isset($edu_record[0]) ? $edu_record[0]->exam_group : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_board[]', $edu_board, isset($edu_record[0]) ? $edu_record[0]->exam_board : '', $ddp);
                                                    ?>
                                                </td>
                                                <td><input class=" form-control" id="" name="exam_ins[]"
                                                           value="<?php echo isset($edu_record[0]) ? $edu_record[0]->exam_ins : ''; ?>"
                                                           type="text"
                                                    /></td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset($edu_record[0]) ? $edu_record[0]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_name[]', $hsc_exam_array, isset($edu_record[1]) ? $edu_record[1]->exam_name : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('pass_year[]', $year_array, isset($edu_record[1]) ? $edu_record[1]->pass_year : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_group[]', $group, isset($edu_record[1]) ? $edu_record[1]->exam_group : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_board[]', $edu_board, isset($edu_record[1]) ? $edu_record[1]->exam_board : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <input class=" form-control" id="hsc_ins" name="exam_ins[]"
                                                           type="text"
                                                           value="<?php echo isset($edu_record[1]) ? $edu_record[1]->exam_ins : '' ?>"/>
                                                </td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset($edu_record[1]) ? $edu_record[1]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_name[]', $mbbs_exam_array, isset($edu_record[2]) ? $edu_record[2]->exam_name : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('pass_year[]', $year_array, isset($edu_record[2]) ? $edu_record[2]->pass_year : '', $ddp);
                                                    ?>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <!--                                                    <input class=" form-control" id="last_name" name="exam_ins[]" type="text" value="<?php echo isset($edu_record[2]->exam_ins) ? $edu_record[2]->exam_ins : '' ?>"
                                                       />-->
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15" id="medical_col"';
                                                    echo form_dropdown('exam_ins[]', $collage_list, (isset($edu_record[2]) ? $edu_record[2]->exam_ins : ''), $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset($edu_record[2]) ? $edu_record[2]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_name[]', $fc_exam_array, isset($edu_record[3]) ? $edu_record[3]->exam_name : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('pass_year[]', $year_array, isset($edu_record[3]) ? $edu_record[3]->pass_year : '', $ddp);
                                                    ?>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <!--                                                    <input class=" form-control" id="last_name" name="exam_ins[]" type="text" value="<?php echo isset($edu_record[3]) ? $edu_record[3]->exam_ins : '' ?>"
                                                               />-->
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15" id="medical_col"';
                                                    echo form_dropdown('exam_ins[]', $collage_list, (isset($edu_record[3]) ? $edu_record[3]->exam_ins : ''), $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    //$ddp = 'class="form-control" required';
                                                    // echo form_dropdown('section_id', $hsc_result_array, '', $ddp);
                                                    ?>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset($edu_record[3]) ? $edu_record[3]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('exam_name[]', $md_exam_array, isset($edu_record[4]) ? $edu_record[4]->exam_name : '', $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown('pass_year[]', $year_array, isset($edu_record[4]) ? $edu_record[4]->pass_year : '', $ddp);
                                                    ?>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <!--                                                    <input class=" form-control" id="last_name" name="exam_ins[]" type="text" value="<?php echo isset($edu_record[4]) ? $edu_record[4]->exam_ins : ''; ?>"
                                                               />-->
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15" id="medical_col"';
                                                    echo form_dropdown('exam_ins[]', $collage_list, (isset($edu_record[4]) ? $edu_record[4]->exam_ins : ''), $ddp);
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset($edu_record[4]) ? $edu_record[4]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end new section-->
                    <?php if ($form_action == "add") { ?>
                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel panel-info">
                                    <header class="panel-heading">
                                        Discount
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form">

                                            <table class="table table-bordered">
                                                <tr>
                                                    <td>Fee Amount</td>
                                                    <td>
                                                        <input type="text" disabled class="form-control" id="fee_amount"
                                                               name="fee_amount">
                                                    </td>
                                                    <td colspan="2"></td>

                                                </tr>
                                                <tr>
                                                    <td>Discount Amount</td>
                                                    <td>
                                                        <input type="text" class="form-control" name="discount_amont"
                                                               onchange="calculate_final_amount(this)">
                                                    </td>
                                                    <td>Authorized By</td>
                                                    <td>
                                                        <input type="text" class="form-control" name="dis_auth_by">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Final Amount</td>
                                                    <td>
                                                        <input type="text" disabled class="form-control"
                                                               id="final_amount">
                                                    </td>
                                                    <td colspan="2"></td>

                                                </tr>
                                            </table>

                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Inportant Referance
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form">

                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Name</th>
                                                <th>Designation</th>
                                                <th>Mobile</th>
                                                <th>Relation</th>
                                            </tr>
                                            <tr>
                                                <td><input type="text" name="name[]"
                                                           value="<?php echo isset($reference[0]) ? $reference[0]->name : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="designation[]"
                                                           value="<?php echo isset($reference[0]) ? $reference[0]->designation : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="mobile[]"
                                                           value="<?php echo isset($reference[0]) ? $reference[0]->mobile : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="relation[]"
                                                           value="<?php echo isset($reference[0]) ? $reference[0]->relation : '' ?>"
                                                           class="form-control"></td>

                                            </tr>
                                            <tr>
                                                <td><input type="text" name="name[]"
                                                           value="<?php echo isset($reference[1]) ? $reference[1]->name : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="designation[]"
                                                           value="<?php echo isset($reference[1]) ? $reference[1]->designation : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="mobile[]"
                                                           value="<?php echo isset($reference[1]) ? $reference[1]->mobile : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="relation[]"
                                                           value="<?php echo isset($reference[1]) ? $reference[1]->relation : '' ?>"
                                                           class="form-control"></td>

                                            </tr>
                                            <tr>
                                                <td><input type="text" name="name[]"
                                                           value="<?php echo isset($reference[2]) ? $reference[2]->name : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="designation[]"
                                                           value="<?php echo isset($reference[2]) ? $reference[2]->designation : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="mobile[]"
                                                           value="<?php echo isset($reference[2]) ? $reference[2]->mobile : '' ?>"
                                                           class="form-control"></td>
                                                <td><input type="text" name="relation[]"
                                                           value="<?php echo isset($reference[2]) ? $reference[2]->relation : '' ?>"
                                                           class="form-control"></td>

                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <!--start image section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    Applicant's Image
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Photographs of Fellow <i
                                                class="fa fa-asterisk ipd-star"></i><br>
                                            (Image Size:100Kb Max, width & height(300 X 300 Pixel), only (.jpg) is
                                            allowed to upload)
                                        </label>
                                        <div class="col-lg-4">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <?php if (!empty($res->photo)) echo "<img src='" . base_url($res->photo) . "'"; ?>
                                                    <img
                                                        src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Photo+image"
                                                        alt=""/>
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail"
                                                     style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="photo_image" class="default"/>
                                                    </span>
                                                    <a href="#" class="btn btn-danger fileupload-exists"
                                                       data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Applicant's Signature<br>
                                            (Signature Size:50Kb Max, width & height(300 X 80 Pixel), only (.jpg) is
                                            allowed to upload)
                                        </label>
                                        <div class="col-lg-4">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail"
                                                     style="width: 300px; height: 80px;">
                                                    <?php if (!empty($res->sign)) echo "<img src='" . base_url($res->sign) . "'"; ?>
                                                    <img
                                                        src="http://www.placehold.it/300x80/EFEFEF/AAAAAA&amp;text=Signature+image"
                                                        alt="" style="width: 300px; height: 80px;"/>
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail"
                                                     style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="sig_name" class="default"/>
                                                    </span>
                                                    <a href="#" class="btn btn-danger fileupload-exists"
                                                       data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-2">
                                            <button class="btn btn-primary"
                                                    type="submit"><?php echo $btnval; ?></button>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end image section-->


                </form>
            </div>
        </div>
        <!-- page end-->


    </section>
</section>
<!--main content end-->


<?php
$this->load->view('footer/view_footer');
?>    