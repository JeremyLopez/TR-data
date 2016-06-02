function JSON2CSV(objArray) {
    var array = typeof objArray != 'object' ? JSON.parse(objArray) : objArray;
    var str = '';
    var line = '';

    if ($("#labels").is(':checked')) {
        var head = array[0];
        if ($("#quote").is(':checked')) {
            for (var index in array[0]) {
                var value = index + "";
                line += '"' + value.replace(/"/g, '""') + '",';
            }
        } else {
            for (var index in array[0]) {
                line += index + ',';
            }
        }

        line = line.slice(0, -1);
        str += line + '\r\n';
    }

    for (var i = 0; i < array.length; i++) {
        var line = '';

        if ($("#quote").is(':checked')) {
            for (var index in array[i]) {
                var value = array[i][index] + "";
                line += '"' + value.replace(/"/g, '""') + '",';
            }
        } else {
            for (var index in array[i]) {
                line += array[i][index] + ',';
            }
        }

        line = line.slice(0, -1);
        str += line + '\r\n';
    }
    return str;
}

function setDefaultVisibility(table) {
	console.log("here iam")
	$(".toggle-vis#3").addClass("remove-col");
	var columm = table.column( $(".toggle-vis#3").attr('data-column') )
	column.visible( ! column.visible() );
}

function getAllRecords() {
	var req = $("#drugs").DataTable().ajax.params();

 // Reset request parameters to retrieve all records
 req.start = 0;
// req.length = ;
 req.search.value = "";

 // Request data
 $.ajax({
		'url': $('#drugs').data('source'),
		'data': req,
	 	'type': "post",
		'dataType': 'json'
 })
 .done(function(json){
		// json.data is array of data source objects (array/object),
		// one for each row
		processAll(json.iTotalDisplayRecords);
//	 var x = req.ajax.json();
//	 console.log(x);
 });
}

function JSONtoCSV(data) {
	var data = data;
	
//	var csvContent = "data:text/csv;charset=utf-8,";
////	full = []
//	data.forEach(function(infoArray, index){
////
//////		console.log(infoArray);
////		
//   	dataString = infoArray.join(",");
////		dataString = infoArray
//   csvContent += dataString + "\n";
////
////	});
////	console.log(csvContent);
//	var encodedUri = encodeURI(data);
//	window.open(encodedUri);
	cols = "DRUG_NAME\tDRUG_NAME\tTARGET_NAME\tHIGHEST_PHASE\tPRODUCT_CATEGORY\tMOLECULAR_MECHANISM\tCELLULAR_MECHANISM\tUNDER_ACTIVE_DEVELOPMENT\tSMILES\tACTIVE_CONDITIONS\tINACTIVE_CONDITIONS\tORIGINATOR_ORGANIZATION\tACTIVE_ORGANIZATION\tINACTIVE_ORGANIZATION\tSEQUENCE\tCAS_NUMBER\tCORTELLIS_ID\tINTEGRITY_PATENT_ID\tTR_TARGET_ID\tDRUG_ID"
	var lineArray = [];
	lineArray.push("data:text/csv;charset=utf-8,");
	lineArray.push(cols)
	data.forEach(function (infoArray, index) {
		console.log(infoArray);
		for (x=0; x < infoArray.length; x++) {
			if (typeof(infoArray[x]) == "string") {
//				infoArray[x] = infoArray[x].replace("/,/g", ";");
				infoArray[x] = infoArray[x].replace(/\n|,/g, " ");
			}
		}
		console.log(infoArray);
		var line = infoArray.join("\t")
		console.log(line);
		lineArray.push(line);
	});
	lineArray.push()
//	console.log(lineArray);
	var csvContent = lineArray.join("\n");
//	console.log(csvContent);
	var encodedUri = encodeURI(csvContent);
	window.open(encodedUri);
}

function processAll(num_rows) {
	var req = $("#drugs").DataTable().ajax.params();

 // Reset request parameters to retrieve all records
 req.start = 0;
 req.length = num_rows;
 req.search.value = "";

 // Request data
 $.ajax({
		'url': $('#drugs').data('source'),
		'data': req,
	 	'type': "post",
		'dataType': 'json'
 })
 .done(function(json){
	 JSONtoCSV(json.aaData);
 });
}



function drawSmiles(table) {
	var smileTable = []
	$(".smiles-for-images").each(function(index) {
		if (index == 0 ) {

		} else {
			$(this).addClass('special');
			var content = $(this).text();
			var index = table.row( this ).index();
//			console.log(index);
			var link = "http://cactus.nci.nih.gov/chemical/structure/" + content + "/image";
			var full = "<img src=" + link + ">";
			$(".smiles-image").append(full);
			
			smileTable.push(full)
		}
	})
	console.log(smileTable)
};

function updateTable(table) {
	$('#drugs tbody').on( 'click', 'td', function() {
		var cell = table.cell( this );
//		cell.data( cell.data() + 1).draw()
		console.log(cell);
	})
}

$(document).on("page:change", function() {
	
	var table = $("#drugs").DataTable({
		"autoWidth": false,
		"Processing": true,
    "serverSide": true,
		"scrollX": true,
		"dom": "Blfrtip",
    "ajax": {
			url : $('#drugs').data('source'),
			type: "post"
		},
//		"columnDefs": [
////			{
////				"targets": 0,
////				"data": 'link',
////				"render": function(data, type, full, meta) {
////					return '<a href="/drugs/'+full[0]+'">'+full[1]+'</a>';
////				}	
////			}, 
////			{
////				"targets": 1,
////				"visible": false
////			}, 
//			{
//				"targets": 8,
//				className: "smiles-for-images"
//			}, 
//			{
//				"targets": -2,
//				"data": 'link',
//				"render": function (data, type, full) {
//					return "<button type='button' class='btn btn-lg btn-danger' data-container='body' id='test-popover' data-toggle='popover' data-placement='top' title='Popover title' data-content='And heres some amazing content. Its very engaging. Right?'>Click to toggle popover</button>";
//				}
//			}
//		],
		buttons: [
			'copy', 'csv', 'excel', 'pdf'
		],
		colReorder: true
//		responsive: true
		,
		"initComplete": function() {
		}
	});
	
	$('[data-toggle="popover"]').popover()
	
	$(".bulk-search").append($('.dt-buttons'));
	
	$('.col-filter th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
	
	$('.bulk-search h4').each( function () {
        var title = $(this).text();
        $(this).html( '<textarea placeholder=" '+title+'" rows="5 cols="20"/>');
    } );
	
	$('#bulk-export').on('click', function() {
		getAllRecords();
	})
	
	 $(".col-filter input").on( 'keyup change', function () {
			table
				.column( $(this).parent().index()+':visible' )
				.search( this.value)
				.draw();
    });
	
	$(".bulk-search textarea").on( 'keyup change', function() {
		console.log(table.column(2));
		table
			.column( 2 )
			.search( this.value)
			.draw();
	});
	
	var exclude = [
		".toggle-vis#0",
		".toggle-vis#5",
		".toggle-vis#6",
		".toggle-vis#7",
		".toggle-vis#9",
		".toggle-vis#12",
		".toggle-vis#13",
		".toggle-vis#14",
		".toggle-vis#15",
		".toggle-vis#16"
	]
	
//	var exclude = [".toggle-vis#4", ".toggle-vis#5", ".toggle-vis#6", ".toggle-vis#9", ".toggle-vis#10", ".toggle-vis#14", ".toggle-vis#15", ".toggle-vis#16", ".toggle-vis#17", ".toggle-vis#18", ".toggle-vis#19"]
	
	for ( i=0; i < exclude.length; i++ ) {
		var column = table.column( $(exclude[i]).attr('data-column'))
		$(exclude[i]).addClass("remove-col");
		column.visible( ! column.visible() );
	}
	
	$('a.toggle-vis').on( 'click', function (e) {
		e.preventDefault();

		// Get the column API object
		var column = table.column( $(this).attr('data-column') );
		if ( $(this).hasClass("remove-col") ) {
			$(this).removeClass("remove-col");
		} else {
			$(this).addClass("remove-col");
		}
		// Toggle the visibility
		column.visible( ! column.visible() );
  });
	
//	table.fnAdjustColumnSizing();
	table.columns.adjust().draw();
	
	$('#myTabs a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	})
	
	table.on( 'draw', function() {
//		console.log($(".smiles-for-images"));
		$(".smiles-image").empty();
		drawSmiles(table);
	});
	
	$('#drugs tbody').on( 'mouseenter', 'td', function() {
		var content = table.cell( this ).data();
		if ( $(this).hasClass('special') ) {
			var link = "http://cactus.nci.nih.gov/chemical/structure/" + content + "/image";
			var full = "<img src=" + link + ">";
			$(".smiles-image").empty();
			$(".smiles-image").append(full);
			$('.modal-body').empty();
			$('.modal-body').append(full);
//			$('#myModal').modal({
//				show: true
//			});
		} else {
			
		}
	})
		
	
	$('#drugs tbody').on('mouseenter', 'td', function() {
		if ($(this).hasClass('smiles-for-images')) {
			content = $(this).text();
			var link = "http://cactus.nci.nih.gov/chemical/structure/" + content + "/image";
			var full = "<div class='image-smile'><img src=" + link + "></div>";
			$(this).append(full);
		} else {
		}
	});
	
	$('#drugs tbody').on('mouseleave', 'td', function() {
		if ($(this).hasClass('smiles-for-images')) {
			$('.image-smile').remove();
		} else {
		}
	});
	
});