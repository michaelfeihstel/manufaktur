class CreateProductsMaterials < ActiveRecord::Migration
  def change
    create_table :products_materials do |t|
      t.references :product, index: true
      t.references :material, index: true
      t.decimal :pair_per_unit, precision: 2

      t.timestamps null: false
    end
    add_foreign_key :products_materials, :products
    add_foreign_key :products_materials, :materials
  end
end
