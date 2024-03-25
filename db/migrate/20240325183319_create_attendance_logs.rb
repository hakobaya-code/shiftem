class CreateAttendanceLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_logs do |t|

      t.references :user, null: false, foreign_key: true
      t.datetime :recorded_at
      t.integer :type

      t.timestamps
    end
  end
end
