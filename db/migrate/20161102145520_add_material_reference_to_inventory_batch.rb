class AddMaterialReferenceToInventoryBatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :inventory_batches, :material, foreign_key: true
  end
end
