class RemoveSizes < ActiveRecord::Migration
  def change
    drop_table :product_sizes
    drop_table :sizes
  end
end
