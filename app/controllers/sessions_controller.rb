class SessionsController < ApplicationController
  before_action :forbid_login_user, only: :login_form

  def login_form
     
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to values_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login_form'    
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to values_path
  end
end
