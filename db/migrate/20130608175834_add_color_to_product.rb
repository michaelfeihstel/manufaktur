class AddColorToProduct < ActiveRecord::Migration
  def change
    add_column :products, :color_text, :string
  end
end
