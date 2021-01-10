<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'Y-m-d' );
?>

<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-lg-12">
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

                $action = site_url( 'question_bank/save_mcq_question' );

                if($form_action == 'edit') {
                    $action = site_url( "question_bank/update_mcq_question/$res->id" );
                }


                ?>
                <form class="cmxform form-horizontal" enctype="multipart/form-data" id="commentForm" role="form" method="post"
                      action="<?php echo $action; ?>">

                    <input type="hidden" name="type" value="2">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            <?= $form_action ?> MCQ Question
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '" required';
                                        echo form_dropdown( 'module', $module_list, set_value( 'module', isset( $res ) ? $res->module : '' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">

                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="unit" required';
                                        echo form_dropdown( 'unit', $unit_list, set_value( 'unit', isset( $res ) ? $res->unit : '' ), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="question" class="control-label col-lg-2">Question <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-10">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" id="question" name="question_name" required><?php echo set_value( 'question_name', isset( $res ) ? show_html_elements_in_text( $res->question_name ) : '' ) ?></textarea>
                                        </div>
                                    </div>

                                </div>
                                <!--<div class="form-group ">
                                    <label for="heading" class="control-label col-lg-2">Heading</label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="heading" id="heading"><?php /*set_value('question_name') */ ?></textarea>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <div class="col-md-8 col-md-offset-2">
                                        <strong>Options</strong>
                                    </div>
                                    <div class="col-md-2">
                                        <strong>Correct Answer</strong>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="ans_a" class="control-label col-lg-2">A<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="ans_a" id="ans_a" required><?php echo set_value( 'ans_a', isset( $options[0] ) ? show_html_elements_in_text( $options[0]->ans ) : '' ) ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'correct_ans[]', $mcq_answer_array, (isset( $options[0] ) ? $options[0]->correct_ans : ''), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ans_b" class="control-label col-lg-2">B<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="ans_b" id="ans_b" required><?php echo set_value( 'ans_b', isset( $options[1] ) ? show_html_elements_in_text( $options[1]->ans ) : '' ) ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'correct_ans[]', $mcq_answer_array, (isset( $options[1] ) ? $options[1]->correct_ans : ''), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ans_c" class="control-label col-lg-2">C<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="ans_c" id="ans_c" required><?php echo set_value( 'ans_c', isset( $options[2] ) ? show_html_elements_in_text( $options[2]->ans ) : '' ) ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'correct_ans[]', $mcq_answer_array, (isset( $options[2]->correct_ans ) ? $options[2]->correct_ans : ''), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ans_d" class="control-label col-lg-2">D<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="ans_d" id="ans_d" required><?php echo set_value( 'ans_d', isset( $options[3] ) ? show_html_elements_in_text( $options[3]->ans ) : '' ) ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'correct_ans[]', $mcq_answer_array, (isset( $options[3]->correct_ans ) ? $options[3]->correct_ans : ''), $ddp );
                                        ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ans_e" class="control-label col-lg-2">E<i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-8">
                                        <div class="border-1">
                                            <textarea class="form-control summernote-inline" name="ans_e" id="ans_e" required><?php echo set_value( 'ans_e', isset( $options[4] ) ? show_html_elements_in_text( $options[4]->ans ) : '' ) ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'correct_ans[]', $mcq_answer_array, (isset( $options[4]->correct_ans ) ? $options[4]->correct_ans : ''), $ddp );
                                        ?>
                                    </div>
                                </div>

                                <!--<div class="form-group">
                                    <label for="Faculty" class="control-label col-lg-2">Question in Years</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" type="text" name="question_in_year" placeholder="Question in Years"/>
                                    </div>
                                </div>-->

                                <div class="form-group">
                                    <!-- <label for="Course" class="control-label col-lg-2">Select Answer <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">                                          
                                        <?php
                                    $ddp = "class='form-control m-bot15' id='answer' required";
                                    echo form_dropdown( 'correct_ans', $answer_array, (isset( $res->correct_ans ) ? $res->correct_ans : ''), $ddp );
                                    ?>
                                    </div> -->
                                    <label for="Course" class="control-label col-lg-2">Status <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-2">
                                        <?php
                                        $ddp = "class='form-control m-bot15' id='answer' required";
                                        echo form_dropdown( 'status', $status_array, (isset( $res ) ? $res->status : ''), $ddp );
                                        ?>
                                    </div>

                                </div>
                            </div>
                    </section>
                    <!--Permanant address section-->

                    <div class="panel panel-info">
                        <div class="panel-heading" style="background:#D9EDF7;text-align:center;">
                            <h3 class="panel-title">Discussion & Reference</h3>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label for="Course" class="control-label col-lg-2">Discussion</label>

                                <div class="col-lg-10">
                                    <div class="border-1">
                                        <textarea name="discussion" placeholder="Discussion" class="form-control summernote-inline"><?php echo set_value( 'ans_e', isset( $res ) ? show_html_elements_in_text( $res->discussion ) : '' ) ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Name" class="control-label col-lg-2">Reference</label>
                                <div class="col-lg-10">
                                    <div class="border-1">
                                        <textarea name="reference" placeholder="Reference" class="form-control summernote-inline"><?php echo set_value( 'reference', isset( $res ) ? show_html_elements_in_text( $res->reference ) : '' ) ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-2">
                                    <input type="submit" class="btn btn-primary" value="Submit">

                                </div>
                            </div>
                        </div>
                    </div>


                    <!--start image section-->


                </form>
            </div>
        </div>
        <!-- page end-->


    </section>
</section>
<!--main content end-->


<?php
$this->load->view( 'footer/view_footer' );
?>

<script>
    // $('.summernote-inline').summernote({
    //     airMode: true
    // });

</script>