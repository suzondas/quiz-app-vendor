/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function change_by_exam() {
	//alert('hi');
	var data_exam_info_id = $("#exam_info_id").val();
	//alert(exam_info_id);
	$.ajax({
		type: "POST",
		url: site_url_path + 'marks_entry/auto_data_by_exam_id',
		dataType: "json",
		data: "exam_auto_id=" + data_exam_info_id,

		success: function (result) {
			//$("#exam_auto_id").val(result.data_exam_auto_id);
			$("#full_marks").val(result.data_full_marks);
		}

	});
}

function change_by_course_name() {

	var DATA_COURSE_NAME = $("#COURSE_NAME").val();

	$.ajax({
		type: "POST",
		url: site_url_path + 'examination/auto_data_by_course_name',
		dataType: "json",
		data: "COURSE_NAME=" + DATA_COURSE_NAME,

		success: function (result) {
			$("#COURSE_CODE").val(result.DATA_COURSE_CODE);

		}

	});
}


function getDistricttByAjax(paramUrl) {
	var appUrl = paramUrl;

	var division_id = $("#division_id").val();
	//alert(appUrl);
	$.ajax({
		url: appUrl,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		dataType: "html",
		data: "division_id=" + division_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			console.log(response);
			//alert(response);
			$('#district_id').html(response);

		}

	});
	return false;

}

function getDistricttByAjax2(paramUrl) {
	var appUrl = paramUrl;

	var division_id = $("#division_id2").val();
	//alert(division_id);
	$.ajax({
		url: appUrl,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		dataType: "html",
		data: "division_id2=" + division_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			console.log(response);
			//alert(response);
			$('#district_id2').html(response);

		}

	});
	return false;
}

function getThanaByAjax(paramUrl) {
	var appUrl = paramUrl;

	var district_id = $("#district_id").val();
	//alert(district_id);
	$.ajax({
		url: appUrl,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		dataType: "html",
		data: "district_id=" + district_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			console.log(response);
			//alert(response);
			$('#thana_id').html(response);

		}

	});
	return false;
}

function getThanaByAjax2(paramUrl) {
	var appUrl = paramUrl;

	var district_id = $("#district_id2").val();
	//alert(district_id);
	$.ajax({
		url: appUrl,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		dataType: "html",
		data: "district_id2=" + district_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			console.log(response);
			//alert(response);
			$('#thana_id2').html(response);

		}

	});
	return false;
}

function get_faculty_by_course(paramUrl) {
	var appUrl = paramUrl;

	var course_code = $("#course_code").val();
	//var ser_pack_id = $("#ser_pack_id").val();
	// alert(course_code);
	$.ajax({
		url: appUrl,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		data: {course_code: course_code}, //{course_code: course_code, ser_pack_id: ser_pack_id},the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			//console.log(response);
			//alert(response);
			$('#faculty_code').html(response);

		},
		error: function (res) {
			console.log(res.responseText);
		}

	});
	return false;

}

function get_faculty_id(url_value) {
	var urlval = url_value;
	var course_code = $("#course_code").val();
	var faculty_code = $("#faculty_code").val();
//   alert(urlval);
	$.ajax({
		url: urlval,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		dataType: "json",
		data: {faculty_code: faculty_code, course_code: course_code},
		//data: "faculty_id=" + faculty_id+",course_id="+course_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{

			console.log(response);
			//alert(response);
			if (typeof (response.subject) != "undefined") {
				$('#subject_code').html(response.subject);
			}
			if (typeof (response.batch) != "undefined") {
				$('#batch_code').html(response.batch);
			}
			if (typeof (response.topic) != "undefined") {
				$('#topic_code').html(response.topic);
			}

			$(".multi-select").multiSelect("refresh");
			//alert(response);
		},
		error: function (res) {
			alert(res.responseText);
		}

	});
	return false;
}

function get_course_code(url) {
	var url_val = url;
	var ser_pack_id = $("#ser_pack_id").val();
	var course_code = $("#course_code").val();
	var admi_type = $("#admi_type").val();
	// alert(ser_pack_id);
	$.ajax({
		url: url_val,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		data: {ser_pack_id: ser_pack_id, course_code: course_code, admi_type: admi_type},
		//data: "faculty_id=" + faculty_id+",course_id="+course_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{

			$('#fee_amount').val(response);

			console.log(response);
		}

	});
	return false;

}


function getUpazallaByAjax(paramUrl) {
	var appUrl = paramUrl;
	var valore = $("#district").val();
	$("#upazilla").find("option").remove();

	if (valore == '') {
		return false;
	}
	$.ajax({
		url: appUrl + "ajax_get_upazalla",
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		async: false,
		dataType: "html",
		data: "district_id=" + valore, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			//counts the number of dynamically generated options
			var dynamic_options = $("*").index($('.dynamic')[0]);
			//removes previously dynamically generated options if they exists (not equal to 0)
			if (dynamic_options != (-1)) $(".dynamic").remove();
			$("#upazilla").append(response);
			$(".first").attr({selected: ' selected'});

		}

	});
	// $("#your_span").hide('slow');// end animation
	return false

}

