$(document).on("page:change", function() {
	console.log("running");
//	console.log($('#drugs').data("source"));
	$("#drugs").dataTable();
	
	$('#myTabs a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	})
});