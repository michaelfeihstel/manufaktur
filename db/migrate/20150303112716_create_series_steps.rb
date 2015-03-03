class CreateSeriesSteps < ActiveRecord::Migration
  def change
    create_table :series_steps do |t|
      t.references :series, index: true
      t.references :work_step, index: true
      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :series_steps, :series
    add_foreign_key :series_steps, :work_steps
  end
end
