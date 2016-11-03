class AddOwnerIdToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :owner_id, :integer
    add_index :materials, :owner_id
  end
end
