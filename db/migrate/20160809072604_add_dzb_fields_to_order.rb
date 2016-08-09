class AddDzbFieldsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :use_dzb, :boolean, default: false
    add_index :orders, :use_dzb
    add_column :orders, :dzb_account_number, :string
  end
end
