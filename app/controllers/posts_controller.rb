class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: user_id)
    @recent_user = current_user
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = Post.find(post_id)
    @comments = Comment.where(post_id)
    @recent_user = current_user
  end

  def new
    @user = User.find(params[:user_id])
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

  # def create
  #   user = current_user
  #   @post = Post.new(
  #     title: params[:title],
  #     text: params[:text],
  #     author_id: user.id
  #   )
  #   puts @post.errors.full_messages
  #   return unless @post.save
  #   redirect_to user_posts_path
  # end
# end
