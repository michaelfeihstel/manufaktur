class RemoveNameFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :name
  end
end
