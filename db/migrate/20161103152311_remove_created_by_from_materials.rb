class RemoveCreatedByFromMaterials < ActiveRecord::Migration[5.0]
  def change
    remove_column :materials, :created_by, :integer
  end
end
