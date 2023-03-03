class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params.require(:user_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
  end

  def new
    @post = Post.new
    @user = params.require(:user_id)
  end

  def create
    @user = current_user
    @post = @user.posts.new(
      title: post_params[:title],
      text: post_params[:text],
      author_id: @user,
      comments_counter: 0,
      likes_counter: 0
    )

    if @post.save
      puts 7
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
