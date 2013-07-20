class ChangeProducts < ActiveRecord::Migration
  def up
  	change_table :products do |t|
  		t.change :price, :decimal, :precision => 8, :scale => 2	
  	end
  end

  def down
  end
end
