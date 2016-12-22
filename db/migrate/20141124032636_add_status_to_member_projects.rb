class AddStatusToMemberProjects < ActiveRecord::Migration
  def change
    add_column :member_projects, :status, :string
  end
end
