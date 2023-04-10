class LikesController < ApplicationController
  def create
    user = current_user
    @like = Like.new(
      post: Post.find(params[:post_id]),
      author_id: user.id
    )
    return unless @like.save

    redirect_to user_post_likes_path(@like.post_id, @like.author_id)
  end
end
