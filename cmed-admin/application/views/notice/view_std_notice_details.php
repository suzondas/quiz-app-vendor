<?php
if ( $this->ion_auth->logged_in() ) {
	$this->load->view( 'header/view_header' );
} else {
	$this->load->view( 'header/view_student_header' );
}
$current_date = date( 'Y-m-d' );
?>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		
		<div class="row">
			<div class="col-lg-12">
				<!--todolist start-->
				<section class="panel">
					<header class="panel-heading">
						Details Notice of :: <?= $notice->subject; ?>
						<span class="tools pull-right">
                            <a href="javascript:" class="fa fa-chevron-down"></a>
                            <a href="javascript:" class="fa fa-cog"></a>
                            <a href="javascript:" class="fa fa-times"></a>
                        </span>
					</header>
					<div class="panel-body">
						<table class="table table-bordered table-striped">
							<tbody>
							<?php if ( $notice->students ): ?>
								<tr>
									<th>Year</th>
									<td>
										<?php echo isset( $notice->year ) ? $notice->year : '' ?>
									</td>
									<th>Session</th>
									<td>
										<?php echo $notice->session ? $session_list[$notice->session] : ''; ?>
									</td>
								</tr>
							<?php endif; ?>
							<tr>
								<th>Subject</th>
								<td colspan="3"><?= $notice->subject; ?></td>
							</tr>
							<tr>
								<th>Details</th>
								<td colspan="3"><?= $notice->notice; ?></td>
							</tr>
							
							<?php
							if ( $notice->attachment ) {
								echo '<tr><th>Attachment</th><td colspan="3"><a href="' . base_url( $notice->attachment ) . '" download class="btn btn-white btn-xs">Download Attachment</a></td></tr>';
							}
							?>
							
							<?php if ( $notice->students ): ?>
								<tr>
									<th>Fellows</th>
									<td colspan="3">
										<ol class="list-group">
											<?php foreach ( $notice->students as $i => $student ) : ?>
												<li class="list-group-item">
													<?= ( ++$i ) . ") " . $student->doc_name; ?>
													
													<?php if ( $student->email_sent ): ?>
														<span class="badge bg-success">Sent</span>
													<?php else: ?>
														<span class="badge bg-warning">Not Sent</span>
													<?php endif; ?>
												</li>
											<?php endforeach; ?>
										</ol>
									</td>
								</tr>
							<?php endif; ?>
							
							<?php if ( $notice->teachers ): ?>
								<tr>
									<th>Faculties</th>
									<td colspan="3">
										<ol class="list-group">
											<?php foreach ( $notice->teachers as $i => $teacher ) : ?>
												<li class="list-group-item">
													<?= ( ++$i ) . ") " . $teacher->tec_name; ?>
													
													<?php if ( $teacher->email_sent ): ?>
														<span class="badge bg-success">Sent</span>
													<?php else: ?>
														<span class="badge bg-warning">Not Sent</span>
													<?php endif; ?>
												</li>
											<?php endforeach; ?>
										</ol>
									</td>
								</tr>
							<?php endif; ?>
							
							</tbody>
						</table>
					
					
					</div>
				</section>
				<!--todolist end-->
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>    
