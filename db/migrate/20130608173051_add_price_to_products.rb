class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal
    add_column :products, :vat, :decimal
  end

  def down
  	remove_column :products, :price
  	remove_column :products, :vat
  end
end
