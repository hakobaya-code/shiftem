class AddRetireToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :retire, :boolean
  end
end
