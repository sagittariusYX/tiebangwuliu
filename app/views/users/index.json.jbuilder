json.array!(@users) do |user|
  json.extract! user, :name, :gender, :birthday, :phone, :email, :company
  json.url user_url(user, format: :json)
end