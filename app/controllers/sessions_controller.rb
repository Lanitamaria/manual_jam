class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &&   user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Autenticacion exitosa"
    else
      redirect_to root_url, :alert => "Autenticacion fallida"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to  root_url, :notice => "Te haz deslogeado exitosamente"
  end
end
