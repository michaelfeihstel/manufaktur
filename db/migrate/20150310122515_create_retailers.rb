class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.references :contact, index: true
      t.boolean :allow_orders, default: true

      t.timestamps null: false
    end
    add_foreign_key :retailers, :contacts
  end
end
