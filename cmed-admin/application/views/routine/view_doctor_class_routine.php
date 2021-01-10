<?php
$this->load->view('header/view_student_header');
$current_date = date('Y-m-d');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->

            <?php //print_r($doctor_detail_routine);//var_dump('doctor_detail_routine');//if (isset($class_routine) && $class_routine) : ?>
            
                <div class="row">
                    <div class="col-lg-12">

                        <section class="panel panel-info">
                            <header class="panel-heading">
                                Routine
                                <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                            </header>
                            <div class="panel-body">
                                <table class="table table-bordered table-striped routine">
                                    <tbody>
<!--                                    <tr>
                                        <th></th>
                                        
                                    </tr>-->
                                    <tr>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Topic & Faculty Name</th>
                                        <th>Place</th>
                                        <th></th>
                                    </tr>
                                    <?php
                                    if(!empty($doctor_detail_routine)){
                                    foreach($doctor_detail_routine as $i => $routine)
                                    {       
                                    ?>
                                        <tr>
                                            <td>
                                                <label class="label label-primary"><?php echo $routine->date?></label><br>
                                                <label class="label label-warning">
                                                    <?php 
                                                     $date = $routine->date;
                                                     echo $dayofweek = date('l', strtotime($date));
                                                     ?>
                                                </label>
                                            </td>
                                            <td>
                                                <label class="label label-primary">
                                                <?php echo date('h:i A',strtotime($routine->time_from)) .' To '. date('h:i A',strtotime($routine->time_to));?>
                                                </label>
                                            </td>
                                            <td>
                                                
                                                <?php 
                                                    $topics = get_topic_name($routine->course_code, $routine->faculty_code, $routine->topic_id);
                                                    $topics = explode(',',$topics);
                                                    foreach ($topics as $topic)
                                                    {
                                                       echo '<label class="label label-primary"> '.$topic.' </label>'.' '; 
                                                    }
                                                ?>
                                               <br>
                                                <label class="label label-warning"><?php echo $teacher_list[$routine->teacher_id];?></label>
                                            </td>                                         
                                            <td>
                                               <label class="label label-primary"> <?php echo $room_list[$routine->room_id];?></label>
                                            </td>
                                            <td>
                                                <a href="<?php echo site_url('student_dashboard/evaluation/'.$routine->id)?>" class="btn btn-info">Evaluate</a>
                                            </td>
                                        </tr>
                                    <?php
                                    }
                                    }
                                    ?>
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