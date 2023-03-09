Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root "users#index"

  # users
  get "/users", to: "users#index", as: "users"
  get "/users/:user_id", to: "users#show", as: "user"

  # posts
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get "/users/:user_id/posts/create", to: "posts#new", as: "new_post"
  post "/users/:user_id/posts/create", to: "posts#create", as: "create_post"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: "user_post"
  delete "/users/:user_id/posts/:post_id", to: "posts#destroy", as: "destroy_post"

  # comments
  get "/users/:user_id/posts/:post_id/comment", to: "comments#new", as: "new_comment"
  post "/users/:user_id/posts/:post_id/comment", to: "comments#create", as: "create_comment"
  delete "/users/:user_id/posts/:post_id/comment/:comment_id", to: "comments#destroy", as: "destroy_comment"

  # likes
  post "/users/:user_id/posts/:post_id/like", to: "likes#create", as: "add_like"


  ####### API

  # posts
  namespace :api do
    get "/users/:user_id/posts", to: "posts#index", as: "user_posts_api"
    get "/users/:user_id/posts/:post_id/comments", to: "comments#index", as: "post_comments_api"
    post "/users/:user_id/posts/:post_id/comments", to: "comments#create", as: "create_comment_api"
  end
end
