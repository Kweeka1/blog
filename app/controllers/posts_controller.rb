class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params.require(:user_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
  end
end
