class CreateMemberProjects < ActiveRecord::Migration
  def change
    create_table :member_projects do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
