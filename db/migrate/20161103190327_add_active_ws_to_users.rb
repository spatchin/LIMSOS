class AddActiveWsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active_ws, :integer, default: 0
  end
end
