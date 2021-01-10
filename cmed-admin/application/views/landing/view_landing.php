<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="BIGM">
    <link rel="icon" type="text/css" href="<?= base_url('images/favicon.png'); ?>">

    <title><?= $company->name; ?></title>

    <!--Core CSS -->
    <link href="<?php echo base_url(); ?>bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>css/bootstrap-reset.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="<?php echo base_url(); ?>css/style.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>css/style-responsive.css" rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <!--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>-->
    <!--<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>-->
    <!--[endif]-->
    <style>
        body {
            margin-top: 0 !important;
        }
    </style>
</head>

<body class="">

<div class="login-body">
    <div class="container landing">
        <h1>
            <img src="<?= base_url('images/logo-banbesis.png') ?>" alt="cmed logo">
			বাংলাদেশ শিক্ষাতথ্য ও পরিসংখ্যান ব্যুরো (ব্যানবেইস)
        </h1>

        <div class="row">

            <h2>
                ৯ম জাতীয় ক্যাম্পুরীর সাসটেইনেবল ডেভেলপমেন্ট ভিলেজ
            </h2>
            <div class="col-md-6 col-md-offset-3">
                <div class="row login-block">
                    <div class="col-sm-6"><a href="<?= site_url('login?type=admin') ?>"><img class="img-responsive" src="<?= base_url('images/admin.png') ?>" alt="Admin Login"><span>এডমিন লগিন</span></a></div>
                    <div class="col-sm-6"><a href="<?= site_url('exam/exam_start') ?>"><img class="img-responsive" src="<?= base_url('images/exam.png') ?>" alt="Student Login"><span>টেস্ট শুরু করুন</span></a></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<script src="<?php echo base_url(); ?>js/lib/jquery.js"></script>
<script src="<?php echo base_url(); ?>bs3/js/bootstrap.min.js"></script>

</body>
</html>
