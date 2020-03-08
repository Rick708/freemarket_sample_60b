crumb :root do
  link "メルカリ", root_path
end

crumb :users_show do
  link "マイページ", users_path(current_user)
  parent :root
end

crumb :users_logout do
  link "ログアウト", logout_users_path
  parent :users_show
end