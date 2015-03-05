class MakeContactsPolymorphicPart3 < ActiveRecord::Migration
  def change
    rename_column :orders, :customer_id, :contact_id
    remove_column :orders, :customer_type
  end
end
