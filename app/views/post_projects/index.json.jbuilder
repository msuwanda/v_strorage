json.array!(@post_projects) do |post_project|
  json.extract! post_project, :id, :project_id, :user_id, :content
  json.url post_project_url(post_project, format: :json)
end
