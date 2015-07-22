# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  contact_id   :integer
#  name         :string(255)
#  street       :string(255)
#  house_number :string(255)
#  zip          :string(255)
#  city         :string(255)
#  country      :string(255)
#  fmid         :integer
#
# Indexes
#
#  index_addresses_on_contact_id  (contact_id)
#

class Address < ActiveRecord::Base
  belongs_to :contact
  has_many :letters

  # Geocoder
  geocoded_by :geocodable_address
  after_validation :geocode,
    if: ->(obj){ obj.street_changed? or obj.house_number_changed? or obj.city_changed? or obj.country_changed? }



  def full_address(hide_name: false)
      address = "#{street} #{house_number} / #{zip} #{city} / #{country}"
    if hide_name
      "#{name} / #{address}"
    else
      address
    end
  end

  def geocodable_address
    [street, house_number, city, country].compact.join(', ')
  end

  def nearby_retailers(distance=20)
    if geocoded?
      nearbys(distance).joins(contact: :contact_role).where(contact_roles: { name: "retailer" })
    end
  end
end
