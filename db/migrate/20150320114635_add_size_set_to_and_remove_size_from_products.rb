class AddSizeSetToAndRemoveSizeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :size_id
    add_column :products, :size_set_id, :integer, index: true
  end
end
