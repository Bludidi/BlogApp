class CommentsController < ApplicationController
  load_and_authorize_resource
  # def new
  #   @comment = Comment.new
  #   @post = Post.find(params[:post_id])
  # end

  def create
    user = current_user
    @comment = Comment.new(text: params[:text], post: Post.find(params[:post_id]), author_id: user.id)
    # @comment.author = current_user
    # post = Post.find(params[:post_id])
    
    return unless @comment.save

    redirect_to user_posts_path(user.posts)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
    else
      flash.now[:error] = 'Error! Comment could not be deleted'
    end
    redirect_to user_post_path(@post.author, @post)
  end

  # private

  # def comment_params
  #   params.require(:comment).permit(:text)
  # end
end
