class Changelimitss < ActiveRecord::Migration
  def change
		change_column :cond_pharma, :TR_TARGET_ID, :integer, :limit => 20
		change_column :cond_pharma, :DRUG_ID, :integer, :limit => 20
		change_column :cond_pharma, :PHARM_RESULT_ID, :integer, :limit => 20
		change_column :cond_pharma, :PHARM_EXP_ID, :integer, :limit => 20
  end
end
