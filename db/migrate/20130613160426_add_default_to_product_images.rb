class AddDefaultToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :default, :boolean
  end

  def down
  	remove_column :product_images, :default
  end
end
