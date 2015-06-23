class AddCompletedAtToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :completed_at, :datetime
    add_index :line_items, :completed_at
  end
end
