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
						<h4><?= $notice->notice; ?></h4>
						<?php
						
						if ( $notice->attachment ) {
							echo "<hr>";
							$ext = get_file_extension( $notice->attachment );
							if ( $ext == 'pdf' ) {
								echo '<iframe width="100%" height="600px" src="' . base_url( $notice->attachment ) . '"></iframe>';
							} elseif ( $ext == 'img' ) {
								echo "<img src='" . base_url( $notice->attachment ) . "' class='img-responsive img-thumbnail' />";
							} else {
								echo '<a href="' . base_url( $notice->attachment ) . '" download class="btn btn-white btn-xs">Download Attachment</a>';
							}
						}
						
						?>
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
