class DropBrands < ActiveRecord::Migration
  def change
    drop_table :brands
  end
end
