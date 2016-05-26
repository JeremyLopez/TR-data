class CreatePatents < ActiveRecord::Migration
  def change
    create_table :patents do |t|
			t.integer :TR_TARGET_ID
			t.string :TARGET_NAME
			t.integer :DRUG_ID
			t.string :DRUG_NAME
			t.integer :INTEGRITY_PATENT_ID
			t.string :PATENT_TITLE
			t.string :PATENT_NUMBER
			t.string :PATENT_PUBLICATION
			t.string :APPLICANT
			t.string :INVENTOR
			

      t.timestamps null: false
    end
		
		add_index :patents, :DRUG_ID
		add_index :patents, :INTEGRITY_PATENT_ID
  end
end
