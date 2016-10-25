class CreateFeedstocks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedstocks do |t|
      t.references :biomass_type, foreign_key: true
      t.references :harvest, foreign_key: true
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
