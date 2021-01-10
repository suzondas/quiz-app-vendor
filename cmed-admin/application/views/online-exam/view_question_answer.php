<?php
$ques = $this->session->qs_count;
$current_ques = $ques + 1;
echo form_hidden('qs_id', $question['id']);
?>
    <div class="row">
        <div class="col-md-11">
            <p><strong>Question: <?= $question['qs_title']?></strong></p>
        </div>
        <div class="col-md-1">
            <span class="label label-primary"><?= $current_ques . " of " . 5; ?></span>
        </div>
    </div>

    <p><strong>Answer:</strong></p>
    <ul class="q-ans">
        <?php foreach ( $answers as $answer ) : ?>
            <li>
				<label>
					<input type="radio" name="ans_id" value="<?= $answer['id']; ?>">
					<?= strip_tags($answer['answer']); ?>
				</label>
			</li>
        <?php endforeach; ?>
    </ul>
