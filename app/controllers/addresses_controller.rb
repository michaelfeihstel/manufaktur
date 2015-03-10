class AddressesController < ApplicationController
  after_action :verify_authorized

	def new
		@address = Address.new
	end

end