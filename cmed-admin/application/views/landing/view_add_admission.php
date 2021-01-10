<?php
$this->load->view( 'header/view_landing_header' );
$current_date = date( 'Y-m-d' );
?>

<!--main content start-->
<section id="" class="container">
    <section class="">
        <!-- page start-->

        <div class="row jnn-admission">
            <div class="col-lg-12">

                <h2 class="text-center">ADMISSION FORM</h2>

                <p class="text-danger text-center">All Star (*) marks field are mandatory. <br>
                    Please fill-up the application form in English. br
                    For better performance use Mozilla Firefox &amp; Google Chrome latest version.
                </p>
                
                <?php
                if ( validation_errors() ) {
                    echo validation_errors( '<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>' );
                }
                
                if ( $this->session->flashdata( 'flashOK' ) ) {
                    echo "<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                    echo $this->session->flashdata( 'flashOK' );
                    echo "</div>";
                }
                if ( $this->session->flashdata( 'flashError' ) ) {
                    echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                    echo $this->session->flashdata( 'flashError' );
                    echo "</div>";
                }
                ?>
                <form class="cmxform form-horizontal" enctype="multipart/form-data" id="" role="form"
                      method="post"
                      action="<?php echo site_url( 'landing/save' ); ?>">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            BASIC INFORMATION
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group ">
                                    <label for="Faculty" class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = "class='form-control' id='year' required";
                                        echo form_dropdown( 'year', $current_fut_year, ( isset( $res ) ? $res->year : '' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="Status" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control"  required';
                                        echo form_dropdown( 'session', $session_list, ( isset( $res->session ) ) ? $res->session : '', $ddp );
                                        ?>
                                    </div>
                                </div>


                                <div class="form-group ">
                                    <label for="doc_name" class="control-label col-lg-2">Fellow Name <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="doc_name" name="doc_name" type="text"
                                               value="<?php echo isset( $res->doc_name ) ? $res->doc_name : '' ?>"
                                               required/>
                                    </div>

                                    <label for="bmdc_no" class="control-label col-lg-2">BMDC Registration No <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="bmdc_no" name="bmdc_no" type="text"
                                               value="<?php echo isset( $res->bmdc_no ) ? $res->bmdc_no : '' ?>"
                                               required/>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="father_name" class="control-label col-lg-2">Father's Name <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="father_name" name="father_name" type="text"
                                               value="<?php echo isset( $res->father_name ) ? $res->father_name : '' ?>"
                                               required/>
                                    </div>
                                    <label for="mother_name" class="control-label col-lg-2">Mother's Name <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="mother_name" name="mother_name" type="text"
                                               value="<?php echo isset( $res->mother_name ) ? $res->mother_name : '' ?>"
                                               required/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="email" class="control-label col-lg-2">Email Address <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="email" name="email" type="text"
                                               value="<?php echo isset( $res->email ) ? $res->email : '' ?>" required/>
                                    </div>
                                    <label for="phone" class="control-label col-lg-2">Mobile No <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control number-only" id="phone" name="phone" type="text"
                                               value="<?php echo isset( $res->phone ) ? $res->phone : '' ?>"
                                               maxlength="11" minlength="11" required/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">National ID <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <input class=" form-control number-only" id="n_id" name="n_id" type="text"
                                               value="<?php echo isset( $res->n_id ) ? $res->n_id : '' ?>"
                                               minlength="10" maxlength="17" required/>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Passport No </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="Passport" name="passport" type="text"
                                               value="<?php echo isset( $res->passport ) ? $res->passport : '' ?>"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="Name" class="control-label col-lg-2">Date of birth <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <input type="text" name="dob" class="form-control datepicker" required readonly>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Blood Group <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control" id="blood_gro" required';
                                        echo form_dropdown( 'blood_gro', $blood_group, ( isset( $res->blood_gro ) ? $res->blood_gro : '' ), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="gender" class="control-label col-lg-2">Gender <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control" id="gender" required';
                                        echo form_dropdown( 'gender', $sex_array, ( isset( $res->gender ) ? $res->gender : '' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="marital_status" class="control-label col-lg-2">Marital status <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control" id="marital_status" required';
                                        echo form_dropdown( 'marital_status', $marital_status_array, ( isset( $res->marital_status ) ? $res->marital_status : '' ), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="religion" class="control-label col-lg-2">Religion <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control" id="religion" required';
                                        echo form_dropdown( 'religion', $religion_array, ( isset( $res->religion ) ? $res->religion : '' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="nationality" class="control-label col-lg-2">Nationality </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="nationality" name="nationality" type="text"
                                               value="<?php echo isset( $res->nationality ) ? $res->nationality : '' ?>"/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="fb_id" class="control-label col-lg-2">Facebook ID </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="fb_id" name="fb_id" type="text"
                                               value="<?php echo isset( $res->fb_id ) ? $res->fb_id : '' ?>"/>
                                    </div>
                                    <label for="skype" class="control-label col-lg-2">Skype ID </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="skype" name="skype" type="text"
                                               value="<?php echo isset( $res->skype ) ? $res->skype : '' ?>"/>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="viber" class="control-label col-lg-2">Viber Account No </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="viber" name="viber" type="text"
                                               value="<?php echo isset( $res->viber ) ? $res->viber : '' ?>"/>

                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="spouse_name" class="control-label col-lg-2">Contact person name </label>
                                    <div class="col-lg-4">
                                        <input class=" form-control" id="spouse_name" name="spouse_name" type="text"
                                               value="<?php echo isset( $res->spouse_name ) ? $res->spouse_name : '' ?>"/>
                                    </div>
                                    <label for="spouse_mobile" class="control-label col-lg-2">Contact person mobile
                                        no </label>
                                    <div class="col-lg-4">
                                        <input class="form-control number-only" id="spouse_mobile" name="spouse_mobile"
                                               type="text"
                                               value="<?php echo isset( $res->spouse_mobile ) ? $res->spouse_mobile : '' ?>"
                                               maxlength="11" minlength="11"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pt_call" class="control-label col-lg-2">Preferred time of Call</label>
                                    <div class="col-lg-4">
                                        <input class="form-control timepicker" id="pt_call" name="pt_call" type="time"
                                               value="<?php echo isset( $res->pt_call ) ? $res->pt_call : '' ?>"/>
                                    </div>

                                    <label for="pw_payment" class="control-label col-lg-2">Proposed way of payment</label>
                                    <div class="col-lg-4">
                                        <input class="form-control" id="pw_payment" name="pw_payment" type="text"
                                               value="<?php echo isset( $res->pw_payment ) ? $res->pw_payment : '' ?>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="present_work_place" class="control-label col-lg-2">Present place of
                                        work</label>
                                    <div class="col-lg-4">
                                        <input class="form-control" id="present_work_place" name="present_work_place"
                                               type="text"
                                               value="<?php echo isset( $res->present_work_place ) ? $res->present_work_place : '' ?>"/>
                                    </div>
                                    <label for="job_description" class="control-label col-lg-2">Job description</label>
                                    <div class="col-lg-4">
                                        <input class="form-control" id="job_description" name="job_description"
                                               type="text"
                                               value="<?php echo isset( $res->job_description ) ? $res->job_description : '' ?>"/>
                                    </div>
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
                                                <th width="25%">Division</th>
                                                <th width="25%">District</th>
                                                <th width="25%"> Thana</th>
                                                <th width="25%">Address</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $url         = base_url( 'landing/get_district_by_division' );
                                                    $dropdown_js = "class='form-control' id='division_id' onchange=getDistricttByAjax('$url')";
                                                    echo form_dropdown( 'per_divi', $division_list, isset( $res->per_divi ) ? $res->per_divi : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url         = base_url( 'landing/get_thana_by_district' );
                                                    $dropdown_js = "class='form-control' id='district_id' onchange=getThanaByAjax('$url')";//onchange="getDistricttByAjax();"
                                                    echo form_dropdown( 'per_dist', $mai_district_list, isset( $res->per_dist ) ? $res->per_dist : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url         = base_url() . 'landing/';
                                                    $dropdown_js = 'class="form-control" id="thana_id"';
                                                    echo form_dropdown( 'per_thana', $mai_upazilla_list, isset( $res->per_thana ) ? $res->per_thana : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="per_address"
                                                           value="<?php echo isset( $res->per_address ) ? $res->per_address : '' ?>">
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
                                        <!--                                        <header class="panel-heading">

                                                                                </header>-->
                                        <table class="table table-bordered">
                                            <tr>
                                                <th width="25%">Division</th>
                                                <th width="25%">District</th>
                                                <th width="25%">Thana</th>
                                                <th width="25%">Address</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $url         = base_url( 'landing/get_district_by_division2' );
                                                    $dropdown_js = "class='form-control' id='division_id2' onchange=getDistricttByAjax2('$url')";
                                                    echo form_dropdown( 'mai_divi', $division_list, isset( $res->mai_divi ) ? $res->mai_divi : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url         = base_url( 'landing/get_thana_by_district2' );
                                                    $dropdown_js = "class='form-control' id='district_id2' onchange=getThanaByAjax2('$url')";//onchange=getDistricttByAjax()
                                                    echo form_dropdown( 'mai_dist', $mai_district_list, isset( $res->mai_dist ) ? $res->mai_dist : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $url         = base_url() . 'landing/';
                                                    $dropdown_js = 'class="form-control" id="thana_id2"';
                                                    echo form_dropdown( 'mai_thana', $mai_upazilla_list, isset( $res->mai_thana ) ? $res->mai_thana : '', $dropdown_js );
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="mai_address"
                                                           value="<?php echo isset( $res->mai_address ) ? $res->mai_address : '' ?>">
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
                                                    echo form_dropdown( 'exam_name[]', $ssc_exam_array, isset( $edu_record[0]->exam_name ) ? $edu_record[0]->exam_name : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'pass_year[]', $year_array, isset( $edu_record[0] ) ? $edu_record[0]->pass_year : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_group[]', $group, isset( $edu_record[0] ) ? $edu_record[0]->exam_group : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_board[]', $edu_board, isset( $edu_record[0] ) ? $edu_record[0]->exam_board : '', $ddp );
                                                    ?>
                                                </td>
                                                <td><input class=" form-control" id="" name="exam_ins[]"
                                                           value="<?php echo isset( $edu_record[0] ) ? $edu_record[0]->exam_ins : ''; ?>"
                                                           type="text"
                                                    /></td>
                                                <td>
                                                    <?php
                                                    //$ddp = 'class="form-control" required';
                                                    // echo form_dropdown('ssc_gpa', $hsc_result_array, '', $ddp);
                                                    ?>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset( $edu_record[0] ) ? $edu_record[0]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_name[]', $hsc_exam_array, isset( $edu_record[1] ) ? $edu_record[1]->exam_name : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'pass_year[]', $year_array, isset( $edu_record[1] ) ? $edu_record[1]->pass_year : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_group[]', $group, isset( $edu_record[1] ) ? $edu_record[1]->exam_group : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_board[]', $edu_board, isset( $edu_record[1] ) ? $edu_record[1]->exam_board : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <input class=" form-control" id="hsc_ins" name="exam_ins[]"
                                                           type="text"
                                                           value="<?php echo isset( $edu_record[1] ) ? $edu_record[1]->exam_ins : '' ?>"/>
                                                </td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset( $edu_record[1] ) ? $edu_record[1]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_name[]', $mbbs_exam_array, isset( $edu_record[2] ) ? $edu_record[2]->exam_name : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'pass_year[]', $year_array, isset( $edu_record[2] ) ? $edu_record[2]->pass_year : '', $ddp );
                                                    ?>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <!--                                                    <input class=" form-control" id="last_name" name="exam_ins[]" type="text" value="<?php echo isset( $edu_record[2]->exam_ins ) ? $edu_record[2]->exam_ins : '' ?>"
                                                       />-->
                                                    <?php
                                                    $ddp = 'class="form-control" id="medical_col"';
                                                    echo form_dropdown( 'exam_ins[]', $collage_list, ( isset( $edu_record[2] ) ? $edu_record[2]->exam_ins : '' ), $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset( $edu_record[2] ) ? $edu_record[2]->exam_result : '' ?>"
                                                           class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'exam_name[]', $fc_exam_array, isset( $edu_record[3] ) ? $edu_record[3]->exam_name : '', $ddp );
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $ddp = 'class="form-control"';
                                                    echo form_dropdown( 'pass_year[]', $year_array, isset( $edu_record[3] ) ? $edu_record[3]->pass_year : '', $ddp );
                                                    ?>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <!--                                                    <input class=" form-control" id="last_name" name="exam_ins[]" type="text" value="<?php echo isset( $edu_record[3] ) ? $edu_record[3]->exam_ins : '' ?>"
                                                               />-->
                                                    
                                                    <?php
                                                    //$ddp = 'class="form-control" id="medical_col"';
                                                    //echo form_dropdown('exam_ins[]', $collage_list,(isset($edu_record[3]) ? $edu_record[3]->exam_ins : ''), $ddp);
                                                    ?>
                                                    <input class=" form-control" id="hsc_ins" name="exam_ins[]"
                                                           type="text"
                                                           value="<?php echo isset( $edu_record[1] ) ? $edu_record[1]->exam_ins : '' ?>"/>
                                                </td>
                                                <td>
                                                    <?php
                                                    //$ddp = 'class="form-control" required';
                                                    // echo form_dropdown('section_id', $hsc_result_array, '', $ddp);
                                                    ?>
                                                    <input type="text" name="exam_result[]"
                                                           value="<?php echo isset( $edu_record[3] ) ? $edu_record[3]->exam_result : '' ?>"
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

                    <!--teaching exp section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    TEACHING EXPERIENCE
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
                                                <th>Institute Name</th>
                                                <th>Designation</th>
                                                <th>Length of Service</th>
                                                <th>Action</th>

                                            </tr>
                                            <tr class="each-row">
                                                <td>
                                                    <input type="text" class="form-control" name="exp_inst_name[]" value="">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="exp_designation[]" value="">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="exp_los[]" value="">
                                                </td>
                                                <td class="text-center">
                                                    <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                    <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end teaching exp section-->

                    <!--training section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    OTHER TRAINING PROGRAM ATTENDED
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
                                                <th>Training Name</th>
                                                <th>Duration</th>
                                                <th>Organization</th>
                                                <th>Action</th>
                                            </tr>
                                            <tr class="each-row">
                                                <td>
                                                    <input type="text" class="form-control" name="training_name[]" value="">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="training_duration[]" value="">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="training_organization[]" value="">
                                                </td>
                                                <td class="text-center">
                                                    <a href="#" onclick="add_more(this, event)" class="btn btn-primary">Add More</a>
                                                    <a href="#" onclick="remove_item(this, event)" class="btn btn-danger remove">Remove</a>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--end training section-->

                    <!--start image section-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    DOCUMENTS
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-cog" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                    </span>
                                </header>
                                <div class="panel-body">
                                    <p>
                                        <span class="label label-warning">Each document Size: 500Kb Max and only (jpg/png/pdf) is allowed to upload</span>
                                    </p>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">
                                            MBBS Certificate
                                            <!-- <i class="fa fa-asterisk ipd-star"></i> -->
                                        </label>
                                        <div class="col-lg-3">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select File</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="doc_mbbs" class="default">
                                                    </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                            </div>

                                        </div>
                                        <label for="Name" class="control-label col-lg-3">
                                            POST Graduate Certificate
                                            <!-- <i class="fa fa-asterisk ipd-star"></i> -->
                                        </label>
                                        <div class="col-lg-3">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select File</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="doc_pg" class="default">
                                                    </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <!-- <label for="Name" class="control-label col-lg-3">
                                            Permission from Head of the Institute
                                            <i class="fa fa-asterisk ipd-star"></i>
                                        </label>
                                        <div class="col-lg-3">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select File</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="doc_phi" class="default">
                                                    </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                            </div>

                                        </div> -->
                                        <label for="Name" class="control-label col-lg-3">
                                            NID
                                            <!-- <i class="fa fa-asterisk ipd-star"></i> -->
                                        </label>
                                        <div class="col-lg-3">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select File</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="doc_nid" class="default">
                                                    </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                            </div>

                                        </div>
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
                                        <label for="Name" class="control-label col-lg-2">Photographs of Fellow <i class="fa fa-asterisk ipd-star"></i><br>
                                            (Image Size:100Kb Max, width &amp; height(300 X 300 Pixel), only (.jpg) is
                                            allowed to upload)
                                        </label>
                                        <div class="col-lg-4">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <?php if ( !empty( $res->photo ) ) echo "<img src='" . base_url( $res->photo ) . "'"; ?>
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Photo+image"
                                                         alt=""/>
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail"
                                                     style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select Photo</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="photo_image" class="default" required/>
                                                    </span>
                                                    <a href="#" class="btn btn-danger fileupload-exists"
                                                       data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Applicant's Signature
                                            <!-- <i class="fa fa-asterisk ipd-star"></i> -->
                                            <br>
                                            (Signature Size:50Kb Max, width &amp; height(300 X 80 Pixel), only (.jpg) is
                                            allowed to upload)
                                        </label>
                                        <div class="col-lg-4">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail"
                                                     style="width: 300px; height: 80px;">
                                                    <?php if ( !empty( $res->sign ) ) echo "<img src='" . base_url( $res->sign ) . "'"; ?>
                                                    <img src="http://www.placehold.it/300x80/EFEFEF/AAAAAA&amp;text=Signature+image"
                                                         alt="" style="width: 300px; height: 80px;"/>
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail"
                                                     style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select Signature</span>
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
                                        <div class="col-md-12">
                                            <p><span class="label label-primary">Total course fee 25,000.00 Taka should be deposited at any cash counter of BIRDEM under "Certificate Course in Medical Education".</span>
                                            </p>
                                            <p><span class="label label-primary">Course fee should be deposited after you are selected for the course.</span></p>
                                        </div>
                                    </div>

                                    <div class="form-group text-center">
                                        <!-- <div class="col-lg-offset-2 col-lg-2"> -->
                                        <!--                                            <button class="btn btn-primary" type="submit" >SAVE & SUBMIT</button>-->
                                        <button class="btn btn-success btn-lg" type="submit" onclick="jnn_submitter(this, event)">SAVE &amp; SUBMIT</button>
                                        <!-- </div> -->
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
$this->load->view( 'footer/view_landing_footer' );
?>

<script type="text/javascript">
    $('.datepicker').datepicker({format: "yyyy-mm-dd", autoclose: true, startView: 'years'});
</script>
