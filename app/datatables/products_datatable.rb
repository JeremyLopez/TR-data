class ProductsDatatable 
  delegate :params, :link_to, :products_path, :edit_products_path, to: :@view 

  def initialize(view) 
    @view = view 
  end 

  def as_json(options = {}) 
    { 
      data: data, 
      recordsTotal: my_search.count, 
      recordsFiltered: sort_order_filter.count 
    } 
  end 

private 

  def data 
    products = [] 
    display_on_page.map do |record| 
      product = [] 
      product << record.id 
			product << record.category 
      product << record.name 
			product << record.price 
      product << link_to(fa_icon('info-circle lg'), products_path(record), class: 'label success round') 
      product << link_to(fa_icon('edit lg'), edit_products_path(record), class: 'label secondary round') 
      product << link_to(fa_icon('trash-o lg'), products_path(record), method: :delete, data: { confirm: 'Are you sure?' }, class: 'label alert round') 
      products << product 
    end 
    products 
  end 

  def my_search 
		@filtered_products = Product.all
#    @filtered_products = Product.filter_product_code(params[:product_code]).filter_product_name(params[:product_name]).some_additional_scope.distinct.includes(:category) 
  end 

  def sort_order_filter 
    records = my_search.order("#{sort_column} #{sort_direction}") 
    if params[:search][:value].present? 
      records = records.where("PRODUCTS.CODE like :search or lower(PRODUCTS.NAME) like :search", search: "%#{params[:search][:value]}%") 
    end 
    records 
  end 

  def display_on_page 
    sort_order_filter.page(page).per(per_page) 
  end 

  def page 
    params[:start].to_i/per_page + 1 
  end 

  def per_page 
    params[:length].to_i > 0 ? params[:length].to_i : 10 
  end 

  def sort_column 
    columns = %w[PRODUCT.CATEGORY PRODUCTS.NAME] 
    columns[params[:order][:'0'][:column].to_i] 
  end 

  def sort_direction 
    params[:order][:'0'][:dir] == "desc" ? "desc" : "asc" 
  end 
end 