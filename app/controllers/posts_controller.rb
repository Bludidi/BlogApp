class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments, :likes).where(author: @users)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:author, :comments).find(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.author = @user
    if @post.save
      @post.update_posts_counter
      flash[:notice] = 'Post created successfully'
      redirect_to user_post_path(@user, @post)
    else
      render :new
      flash.alert = 'Sorry! something went wrong'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    post = Post.find(params[:id])
    post.comments.destroy_all
    post.likes.destroy_all
    if post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_post_path(@user)
    else
      flash.now[:error] = 'Error! Post could not be deletd'
      redirect_to user_post_path(@user, post)
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end