class CreateInventoryUntreatedFeedstocks < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_untreated_feedstocks do |t|
      t.string :plant_year
      t.date :plant_date
      t.date :harvest_date
      t.string :plant_location
      t.string :plant_field
      t.string :grand_size
      t.text :comments
      t.string :created_by
      t.references :inventory_batch, foreign_key: true

      t.timestamps
    end
  end
end
