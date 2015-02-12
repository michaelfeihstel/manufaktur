class AddPolymorphicAssociationToLetter < ActiveRecord::Migration
  def change
    rename_column :letters, :contact_id, :receiver_id
    add_column :letters, :receiver_type, :string
    add_index :letters, :receiver_type
    Letter.reset_column_information
    Letter.update_all(receiver_type: "Retailer")
  end
end
