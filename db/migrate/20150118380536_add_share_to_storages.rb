class AddShareToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :share_link, :string
  end
end
