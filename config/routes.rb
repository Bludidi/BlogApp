Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
  post '/users/:user_id/posts/new', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#show', as: 'comment'
  delete 'users/:user_id/posts/:id' => 'posts#destroy'
  delete 'users/:user_id/posts/:post_id/comments/:id' => 'comment#destroy', as: 'comment_destroy'
end
