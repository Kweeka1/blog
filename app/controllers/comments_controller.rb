class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user_id = params.require(:user_id)
    @post_id = params.require(:post_id)
  end

  def create
    @comment = Comment.new(text: comment_params[:text], post: Post.find_by(id: params[:post_id]), user: current_user)
    @comment.increment_comments_counter if @comment.save
    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  def destroy
    Comment.find_by(id: params[:comment_id]).destroy
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
