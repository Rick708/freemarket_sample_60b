Rails.application.routes.draw do
  # devise_for :users
  root "items#index"

  # root "signup#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :signup, only: [:index, :create] do
end
end

