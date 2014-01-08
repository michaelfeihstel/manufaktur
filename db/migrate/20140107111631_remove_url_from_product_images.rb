class RemoveUrlFromProductImages < ActiveRecord::Migration
  change_table :product_images do |t|
  	t.rename :url, :url_old
  end
end
