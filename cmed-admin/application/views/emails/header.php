<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><?= $company->name; ?> :: <?= $subject; ?></title>
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600&display=swap" rel="stylesheet">
	<style>
		body {
			margin: 0;
			padding: 0;
			outline: 0;
			font-family: 'Source Sans Pro', sans-serif;
			font-size: 16px;
		}
		
		.wrapper {
			max-width: 100%;
			margin: 0 auto;
			background: #fff;
		}
		
		a {
			text-decoration: none;
		}
		
		.logo {
			text-align: center;
		}
		
		.logo img {
			max-height: 60px;
			width: auto;
		}
		
		.reg-success h1 {
			color: #4CAF50;
			text-align: center;
		}
		
		.main {
			text-align: justify;
			padding: 20px;
		}
		
		.reg-success p i {
			color: #0091EA;
		}
		
		.text-center {
			text-align: center;
		}
		
		hr {
			border: 1px solid #efefef;
		}
		
		a.btn {
			padding: 10px 20px;
			display: inline-block;
			text-decoration: none;
			color: #fff;
			border: 1px solid #ddd;
		}
		
		.btn.btn-success {
			background: #43A047;
		}
		
		.btn.btn-info {
			background: #00B0FF;
		}
		
		table th {
			vertical-align: top;
			text-align: left;
		}
		
		.copyright {
			text-align: center;
			font-size: 10px;
			color: #666;
		}
		
		.copyright a {
			color: #666;
			text-decoration: none;
		}
	</style>
</head>
<body>

<div class="wrapper">
	<div class="logo">
		<a href="<?= config_item( 'home_url' ); ?>">
			<img src="<?= base_url( $company->logo ) ?>" alt="<?= $company->name; ?>">
		</a>
	</div>
	<hr>
