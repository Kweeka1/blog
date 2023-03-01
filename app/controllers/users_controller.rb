class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params.require(:user_id))
    @recent_posts = @user.show_recent_posts
  end
end
