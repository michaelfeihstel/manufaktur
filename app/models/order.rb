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

class Order < ActiveRecord::Base
  belongs_to :contact
  belongs_to :billing_address, foreign_key: "billing_address_id", class_name: "Address"
  belongs_to :delivery_address, foreign_key: "delivery_address_id", class_name: "Address"
  has_many :line_items, :dependent => :destroy

  accepts_nested_attributes_for :line_items, :allow_destroy => true
end