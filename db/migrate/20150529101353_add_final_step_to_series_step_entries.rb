class AddFinalStepToSeriesStepEntries < ActiveRecord::Migration
  def change
    add_column :series_step_entries, :final_step, :boolean, default: false
    add_index :series_step_entries, :final_step
  end
end
