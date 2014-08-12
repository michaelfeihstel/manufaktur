class RemoveUrlOldFromProductImages < ActiveRecord::Migration
  def change
    remove_column :product_images, :url_old
  end
end
