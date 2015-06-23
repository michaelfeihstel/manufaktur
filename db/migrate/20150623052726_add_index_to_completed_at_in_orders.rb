class AddIndexToCompletedAtInOrders < ActiveRecord::Migration
  def change
    add_index :orders, :completed_at
  end
end
