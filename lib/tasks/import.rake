require 'csv'

desc "Import data from FileMaker applications"

namespace :import do

	# CONTACTS / 0:id, 1:name
	task :contacts => [:environment] do
	  contacts_file = File.read('/Users/ulflunge/Desktop/fm_export/contacts_haendler.csv')
		csv = CSV.parse(contacts_file, :headers => true)
		csv.each do |row|
			c = Contact.find_or_create_by(id: row[0])
			c.id = row[0]
			c.name = row[1]
		  c.save
		end
	end



	# ADDRESSES / 0:id, 1:contact_id, 2:description, 3:name, 4:street, 5:house_number, 6:zip, 7:city, 8:country
	task :addresses => [:environment] do
		addresses_file = File.read('/Users/ulflunge/Desktop/fm_export/addresses_haendler.csv')
		csv = CSV.parse(addresses_file, :headers => true)
		csv.each do |row|
			a = Address.find_or_create_by(id: row[0])
			a.contact_id = row[1]
			a.description = row[2]
			a.name = row[3]
			a.street = row[4]
			a.house_number = row[5]
			a.zip = row[6]
			a.city = row[7]
			a.country = row[8]
		  a.save
		end
	end

end