class AddColumnsToProduct < ActiveRecord::Migration
  def change
		add_column :products, :name, :string
		add_column :products, :price, :string
  end
end
