Rails.application.routes.draw do
  get "users/index" => "users#index"
  get "login" => "users#login_form"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
