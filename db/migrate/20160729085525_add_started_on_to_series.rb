class AddStartedOnToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :started_on, :date
  end
end
