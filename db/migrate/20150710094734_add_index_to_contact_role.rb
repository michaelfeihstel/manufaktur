class AddIndexToContactRole < ActiveRecord::Migration
  def change
    add_index :contact_roles, :name
  end
end
