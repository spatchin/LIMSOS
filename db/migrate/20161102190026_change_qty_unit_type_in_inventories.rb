class ChangeQtyUnitTypeInInventories < ActiveRecord::Migration[5.0]
  def up
    change_column :inventories, :qty_unit, :string
  end

  def down
    change_column :inventories, :qty_unit, :integer
  end
end
