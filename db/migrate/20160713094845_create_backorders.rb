class CreateBackorders < ActiveRecord::Migration[5.0]
  def change
    create_table :backorders do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :g1, default: 0
      t.integer :g1h, default: 0
      t.integer :g2, default: 0
      t.integer :g2h, default: 0
      t.integer :g3, default: 0
      t.integer :g3h, default: 0
      t.integer :g4, default: 0
      t.integer :g4h, default: 0
      t.integer :g5, default: 0
      t.integer :g5h, default: 0
      t.integer :g6, default: 0
      t.integer :g6h, default: 0
      t.integer :g7, default: 0
      t.integer :g7h, default: 0
      t.integer :g8, default: 0
      t.integer :g8h, default: 0
      t.integer :g9, default: 0
      t.integer :g9h, default: 0
      t.integer :g10, default: 0
      t.integer :g10h, default: 0
      t.integer :g11, default: 0
      t.integer :g11h, default: 0
      t.integer :g12, default: 0
      t.integer :g12h, default: 0
      t.integer :g13, default: 0
      t.integer :g13h, default: 0
      t.integer :g14, default: 0
      t.integer :g14h, default: 0
      t.integer :g15, default: 0
      t.integer :g16, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
