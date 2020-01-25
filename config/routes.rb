Rails.application.routes.draw do
  root "mypage#index"
  get 'login' => 'items#login'
  get 'signin' => 'items#signin'
  get 'details' => 'items#details'
  get 'registration' => 'items#registration'
  get 'verification' => 'items#verification'
end