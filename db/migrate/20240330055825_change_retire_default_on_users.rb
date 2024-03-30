class ChangeRetireDefaultOnUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :retire, from: nil, to: false
    change_column_default :users, :ptj, from: nil, to: false

  end
end
