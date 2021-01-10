<?php
$this->load->view('header/view_header');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Search Wizard - Evaluation List
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url().'setting/evaluation_list'; ?>">
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Faculty Name</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            $ddp = 'class="form-control m-bot15"';                                           
                                            echo form_dropdown('teacher_id',$teacher_list,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>
<!--                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">User</label>
                                        <div class="col-lg-6 col-sm-9">                                          
                                            <?php                                            
                                            //$ddp = 'class="form-control m-bot15"';                                            
                                            //echo form_dropdown('user_name',$eval_doctor,'', $ddp);                                           
                                            ?>
                                        </div>
                                    </div>-->
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Date Range</label>
                                        <div class="col-lg-6">
                                            <div class="input-group input-large" data-date="<?php //echo $current_date; ?>" data-date-format="mm/dd/yyyy">
                                                <input type="text" class="form-control datepicker" name="from_date_time">
                                                <span class="input-group-addon">To</span>
                                                <input type="text" class="form-control datepicker" name="to_date_time">
                                            </div>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2"></label>
                                        
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
            
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel panel-info">
                        <header class="panel-heading">
                            Evaluation List
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Faculty Name</th>
                                    <th>Introduction</th>
                                    <th>Knowledge Depth Of The Subject</th>
                                    <th>Expression Capability</th>
                                    <th>Interaction</th>
                                    <th>Suggestions</th>
                                    <th>Evaluate User</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($evaluations)) {

                                        foreach ($evaluations as $key => $evaluation) {
                                        ?>
                                        <tr>
                                            <td><?php echo $evaluation->schedule_id; ?></td>
                                            <td><?php echo $evaluate_value[$evaluation->introduction]; ?></td>
                                            <td><?php echo $evaluate_value[$evaluation->knowledge]; ?></td>
                                            <td><?php echo $evaluate_value[$evaluation->express]; ?></td>
                                            <td><?php echo $evaluate_value[$evaluation->interaction]; ?></td>
                                            <td><?php echo $evaluation->suggestions; ?></td>                                           
                                            <td><?php echo $evaluation->user_name; ?></td>
                                            
                                        </tr>
                                        <?php
                                        }
                                    }else{
                                        echo'<tr><td colspan="9" align="center">No Data Available</td></tr>';
                                    }
                                    ?>
                                        <tr>
                                            <td colspan="9"><?php echo $links;?></td>
                                        </tr>    
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
            <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<?php
$this->load->view('footer/view_footer');
?>    