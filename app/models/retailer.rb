# == Schema Information
#
# Table name: retailers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  fmid       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Retailer < ActiveRecord::Base

	has_many :addresses, as: :addressable, dependent: :destroy
	has_many :contact_information, as: :contactable, dependent: :destroy
	has_many :emails, -> { where(info_type: "E-Mail") }, as: :contactable, class_name: "ContactInformation"
	has_many :phones, -> { where(info_type: "Telefon") }, as: :contactable, class_name: "ContactInformation"
	has_many :orders, as: :customer
	has_many :line_items, through: :orders
	has_many :letters, through: :addresses

	accepts_nested_attributes_for :addresses, allow_destroy: true
	accepts_nested_attributes_for :contact_information, allow_destroy: true
	accepts_nested_attributes_for :emails, allow_destroy: true
	accepts_nested_attributes_for :phones, allow_destroy: true

	validates :name, presence: true

	def billing_address
		self.addresses.first.full_address
	end

end