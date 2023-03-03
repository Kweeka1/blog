Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get "/users/:user_id/posts/create", to: "posts#new", as: "new_post"
  post "/users/:user_id/posts/create", to: "posts#create", as: "create_post"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: "user_post"
  post "/users/:user_id/posts/:post_id", to: "posts#create_comment", as: "create_comment"
  get "/users/:user_id/posts/:post_id/like", to: "posts#add_like", as: "add_like"
  get "/users", to: "users#index", as: "users"
  get "/users/:user_id", to: "users#show", as: "user"
end
