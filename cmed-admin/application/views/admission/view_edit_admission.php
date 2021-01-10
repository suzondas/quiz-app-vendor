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
                    <section class="panel">
                        <header class="panel-heading">
                            <i class="fa fa-user"></i> Edit Student Admission Information
                            <span class="tools pull-right">
                                
                             </span>
                        </header>
                        <div class="form">
                            <form enctype="multipart/form-data" class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url().'admission/update'; ?>">
                                <?php
                                if (validation_errors()) {
                                    echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>', '</div>');
                                }
                                ?>
                                <header class="panel-heading tab-bg-dark-navy-blue ">
                                    <ul class="nav nav-tabs">
                                        <li class="active">
                                            <a data-toggle="tab" href="#tab-1">Student Details</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-2">Parent Details</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-3">Medical Examination</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-4">Medical History</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-5">Previous Details</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-6">Siblings</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-7">Others</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-8">Office Use</a>
                                        </li>
                                    </ul>
                                </header>
                                <div class="panel-body">
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name - First</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="first_name" name="first_name" type="text" value="<?php echo $res->first_name; ?>" required/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Middle</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="middle_name" name="middle_name" value="<?php echo $res->middle_name; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Last</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="last_name" name="last_name" value="<?php echo $res->last_name; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Class</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                        $ddp = 'class="form-control m-bot15" required';
                                                        echo form_dropdown('candidate_for_class', $class_list,set_value('candidate_for_class',(isset($res->candidate_for_class)) ? $res->candidate_for_class : ''),$ddp);
                                                    ?>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Section</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                        $ddp = 'class="form-control m-bot15" required';
                                                        echo form_dropdown('section_id', $section_list,set_value('section_id',(isset($res->section_id)) ? $res->section_id : ''),$ddp);
                                                    ?>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Group</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                        $ddp = 'class="form-control m-bot15" required';
                                                        echo form_dropdown('group_id', $group_list,set_value('session',(isset($res->group_id)) ? $res->group_id : ''),$ddp);
                                                    ?>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Intended starting date</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="starting_date" readonly="" value="<?php echo $res->starting_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Year</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                        $ddp = 'class="form-control m-bot15" required';
                                                        echo form_dropdown('year', $year_array,set_value('year',(isset($res->year)) ? $res->year : ''),$ddp);
                                                    ?>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Session</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                        $ddp = 'class="form-control m-bot15" required';
                                                        echo form_dropdown('session', $session_list,set_value('session',(isset($res->session)) ? $res->session : ''),$ddp);
                                                    ?>
                                                </div>
                                                
                                            </div>
                                            <div class="form-group ">
                                                
                                                <label for="Name" class="control-label col-lg-2">Date of Birth</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="dob" readonly="" value="<?php echo $res->dob;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Place of Birth</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="pob" name="pob" value="<?php echo $res->pob;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Gender</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15"';
                                                    echo form_dropdown('gender', $sex_array,set_value('gender',(isset($res->gender)) ? $res->gender : ''),$ddp);
                                                    ?>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Religion</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15"';
                                                    echo form_dropdown('religion', $religion_array,set_value('religion',(isset($res->religion)) ? $res->religion : ''),$ddp);
                                                    ?>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Passport no</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="passport_no" name="passport_no" value="<?php echo $res->passport_no;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Nationality</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="nationality" name="nationality" value="<?php echo $res->nationality;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Position in family</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15"';
                                                    echo form_dropdown('position_in_family', $position_in_family_array,set_value('position_in_family',(isset($res->position_in_family)) ? $res->position_in_family : ''),$ddp);
                                                    ?>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Native language</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="native_language" name="native_language" value="<?php echo $res->native_language;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Spoken languages</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="spoken_lang" name="spoken_lang" value="<?php echo $res->spoken_lang;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Proficiency in English</label>
                                                <div class="col-lg-2">
                                                    <?php 
                                                    $ddp = 'class="form-control m-bot15"';
                                                    echo form_dropdown('pro_in_eng', $proficiency_in_english_array,set_value('pro_in_eng',(isset($res->pro_in_eng)) ? $res->pro_in_eng : ''),$ddp);
                                                    ?>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Address in Dhaka</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="address" name="address" value="<?php echo $res->address;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Attach copy of birth certificate</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="birth_certificate" class="default" />
                                                        </span>
                                                        <span class="fileupload-preview" style="margin-left:5px;"><a href="<?php echo base_url().$res->attach_location.$res->birth_certificate;?>" target="_blank"><?php echo $res->birth_certificate;?></a></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Attach copy of passport(Foreigners Only)</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-white btn-file">
                                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                            <input type="file" name="passport_copy" class="default" />
                                                        </span>
                                                        <span class="fileupload-preview" style="margin-left:5px;"><a href="<?php echo base_url().$res->attach_location.$res->passport_copy;?>" target="_blank"><?php echo $res->passport_copy;?></a></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Attach recent passport-sizes photographs of student</label>
                                                <div class="col-lg-10">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <img src="<?php echo base_url().$res->attach_location.$res->student_photo;?>" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                            <span class="btn btn-white btn-file">
                                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                <input type="file" name="student_photo" class="default" />
                                                            </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-2" class="tab-pane">
                                            <h3 class="prf-border-head">Mother Information</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Mother's Full Name</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="m_name" name="m_name" value="<?php echo $res->m_name; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Date of birth</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="m_dob" readonly="" value="<?php echo $res->m_dob;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Place of birth</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_pob" name="m_pob" value="<?php echo $res->m_pob; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Nationality</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_nationality" name="m_nationality" value="<?php echo $res->m_nationality; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Passport no</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="m_passport_no" name="m_passport_no" value="<?php echo $res->m_passport_no; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">National ID</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="m_nid" name="m_nid" value="<?php echo $res->m_nid; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Education Qualification</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="m_edu_qua" name="m_edu_qua" value="<?php echo $res->m_edu_qua; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Occupation</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="m_occupation" name="m_occupation" value="<?php echo $res->m_occupation; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Designation</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="m_designation" name="m_designation" value="<?php echo $res->m_designation; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Company name</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="m_company_name" name="m_company_name" value="<?php echo $res->m_company_name; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Business address</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="m_office_add" name="m_office_add" value="<?php echo $res->m_office_add; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Telephone</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_tele_no" name="m_tele_no" value="<?php echo $res->m_tele_no; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Fax</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_fax" name="m_fax" value="<?php echo $res->m_fax; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">E-mail</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_email" name="m_email" value="<?php echo $res->m_email; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Home address</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="m_home_add" name="m_home_add" value="<?php echo $res->m_home_add;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Telephone</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_tele_no2" name="m_tele_no2" value="<?php echo $res->m_tele_no2; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Fax</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_fax2" name="m_fax2" value="<?php echo $res->m_fax2; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">E-mail</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_email2" name="m_email2" value="<?php echo $res->m_email2; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Mobile 1</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_cell_no" name="m_cell_no" value="<?php echo $res->m_cell_no; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Mobile 2</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_cell_no2" name="m_cell_no2" value="<?php echo $res->m_cell_no2; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Mobile 3</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="m_cell_no3" name="m_cell_no3" value="<?php echo $res->m_cell_no3; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <h3 class="prf-border-head">Father Information</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Fathers's Full Name</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="f_name" name="f_name" value="<?php echo $res->f_name; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Date of birth</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="f_dob" readonly="" value="<?php echo $res->f_dob;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Place of birth</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_pob" name="f_pob" value="<?php echo $res->f_pob;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Nationality</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_nationality" name="f_nationality" value="<?php echo $res->f_nationality;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Passport no</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="f_passport_no" name="f_passport_no" value="<?php echo $res->f_passport_no;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">National ID</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="f_nid" name="f_nid" value="<?php echo $res->f_nid;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Education Qualification</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="f_edu_qua" name="f_edu_qua" value="<?php echo $res->f_edu_qua; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Occupation</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="f_occupation" name="f_occupation" value="<?php echo $res->f_occupation; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Designation</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="f_designation" name="f_designation" value="<?php echo $res->f_designation; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Company name</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="f_company_name" name="f_company_name" value="<?php echo $res->f_company_name; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Business address</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="f_office_add" name="f_office_add" value="<?php echo $res->f_office_add; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Telephone</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_tele_no" name="f_tele_no" value="<?php echo $res->f_tele_no; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Fax</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_fax" name="f_fax" value="<?php echo $res->f_fax; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">E-mail</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_email" name="f_email" value="<?php echo $res->f_email; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Home address</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="f_home_add" name="f_home_add" value="<?php echo $res->f_home_add;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Telephone</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_tele_no2" name="f_tele_no2" value="<?php echo $res->f_tele_no2;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Fax</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_fax2" name="f_fax2" value="<?php echo $res->f_fax2;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">E-mail</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_email2" name="f_email2" value="<?php echo $res->f_email2;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Mobile 1</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_cell_no" name="f_cell_no" value="<?php echo $res->f_cell_no; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Mobile 2</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_cell_no2" name="f_cell_no2" value="<?php echo $res->f_cell_no2; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Mobile 3</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="f_cell_no3" name="f_cell_no3" value="<?php echo $res->f_cell_no3; ?>" type="text"/>
                                                </div>
                                            </div>
                                            <h3 class="prf-border-head">Emergency contact: please give name/contact numbers for use during school day</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_name" name="emerg_contact_name" value="<?php echo $res->emerg_contact_name; ?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Telephone</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_tele_no" name="emerg_contact_tele_no" value="<?php echo $res->emerg_contact_tele_no;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Relationship to Student</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_relation" name="emerg_contact_relation" value="<?php echo $res->emerg_contact_relation;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name 2</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_name2" name="emerg_contact_name2" value="<?php echo $res->emerg_contact_name2;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Telephone 2</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_tele_no2" name="emerg_contact_tele_no2" value="<?php echo $res->emerg_contact_tele_no2;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Relationship to Student 2</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="emerg_contact_relation2" name="emerg_contact_relation2" value="<?php echo $res->emerg_contact_relation2;?>" type="text"/>
                                                </div>
                                            </div>
                                            <h3 class="prf-border-head">Photographs</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Attach recent passport sized photographs of mother</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <?php
                                                            if(!empty($res->m_photo)){
                                                                $m_photo = base_url().$res->attach_location.$res->m_photo;
                                                            }else{
                                                                $m_photo = base_url()."images/no-image.gif";
                                                            }
                                                            ?>
                                                            <img src="<?php echo $m_photo;?>" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                                   <span class="btn btn-white btn-file">
                                                                   <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                                   <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                   <input type="file" name="m_photo" class="default" />
                                                                   </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Attach recent passport sized photographs of father</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <?php
                                                            if(!empty($res->f_photo)){
                                                                $f_photo = base_url().$res->attach_location.$res->f_photo;
                                                            }else{
                                                                $f_photo = base_url()."images/no-image.gif";
                                                            }
                                                            ?>
                                                            <img src="<?php echo $f_photo;?>" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                                   <span class="btn btn-white btn-file">
                                                                   <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                                   <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                   <input type="file" name="f_photo" class="default" />
                                                                   </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Attach recent passport sized photographs of relation 1</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <?php
                                                            if(!empty($res->relation1_photo)){
                                                                $relation1_photo = base_url().$res->attach_location.$res->relation1_photo;
                                                            }else{
                                                                $relation1_photo = base_url()."images/no-image.gif";
                                                            }
                                                            ?>
                                                            <img src="<?php echo $relation1_photo;?>" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                                   <span class="btn btn-white btn-file">
                                                                   <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                                   <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                   <input type="file" name="relation1_photo" class="default" />
                                                                   </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Attach recent passport sized photographs of relation 2</label>
                                                <div class="col-lg-4">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <?php
                                                            if(!empty($res->relation2_photo)){
                                                                $relation2_photo = base_url().$res->attach_location.$res->relation2_photo;
                                                            }else{
                                                                $relation2_photo = base_url()."images/no-image.gif";
                                                            }
                                                            ?>
                                                            <img src="<?php echo $relation2_photo;?>" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                                   <span class="btn btn-white btn-file">
                                                                   <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                                   <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                   <input type="file" name="relation2_photo" class="default" />
                                                                   </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-3" class="tab-pane">
                                            <h3 class="prf-border-head">Requested to be completed by a physician</h3>
                                            <p><strong>To the Parent:</strong> A medical examination is required prior to admission. Please ask your physician    to complete this form and return it to the School Office together with the application forms.</p>
                                            <p><strong>To the Physician:</strong> Kindly complete the following and note any information, which may be relevant to the child's physical, mental, emotional or social well-being.</p>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name of student</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="med_std_name" name="med_std_name" value="<?php $res->med_std_name;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Date of birth</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="med_std_dob" readonly="" value="<?php $res->med_std_dob;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <h3 class="prf-border-head">PLEASE EXAMINE AND NOTE ON THE FOLLOWING:</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">General appearance and behavior</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="behavior" name="behavior" value="<?php $res->behavior;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">General nutrition and eating habits</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="eating_habits" name="eating_habits" value="<?php $res->eating_habits;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Exercise and sleeping habits</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="sleeping_habits" name="sleeping_habits" value="<?php $res->sleeping_habits;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Height</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="height" name="height" value="<?php $res->height;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Weight</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="weight" name="weight" value="<?php $res->weight;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Pulse</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="pulse" name="pulse" value="<?php $res->pulse;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Blood Group</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="blood_group" name="blood_group" value="<?php $res->blood_group;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Birth (e.g. Premature)</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="birth_premature" name="birth_premature" value="<?php $res->birth_premature;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Scalp</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="scalp" name="scalp" value="<?php $res->scalp;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Eyes and Lids</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="eyes_lids" name="eyes_lids" value="<?php $res->eyes_lids;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Eyesight</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="eyesight" name="eyesight" value="<?php $res->eyesight;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Teeth and Gums</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="teeth_gums" name="teeth_gums" value="<?php $res->teeth_gums;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Ears</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="ears" name="ears" value="<?php $res->ears;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Hearing</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="hearing" name="hearing" value="<?php $res->hearing;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Nose and Throat</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="nose_throat" name="nose_throat" value="<?php $res->nose_throat;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Nodes</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="nodes" name="nodes" value="<?php $res->nodes;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Skin</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="skin" name="skin" value="<?php $res->skin;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Cardiac</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="cardiac" name="cardiac" value="<?php $res->cardiac;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Lungs</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="lungs" name="lungs" value="<?php $res->lungs;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Abdomen</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="abdomen" name="abdomen" value="<?php $res->abdomen;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Genitalia</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="genitalia" name="genitalia" value="<?php $res->genitalia;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Bones</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="bones" name="bones" value="<?php $res->bones;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Muscles</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="muscles" name="muscles" value="<?php $res->muscles;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Spine</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="spine" name="spine" value="<?php $res->spine;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Nervous System</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="nervous_system" name="nervous_system" value="<?php $res->nervous_system;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Medicines being taken regularly (name)</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="medicines_taken" name="medicines_taken" value="<?php $res->medicines_taken;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">For which condition</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="medicines_taken_dtl" name="medicines_taken_dtl" value="<?php $res->medicines_taken_dtl;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">If any abnormalities are identified, please indicate and attach a report</label>
                                                <div class="col-lg-3">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="abnormalities_file" class="default" />
                                                        </span>
                                                        <span class="fileupload-preview" style="margin-left:5px;"><a href="<?php echo base_url().$res->attach_location.$res->abnormalities_file;?>" target="_blank"><?php echo $res->abnormalities_file;?></a></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Please attach immunization records as follows</label>
                                                <div class="col-lg-3">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="immunization_file" class="default" />
                                                        </span>
                                                        <span class="fileupload-preview" style="margin-left:5px;"><a href="<?php echo base_url().$res->attach_location.$res->immunization_file;?>" target="_blank"><?php echo $res->immunization_file;?></a></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Physician's Name</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="physician_name" name="physician_name" value="<?php $res->physician_name;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Date</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="physician_date" readonly="" value="<?php echo $res->physician_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Physician's Address</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="physician_address" name="physician_address" value="<?php echo $res->physician_address;?>" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-4" class="tab-pane">
                                            <h3 class="prf-border-head">Requested to be completed by parent</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name of student</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="p_std_name" name="p_std_name" value="<?php echo $res->p_std_name;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Date of birth</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="p_std_dob" readonly="" value="<?php echo $res->p_std_dob;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>Please indicate if your child has had any of the following</p>
                                            <div class="form-group">
                                                <div class="col-lg-4">
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->meningitis == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="meningitis" value="1" <?php echo $checked_value;?>>Meningitis
                                                        </label>
                                                    </div>

                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->scarlet_fever == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="scarlet_fever" value="1" <?php echo $checked_value;?>>Scarlet Fever
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->mumps == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="mumps" value="1" <?php echo $checked_value;?>>Mumps
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->whooping_cough == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="whooping_cough" value="1" <?php echo $checked_value;?>>Whooping Cough
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->measles == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="measles" value="1" <?php echo $checked_value;?>>Measles
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->tuberculosis == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="tuberculosis" value="1" <?php echo $checked_value;?>>Tuberculosis
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->diabetes == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="diabetes" value="1" <?php echo $checked_value;?>>Diabetes
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->rheumatic_fever == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="rheumatic_fever" value="1" <?php echo $checked_value;?>>Rheumatic Fever
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->diphtheria == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="diphtheria" value="1" <?php echo $checked_value;?>>Diphtheria
                                                        </label>
                                                    </div>

                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->german_measles == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="german_measles" value="1" <?php echo $checked_value;?>>German Measles
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->poliomyelitis == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="poliomyelitis" value="1" <?php echo $checked_value;?>>Poliomyelitis
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->chicken_pox == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="chicken_pox" value="1" <?php echo $checked_value;?>>Chicken Pox
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->epilepsy == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="epilepsy" value="1" <?php echo $checked_value;?>>Epilepsy
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->heart_disease == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="heart_disease" value="1" <?php echo $checked_value;?>>Heart Disease
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <?php
                                                            if($res->kidney_disease == 1){
                                                                $checked_value = "checked";
                                                            }else{
                                                                $checked_value = "";
                                                            }
                                                            ?>
                                                            <input type="checkbox" name="kidney_disease" value="1" <?php echo $checked_value;?>>Kidney Disease
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>If you have answered YES to any of the above, a Physician's report is required Please specify</p>
                                            <div class="form-group ">
                                                <div class="col-lg-12">
                                                    <input class=" form-control" id="std_disease_report" name="std_disease_report" value="<?php echo $res->std_disease_report;?>" type="text"/>
                                                </div>
                                            </div>
                                            <p>Any allergies or asthma (include food or drug allergies)</p>
                                            <div class="form-group ">
                                                <div class="col-lg-12">
                                                    <input class=" form-control" id="allergies" name="allergies" value="<?php echo $res->allergies;?>" type="text"/>
                                                </div>
                                            </div>
                                            <p>Any serious injuries or surgery</p>
                                            <div class="form-group ">
                                                <div class="col-lg-12">
                                                    <input class=" form-control" id="injuries" name="injuries" value="<?php echo $res->injuries;?>" type="text"/>
                                                </div>
                                            </div>
                                            <p>Any other medical, emotional or social condition</p>
                                            <div class="form-group ">
                                                <div class="col-lg-12">
                                                    <input class=" form-control" id="other_medical" name="other_medical" value="<?php echo $res->other_medical;?>" type="text"/>
                                                </div>
                                            </div>
                                            <p>Does your child take medicine regularly?</p>
                                            <?php
                                            if ($res->medicine_regularly == 'y') {
                                                $checked_yes = "checked";
                                            } else {
                                                $checked_yes = "";
                                            }
                                            if ($res->medicine_regularly == 'n') {
                                                $checked_no = "checked";
                                            } else {
                                                $checked_no = "";
                                            }
                                            ?>
                                            <div class="form-group ">
                                                <div class="col-lg-4 icheck">
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="medicine_regularly" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="medicine_regularly" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>If yes</p>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Name of medicine</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="medicine_name" name="medicine_name" value="<?php echo $res->medicine_name;?>" type="text"/>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">For (name condition)</label>
                                                <div class="col-lg-4">
                                                    <input class=" form-control" id="medicine_name_dtl" name="medicine_name_dtl" value="<?php echo $res->medicine_name_dtl;?>" type="text"/>
                                                </div>
                                            </div>
                                            <p>Written permission for students to take medicine in school must be requested of the Head of School and a Physician's order provided. Medicine must be handed into the Medical Center and will only be administered by the School Nurse.</p>
                                            
                                            <div class="form-group ">
                                                <div class="col-lg-6 icheck">
                                                    <p>Does your child wear glasses?</p>
                                                    <?php
                                                    if ($res->wear_glasses == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->wear_glasses == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="wear_glasses" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="wear_glasses" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <p>For which condition?</p>
                                                    <input class=" form-control" id="wear_glasses_dtl" name="wear_glasses_dtl" value="<?php echo $res->wear_glasses_dtl;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-lg-6 icheck">
                                                    <p>Has your child ever had hearing difficulties?</p>
                                                    <?php
                                                    if ($res->hearing_diff == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->hearing_diff == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="hearing_diff" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="hearing_diff" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <p>Please specify:</p>
                                                    <input class=" form-control" id="hearing_diff_dtl" name="hearing_diff_dtl" value="<?php echo $res->hearing_diff_dtl;?>" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-lg-2">
                                                    <p>Date of last eyesight examination:</p>
                                                    
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="eyesight_exa_date" readonly="" value="<?php echo $res->eyesight_exa_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                
                                                </div>
                                                <div class="col-lg-4"></div>
                                                <div class="col-lg-2">
                                                    <p>Date of last hearing examination:</p>
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="hearing_exa_date" readonly="" value="<?php echo $res->hearing_exa_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-5" class="tab-pane">
                                            <p>Has your child previously attended school?</p>
                                                    <?php
                                                    if ($res->pre_school == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->pre_school == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                            <div class="form-group ">
                                                <div class="col-lg-4 icheck">
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="pre_school" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="pre_school" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>If YES, please complete the following and attach previous school records and student reports (most recent school first)</p>
                                            <?php
                                            $total_pre_schools = 0;
                                            if(!empty($res_pre_schools)){
                                                $total_pre_schools = count($res_pre_schools);
                                                foreach ($res_pre_schools as $key => $ps_value) {
                                                    
                                            ?>
                                                    <div class="form-group ">
                                                        <div class="col-lg-2">
                                                            <input type="hidden" name="hidden_ps_auto_id[]" value="<?php echo $ps_value->id;?>">
                                                            <p>Date from</p>
                                                            <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                                <input type="text" name="ps_date_from[]" readonly="" value="<?php echo $ps_value->ps_date_from;?>" size="16" class="form-control">
                                                                <span class="input-group-btn add-on">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <p>Date to</p>
                                                            <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                                <input type="text" name="ps_date_to[]" readonly="" value="<?php echo $ps_value->ps_date_to;?>" size="16" class="form-control">
                                                                <span class="input-group-btn add-on">
                                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <p>Grades</p>
                                                            <?php
                                                                $ddp = 'class="form-control m-bot15"';
                                                                echo form_dropdown('ps_class[]', $class_list,set_value('ps_class',(isset($ps_value->ps_class)) ? $ps_value->ps_class : ''),$ddp);
                                                            ?>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <p>Years</p>
                                                            <?php
                                                                $ddp = 'class="form-control m-bot15"';
                                                                echo form_dropdown('ps_year[]', $year_array,set_value('ps_year',(isset($ps_value->ps_year)) ? $ps_value->ps_year : ''),$ddp);
                                                            ?>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <p>School Name</p>
                                                            <input class=" form-control" id="ps_name[]" name="ps_name[]" value="<?php echo $ps_value->ps_name;?>" type="text"/>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <p>Address</p>
                                                            <input class=" form-control" id="ps_address[]" name="ps_address[]" value="<?php echo $ps_value->ps_address;?>" type="text"/>
                                                        </div>
                                                    </div>
                                            <?php
                                                }
                                            }
                                            $remaining_row = 3-$total_pre_schools;
                                            for ($x = 1; $x <= $remaining_row; $x++) {
                                            ?>
                                                <div class="form-group ">
                                                    <div class="col-lg-2">
                                                        <input type="hidden" name="hidden_ps_auto_id[]" value="">
                                                        <p>Date from</p>
                                                        <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                            <input type="text" name="ps_date_from[]" readonly="" value="<?php echo $current_date;?>" size="16" class="form-control">
                                                            <span class="input-group-btn add-on">
                                                                <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <p>Date to</p>
                                                        <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                            <input type="text" name="ps_date_to[]" readonly="" value="<?php echo $current_date;?>" size="16" class="form-control">
                                                            <span class="input-group-btn add-on">
                                                                <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <p>Grades</p>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('ps_class[]', $class_list,'',$ddp);
                                                        ?>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <p>Years</p>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('ps_year[]', $year_array,'',$ddp);
                                                        ?>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <p>School Name</p>
                                                        <input class=" form-control" id="ps_name[]" name="ps_name[]" type="text"/>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <p>Address</p>
                                                        <input class=" form-control" id="ps_address[]" name="ps_address[]" type="text"/>
                                                    </div>
                                                </div>
                                            <?php
                                            }
                                            ?>
                                            
                                            <div class="form-group ">
                                                <div class="col-lg-6">
                                                    <p>Attach copies of previous school reports</p>
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="ps_reports_file" class="default" />
                                                        </span>
                                                        <span class="fileupload-preview" style="margin-left:5px;"><a href="<?php echo base_url().$res->attach_location.$res->ps_reports_file;?>" target="_blank"><?php echo $res->ps_reports_file;?></a></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 icheck">
                                                    <p>Has the student ever repeated a Grade?</p>
                                                    <?php
                                                    if ($res->repeated_grade == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->repeated_grade == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="repeated_grade" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="repeated_grade" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-lg-6 icheck">
                                                    <p>Has the student ever participated in an accelerated programme?</p>
                                                    <?php
                                                    if ($res->acc_programe == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->acc_programe == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="acc_programe" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="acc_programe" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 icheck">
                                                    <p>Has the student ever participated in a remedial programme?</p>
                                                    <?php
                                                    if ($res->reme_programe == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->reme_programe == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                    ?>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="reme_programe" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="reme_programe" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-lg-6 ">
                                                    <p>If Yes</p>
                                                    <input class=" form-control" id="acc_programe_dtl" name="acc_programe_dtl" value="<?php echo $res->acc_programe_dtl;?>" type="text"/>
                                                </div>
                                                <div class="col-lg-6 ">
                                                    <p>If Yes</p>
                                                    <input class=" form-control" id="reme_programe_dtl" name="reme_programe_dtl" value="<?php echo $res->acc_programe_dtl;?>" type="text"/>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div id="tab-6" class="tab-pane">
                                            <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Gender</th>
                                                <th>Date of Birth</th>
                                                <th>School</th>
                                                <th>Class</th>
                                                <th>Year</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $total_siblings = 0;
                                                if(!empty($res_siblings)){
                                                    $total_siblings = count($res_siblings);
                                                    foreach ($res_siblings as $key => $siblings_value) {

                                                ?>
                                                
                                                <tr>
                                                    <td>
                                                        <input type="hidden" name="hidden_sis_auto_id[]" value="<?php echo $siblings_value->id; ?>">
                                                        <input class=" form-control" name="siblings_name[]" type="text" value="<?php echo $siblings_value->siblings_name;?>"/>
                                                    </td>
                                                    <td>
                                                        <?php
                                                        $ddp = 'class="form-control m-bot15"';
                                                        echo form_dropdown('siblings_gender[]', $sex_array,set_value('siblings_gender',(isset($siblings_value->siblings_gender)) ? $siblings_value->siblings_gender : ''),$ddp);
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                            <input type="text" name="siblings_dob[]" readonly="" value="<?php echo $siblings_value->siblings_dob;?>" size="16" class="form-control">
                                                            <span class="input-group-btn add-on">
                                                                <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input class=" form-control" name="siblings_school[]" type="text" value="<?php echo $siblings_value->siblings_school;?>"/>
                                                    </td>
                                                    <td>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('siblings_class[]', $class_list,set_value('siblings_class',(isset($siblings_value->siblings_class)) ? $siblings_value->siblings_class : ''),$ddp);
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('siblings_year[]', $year_array,set_value('siblings_year',(isset($siblings_value->siblings_year)) ? $siblings_value->siblings_year : ''),$ddp);
                                                        ?>
                                                    </td>
                                                </tr>
                                                <?php
                                                    }
                                                }
                                                $remaining_siblings_row = 3-$total_siblings;
                                                for ($x = 1; $x <= $remaining_siblings_row; $x++) {
                                                ?>
                                                <tr>
                                                    <td>
                                                        <input type="hidden" name="hidden_sis_auto_id[]" value="">
                                                        <input class=" form-control" name="siblings_name[]" type="text" value=""/>
                                                    </td>
                                                    <td>
                                                        <?php
                                                        $ddp = 'class="form-control m-bot15"';
                                                        echo form_dropdown('siblings_gender[]', $sex_array,'',$ddp);
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                            <input type="text" name="siblings_dob[]" readonly="" value="<?php echo $current_date;?>" size="16" class="form-control">
                                                            <span class="input-group-btn add-on">
                                                                <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input class=" form-control" name="siblings_school[]" type="text" value=""/>
                                                    </td>
                                                    <td>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('siblings_class[]', $class_list,'',$ddp);
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <?php
                                                            $ddp = 'class="form-control m-bot15"';
                                                            echo form_dropdown('siblings_year[]', $year_array,'',$ddp);
                                                        ?>
                                                    </td>
                                                </tr>
                                                <?php
                                                }
                                                ?>
                                                
                                            </tbody>
                                            </table>
                                            
                                        </div>
                                        <div id="tab-7" class="tab-pane">
                                            <h3 class="prf-border-head">Extra-Curricular Activities</h3>
                                            <p>Extra-curricular activities are encouraged as an important part of a student's education. Many take place outside normal school hours and some entail travel away from the school building. Please sign the following permission for your child to participate. You will receive full details of the activity in advance.</p>
                                            <p>My child has permission to participate in extra-curricular activities during or outside regular school hours and on or off school premises. My child will be accompanied by an adult’ to whom the Head of School has delegated authority and responsibility for the care of the student(s).</p>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Has given permission</label>
                                                 <?php
                                                    if ($res->ex_curri_act == 'y') {
                                                        $checked_yes = "checked";
                                                    } else {
                                                        $checked_yes = "";
                                                    }
                                                    if ($res->ex_curri_act == 'n') {
                                                        $checked_no = "checked";
                                                    } else {
                                                        $checked_no = "";
                                                    }
                                                ?>
                                                <div class="col-lg-4 icheck">
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="ex_curri_act" value="y" <?php echo $checked_yes;?>>
                                                            <label>Yes </label>
                                                        </div>
                                                    </div>
                                                    <div class="flat-green ">
                                                        <div class="radio-inline ">
                                                            <input tabindex="3" type="radio"  name="ex_curri_act" value="n" <?php echo $checked_no;?>>
                                                            <label>No </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <label for="Name" class="control-label col-lg-2">Responsibility</label>
                                                <div class="col-lg-2">
                                                    <input class=" form-control" id="responsibility_name" name="responsibility_name" type="text" value="<?php echo $res->responsibility_name;?>"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                
                                                <label for="Name" class="control-label col-lg-2">Date</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="responsibility_date" readonly="" value="<?php echo $res->responsibility_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-lg-12">
                                                    <p>Is there anything else you would like us to know about your child and to take into consideration in his/her education in our school?</p>
                                                    <input class=" form-control" id="other_std_info" name="other_std_info" value="<?php echo $res->other_std_info;?>" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-8" class="tab-pane">
                                            <h3 class="prf-border-head">For Office Use Only</h3>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Comments</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="comments" name="comments" type="text" value="<?php echo $res->comments;?>"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="Name" class="control-label col-lg-2">Date</label>
                                                <div class="col-lg-2">
                                                    <div data-date-viewmode="years" data-date-format="yyyy--mm--dd" data-date="2015-03-07"  class="input-append date dpYears">
                                                        <input type="text" name="comments_date" readonly="" value="<?php echo $res->comments_date;?>" size="16" class="form-control">
                                                        <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                                
                                                <label for="Name" class="control-label col-lg-2">Status</label>
                                                <div class="col-lg-2">
                                                    <?php
                                                    $ddp = 'class="form-control m-bot15"';
                                                    echo form_dropdown('app_status', $app_status_array,set_value('app_status',(isset($res->status)) ? $res->status : ''),$ddp);
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-2">
                                            <input type="hidden" name="hidden_sim_auto_id" value="<?php echo $res->id;?>">
                                            <input type="hidden" name="hidden_student_id" value="<?php echo $res->student_id;?>">
                                            <input type="hidden" name="hidden_fee_flag" value="<?php echo $res->fee_flag;?>">
                                            <button class="btn btn-primary" type="submit">Update</button>
                                        </div>
                                    </div>
                                </div>
                                
                            </form>
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