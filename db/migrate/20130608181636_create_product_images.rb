class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :url
      t.references :product

      t.timestamps
    end
    add_index :product_images, :product_id
  end
end
