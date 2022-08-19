class UsersController < ApplicationController
  def new

  end

  def create

    @user = User.new(user_params)

    if @user.save
      redirect_to new_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
