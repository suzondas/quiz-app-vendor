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
                <form class="cmxform form-horizontal" enctype="multipart/form-data"  id="commentForm" role="form" method="post"
                      action="<?php echo base_url('result/save'); ?>">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Result Processing
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
//                                if(!$msg){
//                                    echo "<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
//                                    echo 'You Must Upload image field';
//                                    echo "</div>";
//                                }
                                ?>
                                <!--                                <div class="form-group ">-->
                                <div class="form-group ">
                                    <label for="institute" class="control-label col-lg-2">Exam <i class="fa fa-asterisk ipd-star"></i></label>

                                    <div class="col-lg-2">                                          
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='institute' required";
                                        echo form_dropdown('exam_id', $exam_list,'', $ddp);
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">OMR Sheet <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <span class="btn btn-white btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                <input type="file" class="default" name="answer_sheet" />
                                                </span>
                                            <span class="fileupload-preview" style="margin-left:5px;"></span>
                                            <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        </div>
                                    </div>
                                    <label class="control-label col-lg-2">Answer Sheet <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <span class="btn btn-white btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                <input type="file" class="default" name="result_sheet" />
                                                </span>
                                            <span class="fileupload-preview" style="margin-left:5px;"></span>
                                            <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        </div>
                                    </div>

                                    <div class="col-lg-10 col-lg-offset-2">
                                        <span class="label label-warning">NOTE: Answer Sheet and Result Sheet Must be (*.txt) format</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-primary" type="submit">Save</button>
                                    </div>
                                </div>

                            </div><!--dfadsfd-->
                        </div>
                    </section>
                    <!--Permanant address section-->


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