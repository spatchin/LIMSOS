class CreateWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :color
      t.string :icon
      t.text :models
      t.boolean :admin_only, default: false

      t.timestamps
    end
  end
end
