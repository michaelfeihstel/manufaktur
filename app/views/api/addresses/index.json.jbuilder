json.addresses @addresses do |address|
  json.id address.id
  json.contact_id address.contact_id
  json.name address.name
  json.street address.street
  json.house_number address.house_number
  json.zip address.zip
  json.city address.city
  json.country address.country
  json.full_address address.full_address
  json.full_address_with_name address.full_address_with_name
end