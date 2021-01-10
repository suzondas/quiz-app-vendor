<?php
$this->load->view('header/view_header');
$current_date = date('m/d/Y');
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
                            <form class="cmxform form-horizontal " id="commentForm" role="form" method="post"
                                  action="<?php echo current_url(); ?>">

                                <div class="form-group ">
                                    <label for="Name" class="control-label col-lg-2">Year</label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('year', $year_array, '', $ddp);
                                        ?>
                                    </div>
                                    <label for="Name" class="control-label col-lg-2">Session</label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" required';
                                        echo form_dropdown('session', $session_list, '', $ddp);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="module" class="control-label col-lg-2">Module</label>
                                    <div class="col-lg-4">
                                        <?php
                                        $ddp = 'class="form-control m-bot15" onchange="getUnitByModule(this)" data-target="' . site_url('landing/getUnitByModule') . '"';
                                        echo form_dropdown('module', $module_list, '', $ddp);
                                        ?>
                                    </div>
                                    <!-- <label for="unit" class="control-label col-lg-2">Unit </label>
                                    <div class="col-lg-4">

                                        <?php
                                    /*                                        $ddp = 'class="form-control m-bot15" id="unit"';
                                                                            echo form_dropdown('unit', $unit_list, '', $ddp);
                                                                            */ ?>
                                    </div>-->
                                </div>


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
        <?php if ($doctors_list) : ?>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Assigned Fellows List
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fellow Reg. No</th>
                                    <th>Fellow Name</th>
                                    <th>Faculty Name</th>
                                    <th>Module</th>
                                    <th>Year</th>
                                    <th>Session</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($doctors_list as $i => $doc) : ?>
                                    <tr>
                                        <td><?= ($i + 1) ?></td>
                                        <td><?= $doc->reg_no; ?></td>
                                        <td><?= $doc->doc_name; ?></td>
                                        <td>
                                            <label class="label label-inverse"><?= get_teacher_name_by_id($doc->assigned_teacher_id); ?></label>
                                        </td>
                                        <td>
                                            <label class="label label-primary"><?= get_name_by_auto_id('modules', $doc->module); ?></label>
                                        </td>
                                        <td><?= $doc->year; ?></td>
                                        <td><?= $session_list[$doc->session]; ?></td>
                                        <td class="text-center">
                                            <a href="<?= site_url("teacher/view_assignment/{$doc->id}") ?>"
                                               class="btn btn-success btn-xs">View Assignments</a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
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
$this->load->view('footer/view_footer');
?>
