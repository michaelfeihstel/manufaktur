class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.references :contact, index: true
      t.string :name
      t.string :value
      t.string :info_type
      t.boolean :default, default: false

      t.timestamps
    end
    add_index :contact_informations, :value
  end
end
