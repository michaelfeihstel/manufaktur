class AddFmidToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :fmid, :integer, index: true
    add_column :addresses, :fmid, :integer, index: true
    add_column :orders, :fmid, :integer, index: true
    add_column :line_items, :fmid, :integer, index: true
    add_column :products, :fmid, :integer, index: true
  end
end
