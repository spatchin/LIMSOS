class RemoveCreatedByFromInventoryUntreatedFs < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventory_untreated_feedstocks, :created_by, :integer
    remove_column :inventory_untreated_feedstocks, :plant_year, :integer    
  end
end
