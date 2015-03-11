class RemoveContactIdFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :contact_id
  end
end
