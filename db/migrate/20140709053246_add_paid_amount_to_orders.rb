class AddPaidAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :paid_amount, :decimal, precision: 8, scale: 2
  end
end
