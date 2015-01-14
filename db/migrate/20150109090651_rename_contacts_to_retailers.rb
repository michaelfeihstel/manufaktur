class RenameContactsToRetailers < ActiveRecord::Migration
  def change
    rename_table :contacts, :retailers
  end
end
