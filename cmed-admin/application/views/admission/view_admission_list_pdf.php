<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>List</title>
	<link rel="stylesheet" href="<?= base_url( "css/pdf.css" ) ?>">
</head>
<body>
<table class="table table-bordered table-striped">
	<thead>
	<tr>
		<th>#</th>
		<th>Year</th>
		<th>Session</th>
		<th width="20%">Name</th>
		<th>Username</th>
		<th>Mobile</th>
		<th width="10%">Apply Date</th>
		<th width="20%">Present place of work</th>
		<th>Status</th>
	</tr>
	</thead>
	<tbody>
	<?php
	if ( !empty( $rec ) ) {

		foreach ( $rec as $key => $value ) {
			$sl = $key + 1;
			?>
			<tr>
				<td><?php echo $sl; ?></td>
				<td><?php echo $value->year; ?></td>
				<td>
					<?php
					echo $session_list[$value->session];
					?>
				</td>
				<td><?php echo $value->doc_name; ?></td>
				<td><?php echo $value->user_name; ?></td>
				<td><?php echo $value->phone; ?></td>
				<td class="text-center">
					<?= user_date( $value->created_at ); ?>
				</td>
				<td><?php echo $value->present_work_place; ?></td>
				<td class="text-center">
					<?php
					if ( $value->status == 1 ) {
						echo 'Active';
					} elseif ( $value->status == 2 ) {
						echo 'Completed';
					} else {
						echo 'Inactive';
					}
					?>
				</td>
			</tr>

			<?php
		}
	} else {
		echo '<tr><td colspan="15" align="center">No Data Available</td></tr>';
	}
	?>
	</tbody>
</table>
</body>
</html>
