class AddPolymorphicAssociationToOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :contact_id, :customer_id
    add_column :orders, :customer_type, :string
    add_index :orders, :customer_type
    Order.reset_column_information
    Order.update_all(customer_type: "Retailer")
  end
end
