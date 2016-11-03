class CreateMaterialTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :material_types do |t|
      t.string :code
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
