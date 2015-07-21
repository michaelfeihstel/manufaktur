module Api
	class AddressesController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/addresses/
		def index
			@addresses = Address.all
		end

		def search
			query = "%" + params[:query] + "%"
			@addresses = Address.where("name ILIKE ?", query)
			render "index"
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
				:country,
				:latitude,
				:longitude
			)
		end

	end
end