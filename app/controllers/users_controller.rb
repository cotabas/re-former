class UsersController < ApplicationController
  def index
    @users = User.all
    @selected = params[:id]
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
#   @user = User.new(username: params[:username], password: params[:password], email: params[:email])

    if @user.save
      redirect_to new_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to "/"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
