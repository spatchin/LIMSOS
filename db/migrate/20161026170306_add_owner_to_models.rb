class AddOwnerToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :biomass_types, :owner_id, :integer
    add_column :biomasses, :owner_id, :integer
    add_column :feedstocks, :owner_id, :integer
    add_column :harvests, :owner_id, :integer

    add_index :biomass_types, :owner_id
    add_index :biomasses, :owner_id
    add_index :feedstocks, :owner_id
    add_index :harvests, :owner_id
  end
end
