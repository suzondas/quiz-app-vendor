<?php
$this->load->view('header/view_header');
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        General Information
                        <span class="tools pull-right">
                            <a class="fa fa-chevron-down" href="javascript:;"></a>
                            <a class="fa fa-cog" href="javascript:;"></a>
                            <a class="fa fa-times" href="javascript:;"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">
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
                            ?>

                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?= base_url("setting/save_general_info"); ?>" enctype="multipart/form-data">
                                <div class="form-group ">
                                    <label for="name" class="control-label col-lg-3 col-sm-3">Company Name</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="text" id="name" name="name" class="form-control"
                                               value="<?= $record ? $record->name : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="tagline" class="control-label col-lg-3 col-sm-3">Company Tagline</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="text" id="tagline" name="tagline" class="form-control"
                                               value="<?= $record ? $record->tagline : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="address" class="control-label col-lg-3 col-sm-3">Company Address</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="text" id="address" name="address" class="form-control"
                                               value="<?= $record ? $record->address : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="email" class="control-label col-lg-3 col-sm-3">Company Email</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="email" id="email" name="email" class="form-control"
                                               value="<?= $record ? $record->email : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="email" class="control-label col-lg-3 col-sm-3">Facebook ID</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="text" id="fb_id" name="fb_id" class="form-control"
                                               value="<?= $record ? $record->fb_id : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="phone" class="control-label col-lg-3 col-sm-3">Company Phone</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="tel" id="phone" name="phone" class="form-control"
                                               value="<?= $record ? $record->phone : ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="website" class="control-label col-lg-3 col-sm-3">Company Website</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <input type="url" id="website" name="website" class="form-control"
                                               value="<?= $record ? $record->website : ''; ?>">
                                    </div>
                                </div>
                                <!-- <div class="form-group ">
                                    <label for="Status" class="control-label col-lg-3 col-sm-3">Student Fee Head</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        //echo form_dropdown('ah_stu_fee', $income_head_list, ($record ? $record->ah_stu_fee : ''), $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="Status" class="control-label col-lg-3 col-sm-3">Faculty Payment
                                        Head</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        //echo form_dropdown('ah_tec_payment', $expanse_head_list, ($record ? $record->ah_tec_payment : ''), $ddp);
                                        ?>
                                    </div>
                                </div> -->
                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-3">Logo<br>
                                        (Image Size:100Kb Max, Only (.jpg/.png/.gif,) is allowed to upload)
                                    </label>
                                    <div class="col-lg-6">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                <?php if (!empty($record)) echo "<img src='" . base_url($record->logo) . "'"; ?>
                                                <img
                                                    src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=Photo+image"
                                                    alt=""/>
                                            </div>
                                            <div class="fileupload-preview fileupload-exists thumbnail"
                                                 style="max-width: 300px; max-height: 100px; line-height: 20px;"></div>
                                            <div>
                                                    <span class="btn btn-white btn-file">
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                        <input type="file" name="logo" class="default"/>
                                                    </span>
                                                <a href="#" class="btn btn-danger fileupload-exists"
                                                   data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="Status" class="control-label col-lg-3 col-sm-3">Status</label>
                                    <div class="col-lg-6 col-sm-9">
                                        <?php
                                        $ddp = 'class="form-control m-bot15"';
                                        echo form_dropdown('status', $status_array, set_value('status', ($record ? $record->status : '')), $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-3 col-lg-6">
                                        <input type="hidden" name="hidden_auto_id" id="hidden_auto_id"
                                               value="<?php echo isset($record->id) ? $record->id : ''; ?>">
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
