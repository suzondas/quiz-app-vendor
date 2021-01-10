<?php
$this->load->view( 'header/view_header' );
$current_date = date( 'm/d/Y' );
$id = $this->uri->segment( 3 );
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Search Wizard
                        <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <?php echo $msg; ?>
                        <div class="form">
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo current_url(); ?>">

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Year <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown( 'year', $n_year, date( 'Y' ), $ddp );
                                        ?>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Session <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown( 'session', $session_list, '', $ddp );
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Module <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url( 'landing/getUnitByModule' ) . '" required';
                                        echo form_dropdown( 'module', $module_list, '', $ddp );
                                        ?>
                                    </div>
                                    <label for="unit" class="control-label col-lg-2">Unit <i class="fa fa-asterisk ipd-star"></i></label>
                                    <div class="col-lg-4">

                                        <?php
                                        $ddp = 'class="form-control m-bot15" id="unit" required';
                                        echo form_dropdown( 'unit', $unit_list, '', $ddp );
                                        ?>
                                    </div>
                                </div>

                                <!-- <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Date Range</label>
                                    <div class="col-lg-4">
                                        <div class="input-group input-large" data-date="<?php echo $current_date; ?>"
                                             data-date-format="mm/dd/yyyy">
                                            <input type="text" class="form-control datepicker" name="from_date_time">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control datepicker" name="to_date_time">
                                        </div>
                                    </div>

                                </div> -->

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-2">
                                        <button class="btn btn-success" type="submit"><i class="fa fa-search"></i> Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <?php if ( $doctors_list ) : ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Send Assignment to Fellows
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <?php echo $msg; ?>
                                <form class="cmxform form-horizontal " role="form" method="post" action="<?php echo base_url( 'teacher/save_assignment_fellows' ); ?>"
                                      enctype="multipart/form-data">
                                    <input type="hidden" name="teacher_id" value="<?= $authUser->teacher_id; ?>">
                                    <input type="hidden" name="year" value="<?= $this->input->post( 'year' ); ?>">
                                    <input type="hidden" name="session" value="<?= $this->input->post( 'session' ); ?>">
                                    <input type="hidden" name="module" value="<?= $this->input->post( 'module' ); ?>">
                                    <input type="hidden" name="unit" value="<?= $this->input->post( 'unit' ); ?>">
                                    <?php
                                    if ( isset( $assignment ) ) {
                                        echo '<input type="hidden" name="assignment_id" value="' . $assignment->id . '">';
                                    }
                                    ?>
                                    <div class="form-group ">
                                        <label for="teacher" class="control-label col-lg-2">Faculty</label>
                                        <div class="col-lg-2">
                                            <input type="text" value="<?= get_teacher_name_by_id( $authUser->teacher_id ); ?>" class="form-control" disabled>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Year</label>
                                        <div class="col-lg-2">
                                            <input type="text" value="<?= $this->input->post( 'year' ); ?>" class="form-control" disabled>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Session</label>
                                        <div class="col-lg-2">
                                            <input type="text" value="<?= $session_list[$this->input->post( 'session' )]; ?>" class="form-control" disabled>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="module" class="control-label col-lg-2">Module</label>
                                        <div class="col-lg-4">
                                            <input type="text" value="<?= $module_list[$this->input->post( 'module' )]; ?>" class="form-control" disabled>
                                        </div>
                                        <label for="unit" class="control-label col-lg-2">Unit </label>
                                        <div class="col-lg-4">
                                            <input type="text" value="<?= $unit_list[$this->input->post( 'unit' )]; ?>" class="form-control" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-2"></label>
                                        <div class="col-lg-10">
                                            <label class="fellow one">Fellows</label>
                                            <label class="fellow two">Assigned <i class="fa fa-asterisk ipd-star"></i></label>
                                            <?php
                                            $ddp = 'class="form-control m-bot15 multi-select" multiple';
                                            echo form_dropdown( 'doc_id[]', $doctors_list, '', $ddp );
                                            ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="subject" class="control-label col-lg-2">Title <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-10">
                                            <input type="text" name="subject" class="form-control" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="desc" class="control-label col-lg-2">Details <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-10">
                                            <textarea name="desc" id="desc" rows="5" class="form-control" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="attachment" class="control-label col-lg-2">Attachment </label>
                                        <div class="col-lg-4">
                                            <input type="file" name="attachment">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="mark" class="control-label col-lg-2">Mark <i class="fa fa-asterisk ipd-star"></i></label>
                                        <div class="col-lg-3">
                                            <input type="text" name="mark" class="form-control number-only" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-2">
                                            <button class="btn btn-success" type="submit">Send Assignment</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        <?php endif; ?>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<?php
$this->load->view( 'footer/view_footer' );
?>
