class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :mattype_code
      t.string :default_unit_code
      t.string :parent_matcode
      t.decimal :min_level, precision: 8, scale: 2
      t.decimal :low_level, precision: 8, scale: 2
      t.string :created_by

      t.timestamps
    end
  end
end
