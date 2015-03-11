class RemoveContactableTypeFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :contactable_type
  end
end
