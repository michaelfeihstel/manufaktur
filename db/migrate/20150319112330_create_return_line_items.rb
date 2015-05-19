class CreateReturnLineItems < ActiveRecord::Migration
  def change
    create_table :return_line_items do |t|
      t.references :return, index: true
      t.references :product, index: true
      t.integer :g1

      t.timestamps null: false
    end
    add_foreign_key :return_line_items, :returns
    add_foreign_key :return_line_items, :products
  end
end
