json.array!(@comment_posts) do |comment_post|
  json.extract! comment_post, :id, :post_id, :project_id, :user_id, :content
  json.url comment_post_url(comment_post, format: :json)
end
