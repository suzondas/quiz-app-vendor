var LOADER = "<i class='fa fa-spinner fa-spin'></i>";
// All kinds of form submitter
jnn_submitter = function (t, e) {

    var that = $(t);
    var form = that.parents('form');
    var action = form.attr('action');
    var method = form.attr('method');
    var btn_text = $(t).html();

    $.validator.setDefaults({
        debug: true,
        success: 'valid',
    });

    $(form).validate();
    var valid = form.valid();

    if (valid) {
        $(form).one('submit', function (e) {
            e.preventDefault();

            $(t).attr('disabled', 'disabled').text('Submitting...');

            var form_data = new FormData(this);

            $.ajax({
                url: action,
                type: method,
                data: form_data,
                processData: false,
                contentType: false,
                mimeType: "multipart/form-data",
                dataType: 'json',
            })
                .done(function (response) {
                    //console.log(response);

                    if (response.success) {
                        if (response.redirect != undefined && response.redirect) {
                            window.location.href = response.redirect;
                        }
                        if (response.msg) jNotify('success', response.msg, '.cmxform');
                    } else {
                        if (response.msg) jNotify('error', response.msg, '.cmxform');
                    }
                    if (response.reset) {
                        $(form)[0].reset();
                    }
                    $(window).scrollTop(0);
                    // if (response.reload) {
                    //     location.reload();
                    // }
                })
                .fail(function (response) {
                    //console.log(response.responseText);
                })
                .always(function (response) {
                    $(t).removeAttr('disabled').html(btn_text);
                });
        });
    }

}
/**
 * Custom Notification
 * @param type
 * @param msg
 * @param target
 */
jNotify = function (type, msg, target) {
    var heading, class_name, icon;
    if (type == 'success') {
        heading = 'Successfull!';
        class_name = 'success';
        icon = 'fa-check-square-o';
    }
    else if (type == 'error') {
        heading = 'Error!';
        class_name = 'danger';
        icon = 'fa-warning';
    }

    var msg = '<div class="alert alert-' + class_name + ' fade in"><button data-dismiss="alert" class="close close-sm" type="button"><i class="fa fa-times"></i></button><h4><i class="fa ' + icon + '"></i>' + heading + '</h4><p>' + msg + '</p></div>';

    if ($(target).find('.alert').length > 0) {
        $(target).find('.alert').hide(0, function () {
            $(this).remove();
        });
    }

    $(target).prepend(msg);

};

/**
 * Redirect
 * @param $url URL Should be full url
 */
redirect = function ($url) {
    window.location.href = $url;
};

/**
 * Show the next question
 * @param this object
 * @param e event object
 */
next_question = function (t, e) {

    var conf = confirm('Are You Sure?');

    if (conf) {
        console.log('confirmed');
        var that = $(t);
        var form = that.closest('form');
        var action = form.attr('action');
        var method = form.attr('method');
        var btn_text = $(t).html();
        var action_name = $(t).attr('name');

        $(form).one('submit', function (e) {
            e.preventDefault();

            var form_data = new FormData(this);
            form_data.append('action_name', action_name);

            $.ajax({
                url: action,
                beforeSend: function () {
                    $(t).attr('disabled', 'disabled').html(LOADER);
                    $(form).find('.err-msg').remove();
                },
                type: method,
                data: form_data,
                processData: false,
                contentType: false,
                mimeType: "multipart/form-data",
                dataType: 'json',
            })
                .done(function (response) {
                    if (response.redirect) {
                        redirect(response.redirect);
                    }
                    if (response.success) {
                        if (response.content) {
                            $(form).find('.question-answer').html(response.content);
                        }
                    } else {
                        if (response.msg) jNotify('error', response.msg, false, form);
                    }
                })
                .fail(function (response) {
                    console.log(response.responseText);
                })
                .always(function (response) {
                    $(t).removeAttr('disabled').html(btn_text);
                    if (response.remaining == 1) {
                        $(t).siblings('button[name=skip]').hide();
                        $(t).text('Submit');
                    }
                });
        });
    } else {
        console.log('not confirmed');
        e.preventDefault();
    }

};
