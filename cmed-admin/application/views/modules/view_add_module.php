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

                    if ($form_action == "add") {
                        $action_url = base_url('module/save');
                        $btnval = 'SAVE';
                    } elseif ($form_action == "edit") {
                        $action_url = base_url('module/update');
                        $btnval = 'UPDATE';
                    }
                    ?>
                    <form class="cmxform form-horizontal " role="form" method="post" action="<?php echo $action_url; ?>"
                          enctype="multipart/form-data">
                        <input type="hidden" name="auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                        <input type="hidden" name="course_id" value="1">
                        <section class="panel panel-info">
                            <header class="panel-heading">
                                Add Module Form
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                            </header>
                            <div class="panel-body">
                                <div class="form">
                                    <div class="form-group ">
                                        <label for="name" class="control-label col-lg-2">Module Name <i
                                                    class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="name" type="text"
                                                   value="<?php echo isset($res) ? $res->name : '' ?>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <label for="duration" class="control-label col-lg-2">Duration <i
                                                    class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="duration" name="duration" type="text"
                                                   value="<?php echo isset($res) ? $res->duration : '' ?>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <label for="sl" class="control-label col-lg-2">SL <i
                                                    class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="sl" name="sl" type="text"
                                                   value="<?php echo isset($res) ? $res->sl : '' ?>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-12 col-lg-offset-2">
                                            <button class="btn btn-primary btn-lg"
                                                    type="submit"><?php echo $btnval; ?></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

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