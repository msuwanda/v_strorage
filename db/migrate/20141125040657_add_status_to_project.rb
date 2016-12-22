class AddStatusToProject < ActiveRecord::Migration
  def change
    add_column :projects, :status_project, :string
  end
end
