class CreateInventoryHydrolysates < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_hydrolysates do |t|
      t.string :barcode
      t.integer :custom_batch_no
      t.decimal :batch_volume, precision: 8, scale: 2
      t.decimal :glucan_desired, precision: 8, scale: 2
      t.decimal :glucan_theoretical, precision: 8, scale: 2
      t.decimal :biomass_moisture, precision: 8, scale: 2
      t.decimal :source_weight, precision: 8, scale: 2
      t.decimal :batch_weight, precision: 8, scale: 2
      t.text :comments
      t.string :created_by
      t.references :inventory_batch, foreign_key: true

      t.timestamps
    end
  end
end
