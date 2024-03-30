class UsersController < ApplicationController

  
  def show
    @user = User.find_by(params[:id])
    debugger
  end

  def new
    @page_title = "Sign Up"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You have successfully signed up!"
    else
      render :new
    end
  end

end
