# == Schema Information
#
# Table name: contacts
#
#  id   :integer          not null, primary key
#  name :string(255)
#  fmid :integer
#

class Contact < ActiveRecord::Base

	has_many :addresses, :dependent => :destroy
	has_many :contact_information, :dependent => :destroy
	has_many :orders
	has_many :line_items, through: :orders

	accepts_nested_attributes_for :addresses, :allow_destroy => true

	validates :name, presence: true

end
