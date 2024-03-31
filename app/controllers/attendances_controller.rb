class AttendancesController < ApplicationController
	before_action :authenticate_user!
  
	def index
		@year = params[:year] || Time.zone.now.year
		@month = params[:month] || Time.zone.now.month

		# 特定の年月のログを取得し、created_atでソート
		start_date = Date.new(@year.to_i, @month.to_i, 1)
		end_date = start_date.end_of_month
		@attendance_logs = current_user.attendance_logs.where(created_at: start_date..end_date).order(:created_at)
	end

	def create
		attendance_type = params[:attendance_type].to_i
		current_user.attendance_logs.create(attendance_type: attendance_type, created_at: Time.zone.now) 

		# Flashメッセージの設定
		case attendance_type
		when 0
		  flash[:notice] = "#{current_user.name} さんが出勤しました"
		when 1
		  flash[:notice] = "#{current_user.name} さんが休憩に入ります"
		when 2
		  flash[:notice] = "#{current_user.name} さんが戻りました、後半も頑張りましょう！"
		when 3
		  flash[:notice] = "#{current_user.name} さん、本日もお疲れ様でした"
		else
		  flash[:alert] = "不明な操作です"
		end
	  
		@user = current_user
		@next_action = current_user.next_attendance_action
		# リダイレクト先の設定
		redirect_path = current_user.admin? ? admin_admin_page_path : member_path
	  
		# 特定の年月のログを取得し、created_atでソート
		@year = params[:year].presence || Time.zone.now.year
		@month = params[:month].presence || Time.zone.now.month
		
		start_date = Date.new(@year.to_i, @month.to_i, 1)
		end_date = start_date.end_of_month
		@attendance_logs = current_user.attendance_logs.where(created_at: start_date..end_date).order(:created_at)
	  
		# show_attendance ビューへの変数を渡す
		render 'show_attendance', status: 303
	end
end
  