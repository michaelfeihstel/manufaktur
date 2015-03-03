class RenamePairPerUnitToYieldPerUnit < ActiveRecord::Migration
  def change
    rename_column :material_consumptions, :pair_per_unit, :yield_per_unit
  end
end
