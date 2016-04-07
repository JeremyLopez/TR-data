class AddColumnsToDrug < ActiveRecord::Migration
  def change
		add_column :drugs, :TR_TARGET_ID, :integer
		add_column :drugs, :DRUG_ID, :integer
		add_column :drugs, :INTEGRITY_PATENT_ID, :integer
		add_column :drugs, :TARGET_NAME, :string
		add_column :drugs, :DRUG_NAME, :string
		add_column :drugs, :CORTELLUS_ID, :string
		add_column :drugs, :PRODUCT_CATEGORY, :string
		add_column :drugs, :MOLECULAR_MECHANISM, :string
		add_column :drugs, :CELLULAR_MECHANISM, :string
		add_column :drugs, :UNDER_ACTIVE_DEVELOPMENT, :string
		add_column :drugs, :HIGHEST_PHASE, :string
		add_column :drugs, :INACTIVE_CONDITIONS, :string
		add_column :drugs, :ORIGINATOR_ORGANIZATION, :string
		add_column :drugs, :INACTIVE_ORGANIZATION, :string
		add_column :drugs, :ACTIVE_CONDITIONS, :string
		add_column :drugs, :ACTIVE_ORGANIZATIONS, :string
		add_column :drugs, :SMILES, :string
		add_column :drugs, :SEQUENCE, :string
		add_column :drugs, :CAS_NUMBER, :string
		
		add_index :drugs, :TR_TARGET_ID
		add_index :drugs, :DRUG_ID
		add_index :drugs, :INTEGRITY_PATENT_ID
		add_index :drugs, :TARGET_NAME
		add_index :drugs, :DRUG_NAME
  end
end
