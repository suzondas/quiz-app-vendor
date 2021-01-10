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
                            Edit Fee
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal " id="commentForm" role="form" method="post" action="<?php echo base_url().'setting/update_fee'; ?>">
                                    <?php                            
                                    if(validation_errors()){
                                        echo validation_errors('<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button>','</div>');
                                    }
                                    ?>
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Class</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown('class_id', $class_list,set_value('class_id', (isset($res->class_id)) ? $res->class_id : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Status" class="control-label col-lg-3 col-sm-3">Class</label>
                                        <div class="col-lg-6 col-sm-9">
                                            <?php
                                            $ddp = 'class="form-control m-bot15" required';
                                            echo form_dropdown('fee_type_id', $fee_type_list,set_value('fee_type_id', (isset($res->fee_type_id)) ? $res->fee_type_id : ''),$ddp);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Amount</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="fee_amount" name="fee_amount" type="text" value="<?php echo $res->fee_amount; ?>" required/>
                                        </div>
                                    </div>
                                    
<!--                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Discount Amount Percentage</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="discount_amount_per" name="discount_amount_per" type="text" value="<?php echo $res->discount_amount_per; ?>"/>
                                        </div>
                                    </div>-->
                                    
                                    <div class="form-group ">
                                        <label for="Name" class="control-label col-lg-3">Discount Amount</label>
                                        <div class="col-lg-6">
                                            <input class=" form-control" id="discount_amount" name="discount_amount" type="text" value="<?php echo $res->discount_amount; ?>"/>
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
                                            <input type="hidden" name="hidden_auto_id" id="hidden_auto_id" value="<?php echo $res->id;?>">
                                            <button class="btn btn-primary" type="submit">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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