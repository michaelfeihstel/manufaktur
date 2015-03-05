class MakeContactsPolymorphicPart2 < ActiveRecord::Migration
  def change
    rename_column :contact_informations, :contactable_id, :contact_id
    rename_column :addresses, :addressable_id, :contact_id 
  end
end
