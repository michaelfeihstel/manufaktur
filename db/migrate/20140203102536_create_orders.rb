class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date_delivery
      t.date :date_invoice
      t.date :date_completed
      t.belongs_to :contact, index: true
      t.integer :billing_address_id, index: true
      t.integer :delivery_address_id, index: true
      t.string :billing_name
      t.string :billing_street
      t.string :blling_house_number
      t.string :billing_zip
      t.string :billing_city
      t.string :billing_country
      t.string :delivery_name
      t.string :delivery_street
      t.string :delivery_house_number
      t.string :delivery_city
      t.string :delivery_zip
      t.string :delivery_country
      t.string :delivery_iso
      t.boolean :webshop?

      t.timestamps
    end
  end
end
