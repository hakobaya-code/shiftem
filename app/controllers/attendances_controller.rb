class AttendancesController < ApplicationController
	before_action :authenticate_user!
  
	def create
	  attendance_type = params[:attendance_type].to_i
	  current_user.attendance_logs.create(attendance_type: attendance_type)
	  @message = "#{current_user.name} さんが出勤しました"
	  case attendance_type
	  when 0
		@message = "#{current_user.name} さんが出勤しました"
	  when 1
		@message = "#{current_user.name} さんが休憩に入ります"
	  when 2
		@message = "#{current_user.name} さんが戻りました"
	  when 3
		@message = "#{current_user.name} さんが退勤しました"
	  else
		@message = "不明な操作です"
	  end
	  render 'show_attendance', status: 303
	end
end
  