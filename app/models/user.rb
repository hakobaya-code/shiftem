class User < ApplicationRecord
	has_many :attendance_logs, dependent: :destroy
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }

	def next_attendance_action
		last_log = attendance_logs.last
		return :attendance unless last_log

		case last_log.attendance_type
		when 'attendance'
		  :break_or_leave
		when 'break_start'
		  :break_end
		when 'break_end'
		  :leave
		when 'leave'
		  :attendance
		else
		  nil
		end
	
  	end
end
  