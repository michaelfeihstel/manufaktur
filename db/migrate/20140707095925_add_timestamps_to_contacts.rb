class AddTimestampsToContacts < ActiveRecord::Migration
	def change
	  change_table :contacts do |t|
	    t.timestamps
	  end
	end
end
