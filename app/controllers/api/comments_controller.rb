class Api::CommentsController < Api::ApplicationController
  # load_and_authorize_resource

  def index
    @comments = Comment.all.where(author_id: params.require(:user_id), post_id: params.require(:post_id))
    render json: @comments
  end

  def create
    puts params
    comment = Comment.new(author_id: current_user.id, post_id: params.require(:post_id), text: params[:comment][:text])
    render json: comment
  end

  private

  def comment_body
    params.require(:comment).permit(:text)
  end
end
