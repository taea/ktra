json.user do
  json.extract! @user, :uid, :name, :nickname, :image
end
