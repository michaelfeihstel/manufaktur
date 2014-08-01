class LettersController < ApplicationController
	before_action :initialize_search

	def index
		@letters = @search.result(distinct: true).order_by_date_desc.page(params[:page]).per(50)
	end

	def show
		@letter = Letter.find(params[:id])
	end

	def new
		@letter = Letter.new
	end

	def create

	end

	def edit
		@letter = Letter.find(params[:id])
	end

	def update
		@letter = Letter.find(params[:id])
		if @letter.update_attributes(letter_params)
			redirect_to letter_path(@letter), notice: "Brief aktualisiert"
		else
			render "edit"
		end
	end



	private
	def initialize_search
		@search = Letter.search(params[:q])
	end

	def letter_params
		params.require(:letter).permit(
			:contact_id,
			:address_id,
			:name,
			:street,
			:house_number,
			:zip,
			:city,
			:country,
			:subject,
			:body
		)
	end

end