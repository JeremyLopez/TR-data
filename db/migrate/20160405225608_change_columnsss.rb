class ChangeColumnsss < ActiveRecord::Migration
  def change
		change_column :drugs, :TR_TARGET_ID, :integer
		change_column :drugs, :DRUG_ID, :integer
		change_column :drugs, :INTEGRITY_PATENT_ID, :integer
  end
end
