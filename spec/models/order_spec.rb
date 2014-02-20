# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  date_delivery         :date
#  date_invoice          :date
#  date_completed        :date
#  contact_id            :integer
#  billing_address_id    :integer
#  delivery_address_id   :integer
#  billing_name          :string(255)
#  billing_street        :string(255)
#  blling_house_number   :string(255)
#  billing_zip           :string(255)
#  billing_city          :string(255)
#  billing_country       :string(255)
#  delivery_name         :string(255)
#  delivery_street       :string(255)
#  delivery_house_number :string(255)
#  delivery_city         :string(255)
#  delivery_zip          :string(255)
#  delivery_country      :string(255)
#  delivery_iso          :string(255)
#  webshop?              :boolean
#  created_at            :datetime
#  updated_at            :datetime
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
