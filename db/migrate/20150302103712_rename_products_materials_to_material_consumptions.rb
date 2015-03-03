class RenameProductsMaterialsToMaterialConsumptions < ActiveRecord::Migration
  def change
    rename_table :products_materials, :material_consumptions
  end
end
