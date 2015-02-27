class CreateMaterialProperties < ActiveRecord::Migration
  def change
    create_table :material_properties do |t|
      t.references :material, index: true
      t.string :name
      t.string :value
      t.boolean :use_in_name, default: false

      t.timestamps null: false
    end
    add_foreign_key :material_properties, :materials
  end
end
