class RenameTypeColumnInAttendanceLogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :attendance_logs, :type, :attendance_type
  end
end
