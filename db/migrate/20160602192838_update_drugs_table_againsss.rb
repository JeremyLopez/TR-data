class UpdateDrugsTableAgainsss < ActiveRecord::Migration
  def change
		change_column :drugs, :OTHER_ORGANIZATIONS, :string, :limit => 1000
  end
end
