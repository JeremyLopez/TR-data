class ConditionalPharma < ActiveRecord::Migration
  def change
		create_table :cond_pharma do |t|
      t.timestamps null: false
			t.integer :TR_TARGET_ID
			t.string :TARGET_NAME
			t.integer :DRUG_ID
			t.string :DRUG_NAME
			t.integer :PHARM_RESULT_ID
			t.integer :PHARM_EXP_ID
			t.string :TARGET_CONDITION_TOXICITY_TYPE
			t.string :SYSTEM
			t.string :CONDITION_ACTIVITY_TYPE_VALUE
			t.string :EFFECT
			t.string :PHARMACOLOGICAL_ACTIVITY
			t.string :MATERIAL
			t.string :METHOD
			t.string :PARAMETER
			t.string :OPERATOR
			t.string :VALUE
			t.string :UNIT
			t.string :VARIANCE
			t.string :MODEL
			t.string :SOURCE_TYPE
			t.string :SOURCE_TITLE
			t.string :SOURCE_ID
		end
		
		add_index :cond_pharma, :DRUG_ID
		add_index :cond_pharma, :DRUG_NAME
		add_index :cond_pharma, :TARGET_NAME
		add_index :cond_pharma, :PHARM_RESULT_ID
  end
end
