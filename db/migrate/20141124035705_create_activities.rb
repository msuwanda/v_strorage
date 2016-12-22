class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :activity

      t.timestamps
    end
  end
end
