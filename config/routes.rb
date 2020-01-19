Rails.application.routes.draw do
  root "items#index"
  get  "items/registration"  =>   "items#registration"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
