class AddActiveToFsManagementModels < ActiveRecord::Migration[5.0]
  def change
    add_column :biomasses, :active, :boolean, default: true
    add_column :biomass_types, :active, :boolean, default: true
    add_column :feedstocks, :active, :boolean, default: true
    add_column :harvests, :active, :boolean, default: true
  end
end
