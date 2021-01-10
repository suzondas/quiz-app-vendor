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
                            Search Wizard - Visitor
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url().'visitor/record'; ?>">
                                    
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Visitor Name</label>
                                        <div class="col-lg-4">
                                            <input class=" form-control" id="teacher_name" name="name" type="text"/>
                                        </div>
                                        <label for="cell_no" class="control-label col-lg-2">Mobile No </label>
                                        <div class="col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">+88</span>
                                                <input type="text" class="form-control" id="cell_no" name="mobile"
                                                       type="text"  minlength="11" maxlength="11" pattern="\d{11}">
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-2">Date Range</label>
                                        <div class="col-lg-4">
                                            <div class="input-group input-large" data-date="<?php echo $current_date; ?>" data-date-format="mm/dd/yyyy">
                                                <input type="text" class="form-control datepicker" name="from_date_time">
                                                <span class="input-group-addon">To</span>
                                                <input type="text" class="form-control datepicker" name="to_date_time">
                                            </div>
                                        </div>
                                        <label for="Name" class="control-label col-lg-2">Visitor Type</label>
                                        <div class="col-lg-4">
                                            <label class="control-label col-lg-2">
                                                <input type="radio" name="visitor_type" value="1"> VIP
                                            </label>
                                            <label class="control-label col-lg-3">
                                                <input type="radio" name="visitor_type" value="2"> Normal
                                            </label>
                                            <label class="control-label col-lg-3">
                                                <input type="radio" name="visitor_type" value="3"> Intern
                                            </label>
                                        </div>
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
                            Visitor List
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
                                    <th>#</th>
                                    <th>Visitor Name</th>
                                    <th>Medical Collage</th>                                    
                                    <th>Course</th>
                                    <th>Subject</th>
                                    <th>Degree</th>
                                    <th>Cell No</th>
                                    <th>Email</th>
                                    <th>Visitor Status</th>
                                    <th>Purpose</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($rec)) {

                                        foreach ($rec as $key => $value) {
                                        ?>
                                        <tr>
                                            <td><?php  echo $key+1;?></td>
                                            <td><?php echo $value->name; ?></td>
                                            <td><?php echo $collage_list[$value->med_coll]; ?></td>                                            
                                            <td><?php echo $value->course; ?></td>                                            
                                            <td><?php echo $value->subject; ?></td>                                            
                                            <td><?php echo $value->degree; ?></td>                                            
                                            <td><?php echo $value->mobile; ?></td>
                                            <td><?php echo $value->email; ?></td>
                                            <td><?php 
                                                if($value->visitor_type == '1')
                                                {echo 'VIP';}
                                                elseif($value->visitor_type == '2')
                                                {echo 'Normal';}
                                                elseif ($value->visitor_type == '3') {echo 'Intern';}
                                                ?>
                                            </td>
                                            <td><?php echo $value->purpose; ?></td>
                                            <td>
                                                <?php 
                                                    if($value->status == 1){
                                                        echo"Active";
                                                    }elseif($value->status == 0){
                                                        echo"Inactive";
                                                    }else{
                                                        echo"";
                                                    }
                                                ?>
                                            </td>
                                           
                                            <td class="text-center">
                                                <a href="<?php echo base_url().'visitor/edit/'.$value->id; ?>" class="btn btn-warning btn-xs" title="Edit" data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square-o"></i></a>
                                            </td>
                                        </tr>                                       
                                        <?php
                                        }
                                    }else{
                                        echo'<tr><td colspan="13" align="center">No Data Available</td></tr>';
                                    }
                                    ?>
                                    <tr>
                                        <td colspan="13">
                                            <?php echo $links;?>
                                        </td>
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