function getUpazallaByAjaxAns(paramUrl) {
	var appUrl = paramUrl;
	var valore = $("#answerer_district").val();
	$("#answerer_upazilla").find("option").remove();

	if (valore == '') {
		return false;
	}
	$.ajax({
		url: appUrl + "ajax_get_upazalla_ans",
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		async: false,
		dataType: "html",
		data: "district_id=" + valore, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{
			//counts the number of dynamically generated options
			var dynamic_options = $("*").index($('.dynamic')[0]);
			//removes previously dynamically generated options if they exists (not equal to 0)
			if (dynamic_options != (-1)) $(".dynamic").remove();
			$("#answerer_upazilla").append(response);
			$(".first").attr({selected: ' selected'});

		}

	});
	// $("#your_span").hide('slow');// end animation
	return false

}

function get_student_list() {

	// alert(site_url_path);
	var section = $('#section').val();
	var class_id = $('#class').val();
	var group_id = $('#group').val();

	var options = {
		selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
		selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
		afterInit: function (ms) {
			var that = this,
				$selectableSearch = that.$selectableUl.prev(),
				$selectionSearch = that.$selectionUl.prev(),
				selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
				selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

			that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
				.on('keydown', function (e) {
					if (e.which === 40) {
						that.$selectableUl.focus();
						return false;
					}
				});

			that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
				.on('keydown', function (e) {
					if (e.which == 40) {
						that.$selectionUl.focus();
						return false;
					}
				});
		},
		afterSelect: function () {
			this.qs1.cache();
			this.qs2.cache();
		},
		afterDeselect: function () {
			this.qs1.cache();
			this.qs2.cache();
		}
	};

	// alert(section+'/'+class_id+'/'+group_id);
	// alert(url);

	$.ajax({
		url: site_url_path + 'notice/get_student_list/',
		type: 'POST',
		data: {section: section, class_id: class_id, group_id: group_id},
		dataType: 'json',
	})
		.done(function (ret) {

			$('.student_list').multiSelect('destroy');

			$('.student_list').html(ret.cont);

			$('.student_list').multiSelect(options);

			// alert(ret.cont);
		})
		.fail(function (ret) {
			alert(ret.responseText);
		});

};

change_exams = function (t) {
	var val = $(t).val();
	var url = site_url_path + 'marks_entry/get_changed_exam_value';
	var data = {value: val};

	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		dataType: 'json',
	})
		.done(function (ret) {
			// alert(ret.cont);
			$('[name=exam_info_id]').html(ret.exam);
			$('[name=student_id]').html(ret.student);
		})
		.fail(function (ret) {
			alert(ret.responseText);
		})
		.always(function (ret) {
			console.log(ret);
		});
};

get_changed_students = function (t) {
	var val = $(t).val(),
		class_id = $('[name=class_id]').val();
	var url = site_url_path + 'marks_entry/get_filtered_student_list';
	var data = {value: val, class_id: class_id};

	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		dataType: 'json',
	})
		.done(function (ret) {
			// alert(ret.cont);
			$('[name=student_id]').html(ret.cont);
		})
		.fail(function (ret) {
			alert(ret.responseText);
		})
		.always(function (ret) {
			console.log(ret);
		});
};

calculate_final_amount = function (t) {
	var discount = $(t).val();
	var fee_amt = $("#fee_amount").val();
	var final_amt = fee_amt - discount;
	$("#final_amount").val(final_amt);
}

function yesnoCheck() {
	if (document.getElementById('yesCheck').checked) {
		document.getElementById('ifYes').style.visibility = 'visible';
	} else document.getElementById('ifYes').style.visibility = 'hidden';

}


/* Find Faculty By Course Code */
find_faculty_by_course = function (t) {
	var val = $(t).val(),
		target = $(t).data('cf');
	var url = site_url_path + target;
	var data = {course_code: val};
	// alert(url);
	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		dataType: 'html',
	})
		.done(function (ret) {
			//alert(ret);
			$(t).parents('.each-row').find('.faculty_code').html(ret);
		})
		.fail(function (ret) {
			alert(ret.responseText);
		})
		.always(function (ret) {
			console.log(ret);
		});
};
/* Find Subject/Topic By Course Code & Faculty Code */
find_subject_topic = function (t) {
	$(t).parents('.each-row').addClass('active');
	var val = $(t).val(),
		target = $(t).data('cf'),
		course_code = $(t).parents('.each-row').find('.course_code').val(),
		row = $(t).parents('.each-row.active');
	var url = site_url_path + target;
	var data = {course_code: course_code, faculty_code: val};
	// alert(course_code);
	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		dataType: 'json',
	})
		.done(function (ret) {
			//alert(ret);
			row.find('.subject_code').html(ret.subject);
			row.find('.topic_code').html(ret.topic);
			//$(row).find('.multi-select').multiSelect('refresh');
		})
		.fail(function (ret) {
			alert(ret.responseText);
		})
		.always(function (ret) {
			console.log(ret);
			$(t).parents('.each-row').removeClass('active');
		});
};

