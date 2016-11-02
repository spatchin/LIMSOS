class CreateInventoryBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_batches do |t|
      t.string :name
      t.string :container_type
      t.references :supplier, foreign_key: true
      t.string :lot_no
      t.text :comments
      t.string :created_by
      t.integer :source_batch_id

      t.timestamps
    end
  end
end
