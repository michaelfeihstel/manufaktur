class AddIndexToOrdersAndLineItems < ActiveRecord::Migration
  def change
    add_index :orders, :created_at
    add_index :line_items, :created_at
  end
end
