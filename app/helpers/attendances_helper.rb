module AttendancesHelper
	def next_attendance_action(user)
		last_log = user.attendance_logs.order(created_at: :desc).first
	end
end
