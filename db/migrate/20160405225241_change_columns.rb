class ChangeColumns < ActiveRecord::Migration
  def change
		remove_column :drugs, :CORTELLUS_ID
		add_column :drugs, :CORTELLIS_ID, :string
  end
end
