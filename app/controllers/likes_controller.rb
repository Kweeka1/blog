class LikesController < ApplicationController
  def create
    user = current_user
    @like = Like.new(post: Post.find_by(id: params[:post_id]), user:)
    @like.increment_likes_counter
    @like.save
    redirect_to "/users/#{user.id}/posts/#{params[:post_id]}"
  end
end
