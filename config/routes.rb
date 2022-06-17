Rails.application.routes.draw do
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "login" => "users#login_form"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
