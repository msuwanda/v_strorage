class AddGroupStatusToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :group_status, :string
  end
end
