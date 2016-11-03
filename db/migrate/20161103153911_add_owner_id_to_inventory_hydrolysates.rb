class AddOwnerIdToInventoryHydrolysates < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_hydrolysates, :owner_id, :integer
    add_index :inventory_hydrolysates, :owner_id
  end
end
