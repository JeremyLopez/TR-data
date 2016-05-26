$(document).on("page:change", function() {
	$('#products').DataTable({
    "Processing": true,
    "serverSide": true,
    "ajax": {
			url : $('#products').data('source'),
			type: "get"
		}
	});
});
