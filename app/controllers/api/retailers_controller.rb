module Api
	class RetailersController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/contacts/
		def index
			@retailers = respond_with Retailer.all, :include => :addresses
		end

		# GET /api/contacts/1/
		def show
			@retailer = respond_with Retailer.find(params[:id]), :include => :addresses
		end

		# POST /api/contacts/
		def create
			@retailer = respond_with Retailer.create(retailer_params)
		end

		# PUT /api/contacts/1
		def update
			@retailer = respond_with Retailer.update(params[:id], retailer_params)
		end


		private
		def retailer_params
			params.require(:retailer).permit(
				:id,
				:created_at,
				:updated_at,
				:name,
				addresses_attributes: [
					:id,
					:description,
					:contact_id,
					:name,
					:street,
					:house_number,
					:zip,
					:city,
					:country,
					:_destroy
				]
			)
		end

	end
end