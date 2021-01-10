(function ($) {
    "use strict";
    // Timer plugin for exam
    $.fn.jTimer = function (options) {
        var op = $.extend({time: 10}, options);
        var min = new Date().getMinutes();
        var countDownTime = new Date().setMinutes(min + op.time);
        var target = this;

        // Update the count down every 1 second
        var x = setInterval(function () {

            // Get todays date and time
            var now = new Date().getTime();

            // Find the distance between now an the count down date
            var distance = countDownTime - now;

            var minutes = new Date(distance).getMinutes();
            var seconds = new Date(distance).getSeconds();

            // add leading 0
            minutes = ("0" + minutes).slice(-2);
            seconds = ("0" + seconds).slice(-2);

            // Display the result in the element with id="demo"
            var time = minutes.toString() + ":" + seconds.toString();
            // If the count down is finished, write some text
            if (distance < 0) {
                clearInterval(x);
                time = "00:00";
            }
            if (minutes < 2 && seconds <= 59) {
                target.css('color', 'red');
            }
            // console.log(time);
            target.text(time);
            target.siblings('input[name=timer]').val(time);

            if (minutes == 0 && seconds == 0) {
                swal({
                    title: 'Time Up!',
                    text: 'Your Answer will be submitted autometically',
                    type: 'info',
                    timer: 5000,
                    onOpen: function () {
                        swal.showLoading()
                    },
                }).then(function (result) {
                    target.closest('form').find('[type=submit][name=next]').click();
                });
            }
        }, 1000);
    };
})(jQuery);