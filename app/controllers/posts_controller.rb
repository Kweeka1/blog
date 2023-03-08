class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find_by(id: params.require(:user_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
    @user_id = params.require(:user_id)
  end

  def new
    @user_id = current_user.id
  end

  def create
    user = current_user
    @post = Post.new(
      title: post_params[:title],
      text: post_params[:text],
      user:,
      comments_counter: 0,
      likes_counter: 0
    )

    if @post.save
      @post.increment_posts_counter
      redirect_to user_posts_path user.id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_id = params[:user_id]
    Post.find_by(id: params[:post_id]).destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
