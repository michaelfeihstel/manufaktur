class AddAddtionalDataToContacts < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :contacts, :additional_data, :hstore
    add_index :contacts, :additional_data
  end
end
