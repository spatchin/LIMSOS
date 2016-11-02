class CreateMaterialTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :material_types do |t|
      t.string :mattype_code
      t.string :mat_category

      t.timestamps
    end
  end
end
