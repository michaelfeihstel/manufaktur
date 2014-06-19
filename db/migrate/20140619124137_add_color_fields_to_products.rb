class AddColorFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :primary_color, :string
    add_column :products, :secondary_color, :string
  end
end
