class RenameColumnsInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :date_delivery, :delivered_on
  	rename_column :orders, :date_invoice, :invoiced_at
  	rename_column :orders, :date_completed, :completed_at
  end
end
