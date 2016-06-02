class UpdateDrugsTable < ActiveRecord::Migration
  def change
		remove_column :drugs, :TR_TARGET_ID
		add_column :drugs, :TARGET_ID, :integer
		remove_column :drugs, :DRUG_NAME
		remove_column :drugs, :INACTIVE_CONDITIONS
		remove_column :drugs, :ACTIVE_CONDITIONS
		remove_column :drugs, :CAS_NUMBER
		remove_column :drugs, :INACTIVE_ORGANIZATION
		remove_column :drugs, :ACTIVE_ORGANIZATION
		add_column :drugs, :OTHER_ORGANIZATIONS, :string
		add_column :drugs, :CAS_NO, :string
		add_column :drugs, :CONDITIONS, :string
		add_column :drugs, :DRUG_OR_CHEMICAL_NAME, :string
		add_column :drugs, :LEAD_COMPOUND, :string
  end
end
