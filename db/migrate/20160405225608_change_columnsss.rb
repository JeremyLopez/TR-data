class ChangeColumnsss < ActiveRecord::Migration
  def change
		change_column :drugs, :TR_TARGET_ID, :integer, :limit => 20
		change_column :drugs, :DRUG_ID, :integer, :limit => 20
		change_column :drugs, :INTEGRITY_PATENT_ID, :integer, :limit => 20
  end
end
