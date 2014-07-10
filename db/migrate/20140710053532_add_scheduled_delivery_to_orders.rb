class AddScheduledDeliveryToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_scheduled_delivery, :boolean, default: false
  end
end
