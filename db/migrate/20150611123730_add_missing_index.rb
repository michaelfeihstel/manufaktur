class AddMissingIndex < ActiveRecord::Migration
  def change
    add_index :products, :size_set_id
    add_index :contact_informations, :info_type
    add_index :contacts, :contact_role_id
    add_index :orders, [:billing_address_id, :delivery_address_id, :completed_at]
  end
end
