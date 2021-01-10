<?php
$this->load->view( 'header/view_header' );
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="panel panel-info">
                <div class="panel-body">
                    <?php echo $msg; ?>
                    <h4>
                        <?= $page_title; ?>
                        <a href="<?= site_url( "result/mcq_result/$exam->id" ) ?>" class="btn btn-success pull-right">View Result</a>
                    </h4>
                    <hr>

                    <table class="table default table-bordered exam-qus-ans">
                        <?php foreach ( $data as $i => $row ) : ?>
                            <tr>
                                <td><strong>Q: <?= (++$i); ?></strong></td>
                                <td><strong><?= strip_tags( $row['question']->question_name ); ?></strong></td>
                                <td class="t-blue"><strong>Your Answer</strong></td>
                                <td class="t-green"><strong>Correct Answer</strong></td>
                            </tr>

                            <?php foreach ( $row['answers'] as $j => $answer ) : ?>
                                <tr>
                                    <?php if ( $j == 0 ): ?>
                                        <td rowspan="<?= count( $row['answers'] ) ?>"><strong>Options</strong></td>
                                    <?php endif; ?>
                                    <td width="65%"><?= $answer->index_seqn . ') ' . strip_tags( $answer->ans ) ?></td>
                                    <?php if ( $row['question']->type == 1 && $j == 0 ): ?>
                                        <td class="text-center t-blue" rowspan="5">
                                            <?= extract_qus_ans( $exam->answers, $row['question']->id, $answer->index_seqn ); ?>
                                        </td>
                                    <?php elseif ( $row['question']->type == 2 ) : ?>
                                        <td class="text-center t-blue">
                                            <?= extract_qus_ans( $exam->answers, $row['question']->id, $answer->index_seqn ); ?>
                                        </td>
                                    <?php endif; ?>
                                    <?php if ( $row['question']->type == 1 && $j == 0 ): ?>
                                        <td class="text-center t-green" rowspan="5"><?= $row['question']->correct_ans ?></td>
                                    <?php elseif ( $row['question']->type == 2 ) : ?>
                                        <td class="text-center t-green"><?= $answer->correct_ans ?></td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td><strong>Discussion</strong></td>
                                <td colspan="4"><?= $row['question']->discussion; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Reference</strong></td>
                                <td colspan="4"><?= $row['question']->reference; ?></td>
                            </tr>
                            <tr>
                                <td colspan="5"></td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            </div>
        </section>
    </section>


<?php
$this->load->view( 'footer/view_footer' );
?>