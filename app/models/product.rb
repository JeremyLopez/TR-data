class Product < ActiveRecord::Base
	scope :filter_product_name, -> (product_name) {where("lower(PRODUCTS.NAME) like :search", search: "%#{product_name.downcase}%")}
end
