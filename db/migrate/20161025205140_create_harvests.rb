class CreateHarvests < ActiveRecord::Migration[5.0]
  def change
    create_table :harvests do |t|
      t.references :biomass, foreign_key: true
      t.string :plot_location
      t.string :plot_information
      t.string :fertilizer_types
      t.string :fertilizer_applications
      t.string :soil_information
      t.string :weather_information
      t.string :storage_location
      t.date :planting_date
      t.date :harvest_date

      t.timestamps
    end
  end
end
