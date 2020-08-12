class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =  User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Bienvenido"
    else
      render "Nuevo"
    end
  end

  def show
  end

  private
  def user_params
    params.required(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
