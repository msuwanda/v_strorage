class CreateCommentPosts < ActiveRecord::Migration
  def change
    create_table :comment_posts do |t|
      t.integer :post_id
      t.integer :project_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
