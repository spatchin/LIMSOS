class AddOwnerIdToInventoryBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_batches, :owner_id, :integer
    add_index :inventory_batches, :owner_id
  end
end
