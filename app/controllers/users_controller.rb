class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your account"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the blog #{@user.username}. You have successfully logged in"
      redirect_to articles_path
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
