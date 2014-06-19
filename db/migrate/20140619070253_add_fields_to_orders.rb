class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :comment, :text
    add_column :orders, :is_free, :boolean, default: false
    add_column :orders, :is_vat_exempt, :boolean, default: false
    add_column :orders, :paid_on, :date
  end
end
