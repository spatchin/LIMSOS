class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :inventory_batch, foreign_key: true
      t.integer :qty
      t.integer :qty_unit
      t.string :status
      t.string :storage_location
      t.string :custodian
      t.text :comments
      t.string :created_by

      t.timestamps
    end
  end
end
