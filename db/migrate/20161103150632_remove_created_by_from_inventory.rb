class RemoveCreatedByFromInventory < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventories, :created_by, :integer
  end
end
