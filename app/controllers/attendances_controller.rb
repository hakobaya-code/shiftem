class AttendancesController < ApplicationController
	before_action :authenticate_user!
  
	def create
	  attendance_type = params[:attendance_type]
	  current_user.attendance_logs.create(attendance_type: attendance_type)
	  @message = "#{current_user.name} さんが出勤しました"
	  render 'show_attendance', status: 303
	end
end
  