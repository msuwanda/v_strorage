class AddStatusToUserGroup < ActiveRecord::Migration
  def change
    add_column :user_groups, :owner_status, :integer
  end
end
