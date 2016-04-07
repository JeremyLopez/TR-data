class DropPharmacology < ActiveRecord::Migration
  def change
		drop_table :pharmacology
  end
end
