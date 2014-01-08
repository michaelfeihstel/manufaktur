class AddImageToProductImages < ActiveRecord::Migration
  def change
  	add_attachment :product_images, :image
  end
end
