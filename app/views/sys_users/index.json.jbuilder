json.array!(@sys_users) do |sys_user|
  json.extract! sys_user, :id, :name, :pwd, :photo, :phone, :sex
  json.url sys_user_url(sys_user, format: :json)
end
