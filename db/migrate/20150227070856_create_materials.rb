class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :supplier_sku
      t.string :unit
      t.decimal :price, precision: 8, scale: 2
      t.text :comment

      t.timestamps null: false
    end
  end
end
