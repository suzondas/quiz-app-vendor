<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raw MCQ</title>
    <link href="<?php echo base_url(); ?>bs3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="panel">
    <div class="panel-body">
        <table class="table table-bordered table-striped">
            <?php if ( $results ) : ?>
                <?php $keys = array_keys( $results[0] ); ?>
                <thead>
                <tr>
                    <th colspan="<?= (count( $keys ) + 2) ?>">
                        <?= "Total {$total_rows} results found in {$year} - {$session} - {$unit}"; ?>
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <?php foreach ( $keys as $key ) {
                        if ( $key == 'doc_id' ) {
                            echo "<th>Doc Name</th>";
                        }
                        echo "<th>" . $key . "</th>";
                    } ?>
                </tr>
                </thead>
                <tbody>
                <?php foreach ( $results as $k => $result ): ?>
                    <tr>
                        <td><?= (++$k); ?></td>

                        <?php foreach ( $result as $j => $value ) {
                            if ( $j == 'doc_id' ) {
                                $name = get_name_by_auto_id( 'sif_admission', $value, 'doc_name' );
                                echo "<td>{$name}</td>";
                            }
                            echo "<td>{$value}</td>";
                        } ?>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            <?php endif; ?>
        </table>
    </div>
</div>

</body>
</html>