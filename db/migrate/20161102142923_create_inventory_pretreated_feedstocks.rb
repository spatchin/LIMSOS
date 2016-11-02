class CreateInventoryPretreatedFeedstocks < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_pretreated_feedstocks do |t|
      t.string :GLBRC_barcode
      t.string :pretreat_method
      t.string :grand_size
      t.string :operator
      t.integer :notebook_reference
      t.decimal :stirring_RPM, precision: 8, scale: 2
      t.decimal :temperature, precision: 8, scale: 2
      t.decimal :NH3_loading, precision: 8, scale: 2
      t.decimal :overpressure, precision: 8, scale: 2
      t.decimal :residence_time, precision: 8, scale: 2
      t.string :weight
      t.decimal :water_loading, precision: 8, scale: 2
      t.text :comments
      t.integer :created_by
      t.references :inventory_batch, foreign_key: true

      t.timestamps
    end
  end
end
