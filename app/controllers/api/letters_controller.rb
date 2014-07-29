module Api
	class LettersController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/letters/1
		def show
			respond_with Letter.find(params[:id])
		end

		# GET /api/letters/
		def index
			respond_with Letter.all
		end

		# POST /api/letters
		def create
			respond_with Letter.create(letter_params)
		end

		# PUT /api/letters/1
		def update
			respond_with Letter.update(params[:id], letter_params)
		end



		private
		def letter_params
			params.require(:letter).permit(
				:id,
				:created_at,
				:contact_id,
				:address_id,
				:name,
				:street,
				:house_number,
				:zip,
				:city,
				:country,
				:subject,
				:body,
				:_destroy
			)
		end

	end
end