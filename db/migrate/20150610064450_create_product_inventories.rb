class CreateProductInventories < ActiveRecord::Migration
  def change
    create_table :product_inventories do |t|
      t.integer :year
      t.string :name

      t.timestamps null: false
    end
  end
end
