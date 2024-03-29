class Admin::SessionsController < ApplicationController

  before_action :check_admin, only: [:create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password]) && user.admin?
      # 管理者としてログイン
      session[:user_id] = user.id
      redirect_to admin_root_path, notice: 'ログイン成功'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_admin_login_path, notice: 'ログアウトしました'
  end

  private

  def check_admin
    user = User.find_by(email: params[:user][:email])
    unless user&.admin?
      redirect_to new_user_session_path, alert: "管理者のみがログインできます。"
    end
  end

  def login_params
    params.require(:admin).permit(:email, :password)
  end

  protected
  def after_sign_in_path_for(resource)
    admin_items_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end
