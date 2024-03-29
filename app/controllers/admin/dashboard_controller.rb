class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
  end

  private

  def require_admin
    redirect_to new_admin_login_path unless current_user&.admin?
  end
end
