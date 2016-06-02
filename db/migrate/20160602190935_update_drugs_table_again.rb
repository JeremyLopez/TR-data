class UpdateDrugsTableAgain < ActiveRecord::Migration
  def change
		remove_column :drugs, :INTEGRITY_PATENT_ID
		remove_column :drugs, :CORTELLIS_ID
  end
end
