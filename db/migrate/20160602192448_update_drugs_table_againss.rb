class UpdateDrugsTableAgainss < ActiveRecord::Migration
  def change
		change_column :drugs, :MOLECULAR_MECHANISM, :string, :limit => 1000
		change_column :drugs, :CELLULAR_MECHANISM, :string, :limit => 1000
		change_column :drugs, :SMILES, :string, :limit => 400
  end
end
