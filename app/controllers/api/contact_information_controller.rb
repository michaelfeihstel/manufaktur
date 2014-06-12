module Api
	class ContactInformationController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/contact_information/
		def index
			respond_with ContactInformation.all
		end

		# GET /api/contact_information/1
		def show
			respond_with ContactInformation.find(params[:id])
		end

		# POST /api/contact_information/
		def create
			respond_with ContactInformation.create(contact_information_params)
		end

		# PUT /api/contact_information/1
		def update
			respond_with ContactInformation.update(params[:id], contact_information_params)
		end


		private
		def contact_information_params
			params.require(:contact_information).permit(
				:id,
				:contact_id,
				:name,
				:value,
				:info_type,
				:default
			)
		end

	end
end