class UpdateDrugsTableAgains < ActiveRecord::Migration
  def change
#		remove_column :drugs, :ORIGINATOR_ORGANIZATION
		add_column :drugs, :ORIGINATOR_ORGANIZATIONS, :string
  end
end
