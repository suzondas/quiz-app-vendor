<section class="panel">
    <div class="panel-body profile-information">
        <div class="col-md-6">
            <div class="prf-contacts" style="border-right: 1px dotted #333;">
                <h2>Current Module:</h2>
                <h5><?= $module_name; ?></h5>
                <h2>Current Unit - <?= $unit_code; ?></h2>
                <h5><?= $unit_name; ?></h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="prf-contacts">
                <h2><span><i class="fa fa-user"></i></span> Faculty</h2>
                <div class="">
                    <p>Name: <?= $teacher_name; ?></p>
                    <p>Email: <a href="mailto:<?= $teacher_email; ?>" target="_blank"><?= $teacher_email; ?></a></p>
                    <p>Mobile: <a href="tel:<?= $teacher_mobile; ?>"><?= $teacher_mobile; ?></a></p>
                </div>
            </div>
        </div>
    </div>
</section>