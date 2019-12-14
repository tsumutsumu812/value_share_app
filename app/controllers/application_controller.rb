class ApplicationController < ActionController::Base
before_action :current_user

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])  
  end
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to login_url
    end
  end
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログイン済みです"
      redirect_to values_path
    end
  end
end
