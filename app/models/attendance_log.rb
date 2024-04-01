class AttendanceLog < ApplicationRecord
	belongs_to :user
	enum attendance_type: { attendance: 0, break_start: 1, break_end: 2, leave: 3 }

	def self.for_month(year, month)
		where(created_at: "#{year}-#{month}-01".to_date.beginning_of_month.. "#{year}-#{month}-01".to_date.end_of_month)
	end
	
end
