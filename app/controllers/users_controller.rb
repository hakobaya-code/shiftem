class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    debugger
  end

  def new
    @page_title = "Sign Up"
  end

end
