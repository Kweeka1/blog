Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: "user_post"
  get "/users", to: "users#index", as: "users"
  get "/users/:user_id", to: "users#show", as: "user"
end
