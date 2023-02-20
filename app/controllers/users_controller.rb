class UsersController < ApplicationController

  def index;
  end

  def show
    @id = params[:id]
  end

  def posts
    @id = params[:user_id]
  end
end
