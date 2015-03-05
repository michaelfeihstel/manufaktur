class AddContactToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :contactable_id, :integer, index: true, null: false
  end
end
