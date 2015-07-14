class AlterCarrierTable < ActiveRecord::Migration
  def change
    rename_column :carriers, :tracking_link_prefix, :tracking_link
  end
end
