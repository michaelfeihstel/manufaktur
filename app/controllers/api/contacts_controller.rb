module Api
	class ContactsController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/contacts/
		def index
			respond_with Contact.all, :include => :addresses
		end

		# GET /api/contacts/1/
		def show
			respond_with Contact.find(params[:id]), :include => :addresses
		end

		# POST /api/contacts/
		def create
			respond_with Contact.create(contact_params)
		end

		# PUT /api/contacts/1
		def update
			respond_with Contact.update(params[:id], contact_params)
		end


		private
		def contact_params
			params.require(:contact).permit(
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