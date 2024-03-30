class AttendancesController < ApplicationController
	before_action :authenticate_user!
  
	def create
		attendance_type = params[:attendance_type].to_i
		current_user.attendance_logs.create(attendance_type: attendance_type)
		case attendance_type
		when 0
			@message = "#{current_user.name} さんが出勤しました"
		when 1
			@message = "#{current_user.name} さんが休憩に入ります"
		when 2
			@message = "#{current_user.name} さんが戻りました、後半も頑張りましょう！"
		when 3
			@message = "#{current_user.name} さん、本日もお疲れ様でした"

		else
			@message = "不明な操作です"
		end

		if current_user.admin?
			@path = admin_admin_page_path 
		  else
			@path = member_path 
		end
		
		@user = current_user
		@logs = current_user.attendance_logs
		render 'show_attendance', status: 303
	end
end
  