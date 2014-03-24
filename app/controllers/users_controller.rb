class UsersController < ApplicationController
before_filter :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end  
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :avatar)
  end
end