class AddWageToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :wage, :integer, default: 1300
  end
end
