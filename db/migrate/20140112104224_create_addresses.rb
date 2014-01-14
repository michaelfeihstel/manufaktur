class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :description
      t.references :contact, index: true
      t.string :name
      t.string :street
      t.string :house_number
      t.string :zip
      t.string :city
      t.string :country
    end
  end
end
