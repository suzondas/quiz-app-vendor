<?php
$this->load->view('header/view_header');
?>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">

        <div class="row">
            <div class="col-lg-12">
                <section class="panel panel-info">
                    <header class="panel-heading">
                        Evaluation Result
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                             </span>
                    </header>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped">
                            <tbody>
                            <?php
                            if (!empty($t_eva_list)) {

                                foreach ($t_eva_list as $key => $item) {
                                    //echo  count($evaluate_value[$evaluation->introduction]);
                                    ?>
                                    <tr>
                                        <th width="25%"><?= $item; ?></th>

                                        <?php if ($evaluate_value) {
                                            foreach ($evaluate_value as $j => $eva) {
                                                if($j) {
                                                    echo "<th class='text-center'>{$eva} (" . get_evaluation_count($schedule_id, $j, $key) . ") </th>";
                                                }
                                            }
                                        }
                                        ?>

                                    </tr>

                                    <?php
                                }

                                echo "<tr><th>Suggestions</th><td colspan='4'>".get_evaluation_suggesion($schedule_id)."</td></tr>";
                            } else {
                                echo '<tr><td colspan="9" align="center">No Data Available</td></tr>';
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