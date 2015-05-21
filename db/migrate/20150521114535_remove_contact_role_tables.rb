class RemoveContactRoleTables < ActiveRecord::Migration
  def change
    remove_column :series_step_entries, :employee_id
    drop_table :employees
    drop_table :retailers
  end
end
