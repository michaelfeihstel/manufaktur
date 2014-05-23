class RenameColumnInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :blling_house_number, :billing_house_number
  end
end
