class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーが正常に削除されました。'
  end

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  
  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_users_path, alert: 'ユーザーが見つかりません。'
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :ptj, :wage, :admin, :retire)
  end

end
