class HomePagesController < ApplicationController
  before_action :redirect_based_on_authentication, except: [:home]
  
  def home
    @page_title = "Home"
  end

  def admin
    @page_title = "Admin"
  end

  def member
    @page_title = "Member"
    @user = current_user
  end

  def member
    @next_action = current_user.next_attendance_action
  end

  private

  def redirect_based_on_authentication
    if !user_signed_in?
      redirect_to login_path
      return
    end

    if action_name == 'home' && user_signed_in?
      redirect_to member_path
    end
  end
end
