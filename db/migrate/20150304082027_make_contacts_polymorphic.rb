class MakeContactsPolymorphic < ActiveRecord::Migration
  def change
    add_column :retailers, :contactable_type, :string
    add_index :retailers, :contactable_type
    rename_table :retailers, :contacts

    # Addresses
    remove_column :addresses, :addressable_type

    # ContactInformation
    remove_column :contact_informations, :contactable_type
  end
end
