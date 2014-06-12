module Api
	class AddressesController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/addresses/
		def index
			respond_with Address.all
		end

		# GET /api/addresses/1
		def show
			respond_with Address.find(params[:id])
		end

		# POST /api/addresses
		def create
			respond_with Address.create(address_params)
		end

		# PUT /api/addresses/1
		def update
			respond_with Address.update(params[:id], address_params)
		end


		private
		def address_params
			params.require(:address).permit(
				:id,
				:contact_id,
				:name,
				:description,
				:street,
				:house_number,
				:zip,
				:city,
				:country
			)
		end

	end
end