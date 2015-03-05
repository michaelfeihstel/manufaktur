class ChangeSeriesStepEntries < ActiveRecord::Migration
  def change
    change_column :series_step_entries, :b_stock, :boolean, default: false
  end
end
