class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.includes(posts: { comments: [:author]}).find(user_id)
    @posts = @user.posts
    @recent_user = current_user
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = @user.posts.includes(:comments).find(post_id)
    @comments = @post.comments
    @recent_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(author: @user, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      # @post.update_posts_counter
      flash[:notice] = 'Your post was created successfully'
      redirect_to user_posts_path(@user)
    else
      render :new
      flash.alert = 'Sorry something went wrong'
    end
  end
end
