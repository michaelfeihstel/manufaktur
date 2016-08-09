class AddDzbFieldsToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :use_dzb, :boolean, default: false
    add_index :contacts, :use_dzb
    add_column :contacts, :dzb_account_number, :string
  end
end
