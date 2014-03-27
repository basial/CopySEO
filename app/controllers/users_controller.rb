class UsersController < ApplicationController
before_filter :set_user, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
before_filter :authenticate_admin!, only: [:index, :new, :create, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello user!"
        send_data pdf.render
      end
    end
  end

  def create
    User.invite!(params[:email])
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
    params.require(:user).permit(:email, :first_name, :last_name, :address, :phone_number, :avatar)
  end
end