class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :projects, :hashtag, :project_category_id
  end
end
