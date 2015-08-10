class AddProductFamilyAssocToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_family, index: true, foreign_key: true
  end
end
