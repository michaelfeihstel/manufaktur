class RenameContactableIdInEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :contactable_id, :contact_id
  end
end
