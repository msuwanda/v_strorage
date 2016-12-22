json.array!(@storages) do |storage|
  json.extract! storage, :id, :user_id
  json.url storage_url(storage, format: :json)
end
