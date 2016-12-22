class CreatePostProjects < ActiveRecord::Migration
  def change
    create_table :post_projects do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
