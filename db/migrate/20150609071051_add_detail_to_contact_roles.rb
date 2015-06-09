class AddDetailToContactRoles < ActiveRecord::Migration
  def change
    add_column :contact_roles, :human_readable_name, :string
  end
end
