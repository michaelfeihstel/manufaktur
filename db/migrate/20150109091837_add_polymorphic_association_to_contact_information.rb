class AddPolymorphicAssociationToContactInformation < ActiveRecord::Migration
  def change
    rename_column :contact_informations, :contact_id, :contactable_id
    add_column :contact_informations, :contactable_type, :string
    add_index :contact_informations, :contactable_type
    ContactInformation.reset_column_information
    ContactInformation.update_all(contactable_type: "Retailer")
  end
end
