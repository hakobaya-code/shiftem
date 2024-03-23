class HomePagesController < ApplicationController
  def home
    @page_title = "Home"
  end

  def admin
    @page_title = "Admin"
  end

  def member
    @page_title = "Member"
  end
end
