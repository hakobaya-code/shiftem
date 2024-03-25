class AttendanceLog < ApplicationRecord
	belongs_to :user
	enum attendance_type: { attendance: 0, break_start: 1, break_end: 2, leave: 3 }
end
