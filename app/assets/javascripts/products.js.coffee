# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
  product_table = $('#product_table').DataTable 
    processing: true 
    console.log("here")
    serverSide: true 
    ajax: 
      url: '/products_ajax/datatable_ajax'
      data: (d) -> 
        d.category = $('#product_code').val() 
        d.price = $('#price_code').val()
        d.name = $('#product_name').val() 
        d.name = $('.title').val()
        return 
    columns: [ 
      { width: "0%", className: "dont_show", searchable: false, orderable: false } 
      { width: "15%" } 
      { width: "35%", className: "row_config" } 
      { width: "null", className: "row_config", searchable: false, orderable: false } 
      { width: "null", className: "row_config", searchable: false, orderable: false } 
      { width: "5%", className: "center", searchable: false, orderable: false } 
      { width: "5%", className: "center", searchable: false, orderable: false } 
      { width: "5%", className: "center", searchable: false, orderable: false } 
    ] 
    order: [ [1,'asc'] ] 
