class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.references :contact, index: true
      t.references :address, index: true
      t.string :name
      t.string :street
      t.string :house_number
      t.string :zip
      t.string :city
      t.string :country
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
