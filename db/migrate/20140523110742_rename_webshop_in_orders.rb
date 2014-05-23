class RenameWebshopInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :webshop?, :is_webshop
  end
end
