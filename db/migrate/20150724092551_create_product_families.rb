class CreateProductFamilies < ActiveRecord::Migration
  def change
    create_table :product_families do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
