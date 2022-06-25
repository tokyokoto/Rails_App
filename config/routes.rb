Rails.application.routes.draw do
  get "users/new" => "users#new"
  post "users/create" =>"users#create"
  get "users/index" => "users#index"
  get "login" => "users#login_form"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
