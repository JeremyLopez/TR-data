class Changecolumnn < ActiveRecord::Migration
  def change
		remove_column :patents, :PATENT_PUBLICATION
		add_column :patents, :PATENT_PUBLICATION_DATE, :string
  end
end
