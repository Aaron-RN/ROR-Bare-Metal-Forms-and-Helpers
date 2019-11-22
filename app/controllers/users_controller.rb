class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user_name], email: params[:user_email], password: params[:user_password])

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :user_email, :user_password)
  end
end
