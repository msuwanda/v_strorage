class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
