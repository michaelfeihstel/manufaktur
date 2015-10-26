class AddForeignKeyCopnstrainToLineItems < ActiveRecord::Migration
  def change
    add_foreign_key :line_items, :orders
  end
end
