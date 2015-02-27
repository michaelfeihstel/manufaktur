class ChangeSeriesTable < ActiveRecord::Migration
  def change
    remove_column :series, :name
    add_column :series, :name, :integer
  end
end
