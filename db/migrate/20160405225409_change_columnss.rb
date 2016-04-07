class ChangeColumnss < ActiveRecord::Migration
  def change
		remove_column :drugs, :ACTIVE_ORGANIZATIONS
		add_column :drugs, :ACTIVE_ORGANIZATION, :string
  end
end
