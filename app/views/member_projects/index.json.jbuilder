json.array!(@member_projects) do |member_project|
  json.extract! member_project, :id, :project_id, :user_id
  json.url member_project_url(member_project, format: :json)
end
