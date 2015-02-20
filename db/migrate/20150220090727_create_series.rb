class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.references :product, index: true
      t.date :finished_on
      t.text :comment
      t.integer :us1
      t.integer :us1h
      t.integer :us2
      t.integer :us2h
      t.integer :us3
      t.integer :us3h
      t.integer :us4
      t.integer :us4h
      t.integer :us5
      t.integer :us5h
      t.integer :us6
      t.integer :us6h
      t.integer :us7
      t.integer :us7h
      t.integer :us8
      t.integer :us8h
      t.integer :us9
      t.integer :us9h
      t.integer :us10
      t.integer :us10h
      t.integer :us11
      t.integer :us11h
      t.integer :us12
      t.integer :us12h
      t.integer :us13
      t.integer :us13h
      t.integer :us14
      t.integer :us14h
      t.integer :us15
      t.integer :us16

      t.timestamps null: false
    end
    add_foreign_key :series, :products
  end
end
