class LikesController < ApplicationController
  def create
    user = current_user
    @like = Like.new(
      post_id: params[:post_id],
      author_id: user.id
    )
    return unless @like.save

    redirect_to user_likes_path
  end
end
