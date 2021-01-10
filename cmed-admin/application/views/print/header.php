<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<?php echo base_url( "bs3/css/bootstrap.min.css?v=" . config_item( 'app_version' ) ); ?>" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<?= base_url( 'css/pdf.css' ); ?>">

    <title><?= $page_title; ?></title>

</head>
<body>

<div class="header-content">

    <table class="no-border">
        <tr>
            <td class="text-center" style="font-size: 14px; height: 40px"></td>
        </tr>
        <tr>
            <th class="text-center" style="font-size: 14px">BIRDEM Academy</th>
        </tr>
        <tr>
            <th class="text-center" style="font-size: 14px">Certificate course in Medical Education (CMed)</th>
        </tr>
    
        <?php if ( isset( $page_title ) && $page_title ): ?>
            <tr>
                <th class="text-center bangla title" style="font-size: 14px">Transcript</th>
            </tr>
        <?php endif; ?>
    </table>


</div>
