class AddIndexToUseInNameInMaterialProperties < ActiveRecord::Migration
  def change
    add_index :material_properties, :use_in_name
  end
end
