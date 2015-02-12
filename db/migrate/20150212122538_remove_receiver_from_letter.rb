class RemoveReceiverFromLetter < ActiveRecord::Migration
  def change
    remove_column :letters, :receiver_id
    remove_column :letters, :receiver_type
  end
end
