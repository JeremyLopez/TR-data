setDefaultVisibility = function(table) {
	console.log("here iam")
	$(".toggle-vis#3").addClass("remove-col");
	var columm = table.column( $(".toggle-vis#3").attr('data-column') )
	column.visible( ! column.visible() );
}

$(document).on("page:change", function() {
	var table_pharma = $("#pharmacologies").DataTable({
		"autoWidth": false,
		"dom": "Blfrtip",
		"Processing": true,
    "serverSide": true,
    "ajax": {
			url : $('#pharmacologies').data('source'),
			type: "post"
		},
		"columnDefs": [{
			"targets": 0,
			"data": 'link',
			"render": function(data, type, full, meta) {
				return '<a href="/drugs/'+full[0]+'">'+full[1]+'</a>';
			}
		}, {
			"targets": 1,
			"visible": false
		}, {
		}],
		colReorder: true,
		buttons: [
			'copy', 'csv', 'excel', 'pdf'
		]
	});
	
	var drug_pharma = $("#drug-pharma").DataTable({
		"columnDefs": [{
			"targets": 1,
			"visible": false
		}]
	});
	
	$('.col-filter-pharma th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
	
		$('.drug_pharma_filter th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
	
	 $(".col-filter-pharma input").on( 'keyup change', function () {
        table_pharma
            .column( $(this).parent().index()+':visible' )
            .search( this.value )
            .draw();
    } );
	
		$(".drug_pharma_filter input").on( 'keyup change', function () {
        drug_pharma
            .column( $(this).parent().index()+':visible' )
            .search( this.value )
            .draw();
    } );
	
	var exclude_pharma = [".show-toggle-vis#3", ".show-toggle-vis#4", ".show-toggle-vis#5", ".show-toggle-vis#13", ".show-toggle-vis#16", ".show-toggle-vis#17", ".show-toggle-vis#18",  ".show-toggle-vis#19",  ".show-toggle-vis#20",  ".show-toggle-vis#21",  ".show-toggle-vis#22"] 
	
	$(".show-toggle-vis.remove-col").removeClass("remove-col");
	
	for ( i=0; i < exclude_pharma.length; i++ ) {
		var column = table_pharma.column( $(exclude_pharma[i]).attr('data-column'))
		$(exclude_pharma[i]).addClass("remove-col");
		column.visible( ! column.visible() );
	}
	
	for ( i=0; i < exclude_pharma.length; i++ ) {
		var column = drug_pharma.column( $(exclude_pharma[i]).attr('data-column'))
		$(exclude_pharma[i]).addClass("remove-col");
		column.visible( ! column.visible() );
	}
	
	$('a.show-toggle-vis').on( 'click', function (e) {
		e.preventDefault();

		// Get the column API object
		var column = table_pharma.column( $(this).attr('data-column') );
		var show_column = drug_pharma.column( $(this).attr('data-column') );
		if ( $(this).hasClass("remove-col") ) {
			$(this).removeClass("remove-col");
		} else {
			$(this).addClass("remove-col");
		}
		// Toggle the visibility
		column.visible( ! column.visible() );
		show_column.visible( ! show_column.visible() );
  });
	
//	table.fnAdjustColumnSizing();
	table_pharma.columns.adjust().draw();
});