function get_doctor_list(url) {
	var url_val = url;
	var year = $('#year').val();
	var session_id = $('#session_id').val();
	var course_code = $('#course_code').val();
	var faculty_code = $('#faculty_code').val();
	var batch_code = $('#batch_code').val();
	//alert(batch_code);
	$.ajax({
		url: url_val,
		beforeSend: function (data) {
			//  $("#your_span").show('slow');
		},
		global: false,
		type: "POST",
		//async: false,
		data: {year: year, session_id: session_id, course_code: course_code, faculty_code: faculty_code, batch_code: batch_code},
		//data: "faculty_id=" + faculty_id+",course_id="+course_id, //the name of the $_POST variable and its value
		success: function (response) //'response' is the output provided by the controller method prova()
		{

			$('#doctor_id').html(response);
			//console.log(response);
			$(".multi-select").multiSelect("refresh");
		}


	});
	return false;
}


/* Find Subject/Topic By Course Code & Faculty Code */
get_acct_head_by_type = function (t) {
	var val = $(t).val(),
		target = $(t).data('target');

	var url = site_url_path + target;
	var data = {acctype: val};
	// alert(course_code);
	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		dataType: 'json',
	})
		.done(function (ret) {
			//alert(ret);
			$('.subject_code').html(ret.subject);
			row.find('.topic_code').html(ret.topic);
			//$(row).find('.multi-select').multiSelect('refresh');
		})
		.fail(function (ret) {
			alert(ret.responseText);
		})
		.always(function (ret) {
			console.log(ret);
			$(t).parents('.each-row').removeClass('active');
		});
};

// Allow numbers only in input number field
$(".number-only").keydown(function (e) {
	// Allow: backspace, delete, tab, escape, enter and .
	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
		// Allow: Ctrl+A, Command+A
		(e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
		// Allow: home, end, left, right, down, up
		(e.keyCode >= 35 && e.keyCode <= 40)) {
		// let it happen, don't do anything
		return;
	}
	// Ensure that it is a number and stop the keypress
	if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		e.preventDefault();
	}
});

add_more = function (that, e) {
	e.preventDefault();
	var that_row = $(that).parents('.each-row');
	var each_row = $(that_row).html();
	$(that).parents('.each-row').after("<tr class='each-row'>" + each_row + "</tr>");
	$(that).parents('.each-row').next('.each-row').find('input, select, textarea').val('');
	$(that).remove();
	$(that_row).find('.btn.remove').css('display', 'inline-block');
};

remove_item = function (that, e) {
	e.preventDefault();
	var that_row = $(that).parents('.each-row');
	$(that_row).remove();
};

getUnitByModule = function (that) {
	var module = $(that).val();
	var url = $(that).data('target');
	$.ajax({
		'url': url,
		'type': 'POST',
		'data': {module: module},
		'dataType': 'html',
		success: function (ret) {
			$('#unit').html(ret);
		},
		error: function (err) {
			alert(err.responseText);
		}
	})
};

getDocByYearSession = function (that) {
	var url = $(that).data('url');
	var year = $('[name=year]').val();
	var session = $('[name=session]').val();
	$.ajax({
		'url': url,
		'type': 'POST',
		'data': {year: year, session: session},
		'dataType': 'html',
		success: function (ret) {

			$('#doc_id').html(ret);
			if ($('#doc_id').hasClass('multi-select')) {
				$('.multi-select').multiSelect('refresh');
			}
		},
		error: function (err) {
			console.log(err.responseText);
		}
	})
};

getWeatherInfo = function () {
	var queryURL = "https://api.openweathermap.org/data/2.5/weather?q=Dhaka";

	$.getJSON(queryURL, function (data) {
		console.log(data);
		var results = data.query.results
		var firstResult = results.channel.item.condition
		console.log(firstResult);

		var location = 'Unknown' // not returned in response
		var temp = firstResult.temp
		var text = firstResult.text

		// $('#output').append('The temperature is ' + temp + '. Forecast calls for '+text);

	})
};

// getWeatherInfo();

/**
 * Custom find like browser find
 * @param t
 */
// alert('ha ha ha');
function jnn_find(t) {
	// alert('find');
	var val = $(t).val();
	console.log(val);
	window.find(val);
};

$(function () {
	$('#session, #year').on('change', function (e) {
		var session = $('#session').val();
		var year = $('#year').val();

		$.ajax({
			url: site_url_path + 'teacher/ajax_get_year_session_fellow_list',
			type: 'get',
			data: {year: year, session: session},
			success: function (res) {
				$('#doctors').html(res);
				$(".multi-select").multiSelect("refresh");
			},
			error: function (err) {
				console.log(err.responseText);
			}
		});
	});
});
