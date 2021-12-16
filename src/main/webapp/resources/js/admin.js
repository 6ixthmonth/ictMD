/**
 * 
 */

$(function() {
	$('#adminTbl tbody tr').hover(function() {
	    $(this).addClass('hover');
	}, function() {
	    $(this).removeClass('hover');
	});
	
	$('#adminTbl tbody tr').click(function() {
		var model = $(this).children().eq(1).text();
		console.log(model);
		location.href='adminDetail?modelName=' + model;
	});
	
	$('#btnInsertFormModel').click(function() {
		location.href='adminModelInsertForm';
	});
	
	$('#btnInsertModel').click(function() {
		var form = $('#formDetail');
		form.attr('action', 'insertModel');
		form.submit();
	});
	
	$('#btnDeleteModel').click(function() {
		var model = $("#model").val();
		console.log(model);
		location.href='deleteModel?modelName=' + model;
	});
	
	$('#btnUpdateModel').click(function() {
		var form = $('#formDetail');
		form.attr('action', 'updateModel');
		form.submit();
	});
});
