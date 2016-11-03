class AddActiveWsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active_ws, :integer
  end
end
