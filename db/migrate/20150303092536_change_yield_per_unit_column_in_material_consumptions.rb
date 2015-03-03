class ChangeYieldPerUnitColumnInMaterialConsumptions < ActiveRecord::Migration
  def change
    change_column :material_consumptions, :yield_per_unit, :decimal
  end
end
