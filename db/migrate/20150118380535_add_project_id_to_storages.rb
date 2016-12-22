class AddProjectIdToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :project_id, :integer
  end
end
