class AddOwnerIdToInventoryUntreatedFeedstocks < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_untreated_feedstocks, :owner_id, :integer
    add_index :inventory_untreated_feedstocks, :owner_id
  end
end
