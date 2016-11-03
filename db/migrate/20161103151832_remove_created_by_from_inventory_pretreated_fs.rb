class RemoveCreatedByFromInventoryPretreatedFs < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventory_pretreated_feedstocks, :created_by, :integer
  end
end
