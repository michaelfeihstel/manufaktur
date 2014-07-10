class AddCashbackFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cashback_until, :date
    add_column :orders, :cashback_percent, :decimal, precision: 2, scale: 2, default: 0.03
  end
end
