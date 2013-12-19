class CreateVariationSets < ActiveRecord::Migration
  def up
    create_table :variation_sets do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end

  def down
  	drop_table :variation_sets
  end
end
