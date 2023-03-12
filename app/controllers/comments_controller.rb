class CommentsController < ApplicationController
  def create
    user = current_user
    @comment = Comment.new(
      text: params[:text],
      post: Post.find(params[:post_id]),
      author_id: user.id
    )
    return unless @comment.save
    redirect_to user_post_comments_path
  end
end
