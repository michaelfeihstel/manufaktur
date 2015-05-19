class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.references :contact, index: true
      t.integer :billing_address_id, index: true
      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :returns, :contacts
    add_foreign_key :returns, :addresses, column: :billing_address_id
  end
end
