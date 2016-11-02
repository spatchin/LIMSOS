class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :contact
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
