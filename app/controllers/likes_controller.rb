class LikesController < ApplicationController
  def create
    @like = Like.new(post: Post.find_by(id: params[:post_id]), user: current_user)
    @like.increment_likes_counter if @like.save
    redirect_to user_post_path(current_user.id, params[:post_id])
  end
end
