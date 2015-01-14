class AddPolymorphicAssociationToAddresses < ActiveRecord::Migration
  def change
    rename_column :addresses, :contact_id, :addressable_id
    add_column :addresses, :addressable_type, :string
    Address.reset_column_information
    Address.update_all(addressable_type: "Retailer")
  end
end