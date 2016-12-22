json.array!(@activities) do |activity|
  json.extract! activity, :id, :project_id, :user_id, :activity
  json.url activity_url(activity, format: :json)
end
