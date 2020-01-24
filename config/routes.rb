Rails.application.routes.draw do
  get 'index' => 'items#index'
  get 'login' => 'items#login'
  get 'signin' => 'items#signin'
  get 'details' => 'items#details'
  get 'registration' => 'items#registration'
end

