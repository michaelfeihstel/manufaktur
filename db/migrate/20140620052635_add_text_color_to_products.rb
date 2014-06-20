class AddTextColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :text_color, :string, default: "#fff"
  end
end
