class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.references :line_item, index: true, foreign_key: true
      t.string :name
      t.decimal :discount
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
    add_index :discounts, :enabled
  end
end
