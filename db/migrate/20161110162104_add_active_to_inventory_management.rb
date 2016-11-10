class AddActiveToInventoryManagement < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :active, :boolean, default: true
    add_column :inventory_batches, :active, :boolean, default: true
    add_column :inventory_hydrolysates, :active, :boolean, default: true
    add_column :inventory_untreated_feedstocks, :active, :boolean, default: true
    add_column :inventory_pretreated_feedstocks, :active, :boolean, default: true
    add_column :materials, :active, :boolean, default: true
    add_column :material_types, :active, :boolean, default: true
    add_column :suppliers, :active, :boolean, default: true
  end
end
