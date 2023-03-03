class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user_id = params.require(:user_id)
    @post_id = params.require(:post_id)
  end

  def create
    user = current_user
    @comment = Comment.new(text: comment_params[:text], post: Post.find_by(id: params[:post_id]), user:)
    @comment.increment_comments_counter
    @comment.save
    redirect_to "/users/#{user.id}/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
