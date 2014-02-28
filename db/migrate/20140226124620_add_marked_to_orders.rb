class AddMarkedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :marked, :boolean, index: true, null: false, default: false
  end
end
