<?php
$this->load->view( 'header/view_landing_header' );
?>

<!--main content start-->
<section id="" class="container">
    <!-- page start-->

    <div class="panel panel-info">
        <div class="panel-body">
            <?= form_open( "exam/answer_proceed" ); ?>
            <?php 
				echo $msg;
				?>
            <div class="row">
                <div class="col-sm-9">
                    <h4><?= $page_title; ?></h4>
                </div>

                <div class="col-sm-3 pull-right">
                    <h5 class="e-head-right">
                        Remaining: <span class="timer"><?= $exam['duration']?>:00</span>
                        <?= form_hidden( 'timer', $exam['duration'] ); ?>
                    </h5>
                </div>
            </div>
            <hr>

            <div class="question-answer">
                <?= $question_answer; ?>
            </div>
            <div class="clearfix"></div>
            <hr>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button type="submit" class="btn btn-lg btn-warning" onclick="return next_question(this, event)" name="skip">Skip <i class="fa fa-clock-o"></i></button>
                    <button type="submit" class="btn btn-lg btn-success pull-right" onclick="return next_question(this, event)" name="next">Next <i class="fa fa-angle-double-right"></i></button>
                </div>
                <div class="clearfix"></div>
            </div>

            <?= form_close(); ?>
        </div>
    </div>
    <!-- page end-->


</section>
<!--main content end-->


<?php
$this->load->view( 'footer/view_landing_footer' );
?>

<!-- Footer -->
<script>
    var time = <?= $exam['duration']; ?>;
    $('.timer').jTimer({time: time});

    // $(document).ready(function () {
    //     $(this).on('keydown', function (e) {
    //         if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) {
    //             confirm('Are you sure? You\'ll lost access to this exam.');
    //             e.preventDefault();
    //         }
    //     });
    // });
</script>
