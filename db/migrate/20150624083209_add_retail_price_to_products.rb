class AddRetailPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retail_price, :decimal, precision: 8, scale: 2
  end
end
