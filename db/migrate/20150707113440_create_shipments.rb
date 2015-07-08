class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.references :order, index: true, foreign_key: true
      t.string :tracking_code
      t.integer :weight
      t.references :carrier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
