Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get "/users/:user_id/posts/create", to: "posts#new", as: "new_post"
  post "/users/:user_id/posts/create", to: "posts#create", as: "create_post"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: "user_post"
  get "/users/:user_id/posts/:post_id/comment", to: "comments#new", as: "new_comment"
  post "/users/:user_id/posts/:post_id/comment", to: "comments#create", as: "create_comment"
  get "/users/:user_id/posts/:post_id/like", to: "likes#create", as: "add_like"
  get "/users", to: "users#index", as: "users"
  get "/users/:user_id", to: "users#show", as: "user"
end
