class ChangeDatesToDatetimeInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :invoiced_at, :datetime
  	change_column :orders, :completed_at, :datetime
  end
end
