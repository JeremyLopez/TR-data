class ProductsDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: products.total_entries,
      aaData: data,
    }
  end

private

  def data
		puts "here", products
    products.map do |product|
      [
        product.name,
        product.category,
        product.price,
      ]
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
		puts "fetchin..."
    products = Product.order("#{sort_column} #{sort_direction}")
    products = products.page(page).per_page(per_page)
		if params[:search]["value"] != ""
      products = products.where("name like :search or category like :search", search: "%#{params[:search]["value"]}%")
    end
    products
  end

  def page
    params["start"].to_i/per_page + 1
  end

  def per_page
		params["length"].to_i > 0 ? params["length"].to_i : 10
  end

  def sort_column
		columns = %w[name category price]
#    columns[params[:iSortCol_0].to_i]
		columns[params[:order]["0"]["column"].to_i]
  end

  def sort_direction
		params[:order]["0"]["dir"]
#    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end