ActiveRecord::Schema[7.1].define(version: 2024_03_28_204317) do
  create_table "attendance_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "recorded_at"
    t.integer "attendance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendance_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "ptj"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendance_logs", "users"
end
