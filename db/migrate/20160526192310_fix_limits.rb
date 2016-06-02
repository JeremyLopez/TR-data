class FixLimits < ActiveRecord::Migration
  def change
		change_column :cond_pharmas, :TR_TARGET_ID, :integer, :limit => nil
		change_column :cond_pharmas, :DRUG_ID, :integer, :limit => nil
		change_column :cond_pharmas, :PHARM_RESULT_ID, :integer, :limit => nil
		change_column :cond_pharmas, :PHARM_EXP_ID, :integer, :limit => nil
		
		change_column :drugs, :TR_TARGET_ID, :integer, :limit => nil
		change_column :drugs, :DRUG_ID, :integer, :limit => nil
		change_column :drugs, :INTEGRITY_PATENT_ID, :integer, :limit => nil
		
		change_column :patents, :TR_TARGET_ID, :integer, :limit => nil
		change_column :patents, :DRUG_ID, :integer, :limit => nil
		change_column :patents, :INTEGRITY_PATENT_ID, :integer, :limit => nil
		
		change_column :pharmacologies, :TR_TARGET_ID, :integer, :limit => nil
		change_column :pharmacologies, :DRUG_ID, :integer, :limit => nil
		change_column :pharmacologies, :PHARM_RESULT_ID, :integer, :limit => nil
		change_column :pharmacologies, :PHARM_EXP_ID, :integer, :limit => nil
  end
end
