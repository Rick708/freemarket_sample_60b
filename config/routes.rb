Rails.application.routes.draw do
  # root "items#index"
  root "mypage#profile"

  get 'login' => 'items#login'
  get 'signin' => 'items#signin'
  get 'details' => 'items#details'
  get 'registration' => 'items#registration'
  get 'verification' => 'items#verification'
  get 'index' => 'mypage#index'
  get 'logout' => 'items#logout'
  get 'identification' => 'items#identification'
end
