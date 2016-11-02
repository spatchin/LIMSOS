class AddOwnerToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :owner_id, :integer
  end
end
