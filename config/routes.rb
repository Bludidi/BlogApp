Rails.application.routes.draw do
  # resources :likes
  # resources :posts
  # resources :comments
  #  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users", to: "users#index"
  get "/user", to: "user#show"
  get "/posts", to: "posts#index"
  get "/post", to: "post#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
