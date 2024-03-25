class AttendancesController < ApplicationController
	before_action :authenticate_user!

	def create
		@attendance = current_user.attendance_logs.new(attendance_params)
		if @attendance.save
		  redirect_to root_path, notice: '出勤情報が記録されました。'
		else
		  render :new, alert: '記録に失敗しました。'
		end
	  end
	
	  private
	
	  def attendance_params
		params.permit(:attendance_type)
	end
end
