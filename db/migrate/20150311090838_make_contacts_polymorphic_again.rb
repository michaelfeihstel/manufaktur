class MakeContactsPolymorphicAgain < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_role_id, :integer, index: true
    add_column :contacts, :contact_role_type, :string
  end
end
