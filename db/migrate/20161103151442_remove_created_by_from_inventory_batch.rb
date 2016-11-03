class RemoveCreatedByFromInventoryBatch < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventory_batches, :created_by, :integer
  end
end
