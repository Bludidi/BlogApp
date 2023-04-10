Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'
  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
  post '/users/:user_id/posts/new', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#show', as: 'comment'
end
