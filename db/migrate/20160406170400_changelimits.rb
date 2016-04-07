class Changelimits < ActiveRecord::Migration
  def change
		change_column :pharmacologies, :TR_TARGET_ID, :integer, :limit => 20
		change_column :pharmacologies, :DRUG_ID, :integer, :limit => 20
		change_column :pharmacologies, :PHARM_RESULT_ID, :integer, :limit => 20
		change_column :pharmacologies, :PHARM_EXP_ID, :integer, :limit => 20
  end
end
