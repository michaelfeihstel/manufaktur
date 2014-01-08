class AddVariationSetIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :variation_set_id, :integer
  end
end
