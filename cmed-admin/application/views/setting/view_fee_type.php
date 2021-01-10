<?php
$this->load->view('header/view_header');
?>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            
            <div class="row">
                <div class="col-lg-9">
                    <section class="panel">
                        <header class="panel-heading">
                            Fee Type
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <?php                            
                                if(validation_errors()){
                                    echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>','</div>');
                                }
                                if ($this->session->flashdata('flashOK')) {
                                    echo"<div class=\"alert alert-success fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                    echo $this->session->flashdata('flashOK');
                                    echo"</div>";
                                }
                                if ($this->session->flashdata('flashError')) {
                                    echo"<div class=\"alert alert-block alert-danger fade in\"><button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
                                    echo $this->session->flashdata('flashError');
                                    echo"</div>";
                                }
                                ?>
                                <?php
                                if($form_action == "add"){
                                    $action_url = base_url().'setting/save_fee_type';
                                }elseif($form_action == "edit"){
                                    $action_url = base_url().'setting/update_fee_type';
                                }
                                ?>
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo $action_url; ?>">
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Name</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="name" name="name" type="text" value="<?php echo isset($res->name) ? $res->name : ''; ?>" required/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="code" class="control-label col-lg-3 col-sm-3">Fee Group</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"';
                                            echo form_dropdown('code', $fee_type_code_array, set_value('code', (isset($res->code)) ? $res->code : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Status</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15"';
                                            echo form_dropdown('status', $status_array, set_value('status', (isset($res->status)) ? $res->status : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo isset($res->id) ? $res->id : ''; ?>">
                                            <button class="btn btn-primary" type="submit">Save</button>
                                            
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
                    <section class="panel">
                        <header class="panel-heading">
                            Fee Type List
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
                                    <th>Name</th>
                                    <th>Group</th>
                                    <th>Created By</th>
                                    <th>Creation Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($record)) {

                                        foreach ($record as $key => $value) {
                                        ?>
                                        <tr>
                                            <td><?php echo $value->name; ?></td>
                                            <td>
                                                <?php 
                                                if($value->code == 'af'){
                                                    echo 'Admission Fee Group';
                                                }elseif($value->code == 'mtf'){
                                                    echo 'Monthly Tution Fee Group';
                                                }elseif($value->code == 'ef'){
                                                    echo 'Examination Fee Group';
                                                }elseif($value->code == 'of'){
                                                    echo 'Others Fee Group';
                                                }else{
                                                    echo '';
                                                }
                                                ?>
                                            </td>
                                            <td><?php echo $value->created_by; ?></td>
                                            <td><?php echo $value->created_date_time; ?></td>
                                            <td>
                                                <?php 
                                                if($value->status==1){
                                                    echo "Active"; 
                                                }elseif($value->status==2){
                                                    echo "Inactive"; 
                                                }else{
                                                    echo"";
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <a href="<?php echo base_url().'setting/edit_fee_type/'.$value->id; ?>"><i class="fa fa-pencil-square-o"></i></a>
                                            </td>
                                        </tr>
                                        <?php
                                        }
                                    }else{
                                        echo'<tr><td colspan="5" align="center">No Data Available</td></tr>';
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