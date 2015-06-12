class CreateProductInventoryItems < ActiveRecord::Migration
  def change
    create_table :product_inventory_items do |t|
      t.references :product_inventory, index: true
      t.references :product, index: true
      t.references :contact, index: true
      t.date :entered_on
      t.integer :g1
      t.integer :g1h
      t.integer :g2
      t.integer :g2h
      t.integer :g3
      t.integer :g3h
      t.integer :g4
      t.integer :g4h
      t.integer :g5
      t.integer :g5h
      t.integer :g6
      t.integer :g6h
      t.integer :g7
      t.integer :g7h
      t.integer :g8
      t.integer :g8h
      t.integer :g9
      t.integer :g9h
      t.integer :g10
      t.integer :g10h
      t.integer :g11
      t.integer :g11h
      t.integer :g12
      t.integer :g12h
      t.integer :g13
      t.integer :g13h
      t.integer :g14
      t.integer :g14h
      t.integer :g15
      t.integer :g16
      t.decimal :value

      t.timestamps null: false
    end
    add_index :product_inventory_items, :entered_on
    add_index :product_inventory_items, :g1
    add_index :product_inventory_items, :g1h
    add_index :product_inventory_items, :g2
    add_index :product_inventory_items, :g2h
    add_index :product_inventory_items, :g3
    add_index :product_inventory_items, :g3h
    add_index :product_inventory_items, :g4
    add_index :product_inventory_items, :g4h
    add_index :product_inventory_items, :g5
    add_index :product_inventory_items, :g5h
    add_index :product_inventory_items, :g6
    add_index :product_inventory_items, :g6h
    add_index :product_inventory_items, :g7
    add_index :product_inventory_items, :g7h
    add_index :product_inventory_items, :g8
    add_index :product_inventory_items, :g8h
    add_index :product_inventory_items, :g9
    add_index :product_inventory_items, :g9h
    add_index :product_inventory_items, :g10
    add_index :product_inventory_items, :g10h
    add_index :product_inventory_items, :g11
    add_index :product_inventory_items, :g11h
    add_index :product_inventory_items, :g12
    add_index :product_inventory_items, :g12h
    add_index :product_inventory_items, :g13
    add_index :product_inventory_items, :g13h
    add_index :product_inventory_items, :g14
    add_index :product_inventory_items, :g14h
    add_index :product_inventory_items, :g15
    add_index :product_inventory_items, :g16
    add_foreign_key :product_inventory_items, :product_inventories
    add_foreign_key :product_inventory_items, :products
    add_foreign_key :product_inventory_items, :contacts
  end
end
