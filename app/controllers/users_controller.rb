class UsersController < ApplicationController
  before_action :set_target_users, only: %i[show edit update destroy]
  before_action :authenticate_user, only: %i[index show edit update destroy]
  before_action :forbid_login_user, only: :new
  before_action :ensure_correct_user, only: %i[edit update]

  def new
    @user = User.new(flash[:user])
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "ユーザー登録に成功しました"
      redirect_to user
    else
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def update
    if @user.update(user.params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to @user
    else

    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to users_path
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to values_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def set_target_users
      @user = User.find_by(id: params[:id])
    end
end
