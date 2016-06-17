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
#  latitude     :float
#  longitude    :float
#

class AddressesController < ApplicationController
  after_action :verify_authorized

	def new
		@address = Address.new
	end

end
