class RemoveContactRoleTypeFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :contact_role_type
  end
end
