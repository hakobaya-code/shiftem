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

		if session[:retry] || current_user.attendance_logs.where("created_at >= ?", Date.today).empty?
			# 出勤などの処理を行う
			session.delete(:retry) # 処理が成功したらフラグをリセット
			# Flashメッセージの設定
			case params[:attendance_type].to_i
			when 0
			  flash[:notice] = "#{current_user.name} さんが出勤しました"
			when 1
			  flash[:notice] = "#{current_user.name} さんが休憩に入ります"
			when 2
			  flash[:notice] = "#{current_user.name} さんが戻りました、後半も頑張りましょう！"
			when 3
			  flash[:notice] = "#{current_user.name} さん、本日もお疲れ様でした"
			else
			  redirect_to member_path, alert: "済みです"
			end
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

	def undo
		last_log = current_user.attendance_logs.order(created_at: :desc).first
		if last_log && last_log.created_at.today?
		  flash[:notice] = "最新の操作を取り消しました。"
		else
		  flash[:alert] = "取り消しできる記録がありません。"
		end
		redirect_to member_path
	end

	def redo
		redirect_to member_path, notice: 'やり直しを実行しました。'
	  end

	def retry
		session[:retry] = true
		redirect_to member_path, notice: "やり直しを開始できます。"
	end

end
  