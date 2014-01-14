# == Schema Information
#
# Table name: contacts
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Contact < ActiveRecord::Base

	has_many :addresses, :dependent => :destroy

	accepts_nested_attributes_for :addresses, :allow_destroy => true

	validates :name, presence: true

end
