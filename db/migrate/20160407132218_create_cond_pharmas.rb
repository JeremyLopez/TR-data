class CreateCondPharmas < ActiveRecord::Migration
  def change
    create_table :cond_pharmas do |t|

      t.timestamps null: false
    end
  end
end
