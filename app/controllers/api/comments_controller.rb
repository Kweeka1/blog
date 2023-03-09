class Api::CommentsController < Api::ApplicationController
  load_and_authorize_resource

  def index
    @comments = Comment.all.where(author_id: params.require(:user_id), post_id: params.require(:post_id))
    render json: @comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
