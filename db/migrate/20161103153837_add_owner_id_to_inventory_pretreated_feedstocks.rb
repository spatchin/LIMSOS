class AddOwnerIdToInventoryPretreatedFeedstocks < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_pretreated_feedstocks, :owner_id, :integer
    add_index :inventory_pretreated_feedstocks, :owner_id
  end
end
