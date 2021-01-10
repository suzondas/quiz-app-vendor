<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Big M Resources Ltd.">
    <meta name="author" content="Big M Resources Ltd.">
    <link rel="icon" type="text/css" href="<?= base_url( 'images/favicon.png' ); ?>">

    <title><?= $company->name; ?> - <?= $title; ?></title>

    <!--Core CSS -->
    <link href="<?php echo base_url( 'bs3/css/bootstrap.min.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( 'css/bootstrap-reset.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( 'assets/font-awesome/css/font-awesome.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>

    <!--dynamic table-->
    <link href="<?php echo base_url( 'assets/advanced-datatable/media/css/demo_page.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
    <link href="<?php echo base_url( 'assets/advanced-datatable/media/css/demo_table.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
    <link href="<?php echo base_url( 'assets/bootstrap-timepicker/compiled/timepicker.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/data-tables/DT_bootstrap.css"/>

    <?php if ( $this->uri->segment( 1 ) == '' || $this->uri->segment( 1 ) == 'dashboard' || $this->uri->segment( 1 ) == 'student_dashboard' ): ?>
        <link href="<?php echo base_url( 'assets/jvector-map/jquery-jvectormap-1.2.2.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
        <link href="<?php echo base_url( 'css/clndr.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
        <!--clock css-->
        <link href="<?php echo base_url( 'assets/css3clock/css/style.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/morris-chart/morris.css">
    <?php endif; ?>

    <!-- Custom styles for this template -->
    <link href="<?php echo base_url( 'css/style.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet">
    <link href="<?php echo base_url( 'css/style-responsive.css?v=' . config_item( 'app_version' ) ); ?>" rel="stylesheet"/>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="<?php echo base_url(); ?>js/ie8/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var site_url_path = '<?php echo base_url(); ?>';
    </script>

    <style>
        body {
            margin-top: 0 !important;
        }
    </style>

</head>

<body>

<section id="container" class="jnn-admission">
    <div class="text-center">
        <a href="<?= config_item( 'home_url' ); ?>">
            <?php if ( $company->logo ) : ?>
                <img class="logo" src="<?= base_url( $company->logo ); ?>" alt="<?= $company->name; ?>">
            <?php else: ?>
                <h2>৯ম জাতীয় ক্যাম্পুরীর সাসটেইনেবল ডেভেলপমেন্ট ভিলেজ</h2>
            <?php endif; ?>
        </a>
    </div>
    <hr>
