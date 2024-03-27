class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:id])
    debugger
  end

  def new
    @page_title = "Sign Up"
  end

end
