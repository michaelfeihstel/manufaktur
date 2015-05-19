class CreateSizeSets < ActiveRecord::Migration
  def change
    create_table :size_sets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
