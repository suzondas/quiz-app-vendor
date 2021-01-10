<?php
$this->load->view( 'header/view_landing_header' );
?>

    <!--main content start-->
    <section id="" class="container">
        <!-- page start-->

        <div class="panel panel-info">
            <div class="panel-body">
                <h4 class="text-center"><?= $page_title; ?> <span></span></h4>
				<a href="<?= site_url('/')?>" class="btn btn-success">Home</a>
				<a href="<?= site_url('exam/exam_start')?>" class="btn btn-success">Restart Exam</a>
                <hr>
                <table class="table default">
                    <tbody>
                    <tr>
                        <td colspan="2"><strong>Questions Answered</strong></td>
                        <td><span class="badge"><?= $result['correct_ans'] + $result['wrong_ans']; ?></span></td>
                        <td colspan="2"><strong>Questions Not Answered</strong></td>
                        <td><span class="badge"><?= $result['skip']; ?></span></td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>Correct Answered</strong></td>
                        <td><span class="badge bg-green"><?= $result['correct_ans']; ?></span></td>
                        <td colspan="2"><strong>Wrong Answered</strong></td>
                        <td><span class="badge bg-orange"><?= $result['wrong_ans']; ?></span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- page end-->


    </section>
    <!--main content end-->


<?php
$this->load->view( 'footer/view_landing_footer' );
?>
