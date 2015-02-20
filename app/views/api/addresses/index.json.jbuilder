json.addresses @addresses do |address|
  json.id address.id
  json.name address.name
  json.street address.street
  json.house_number address.house_number
  json.zip address.zip
  json.city address.city
  json.country address.country
  json.addressable_id address.addressable_id
  json.addressable_type address.addressable_type
  json.full_address address.full_address
end