class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params.require(:user_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
    @user_id = params.require(:user_id)
    @comment = Comment.new
  end

  def new
    @post = Post.new
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
      redirect_to "/users/#{user.id}/posts"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create_comment
    user = current_user
    @comment = Comment.new(text: comment_params[:text], post: Post.find_by(id: params[:post_id]), user:)
    @comment.increment_comments_counter
    @comment.save
    redirect_to "/users/#{user.id}/posts/#{params[:post_id]}"
  end

  def add_like
    user = current_user
    @like = Like.new(post: Post.find_by(id: params[:post_id]), user:)
    @like.increment_likes_counter
    @like.save
    redirect_to "/users/#{user.id}/posts/#{params[:post_id]}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
