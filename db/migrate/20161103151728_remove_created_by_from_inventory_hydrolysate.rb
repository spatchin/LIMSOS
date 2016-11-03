class RemoveCreatedByFromInventoryHydrolysate < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventory_hydrolysates, :created_by, :integer
  end
end
