class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.string :hashtag

      t.timestamps
    end
  end
end
