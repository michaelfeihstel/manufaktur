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
#
# Indexes
#
#  index_addresses_on_contact_id  (contact_id)
#

class Address < ActiveRecord::Base
  belongs_to :contact
  has_many :letters



  def full_address(hide_name: false)
      address = "#{street} #{house_number} / #{zip} #{city} / #{country}"
    if hide_name
      "#{name} / #{address}"
    else
      address
    end
  end
end