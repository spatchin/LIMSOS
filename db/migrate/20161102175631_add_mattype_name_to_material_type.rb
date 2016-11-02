class AddMattypeNameToMaterialType < ActiveRecord::Migration[5.0]
  def change
    add_column :material_types, :mattype_name, :string
  end
end
