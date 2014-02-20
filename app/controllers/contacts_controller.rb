class ContactsController < ApplicationController

	def index
		@search = Contact.search(params[:q])
		@contacts = @search.result(distinct: true)
		@section = "Kontakte"

		respond_to do |format|
			format.html # index.html.erb
  		format.json { render json: @contacts }
		end
	end

	def show
		@contact = Contact.find(params[:id])
		@section = "Kontakte"
	end

	def new
		@contact = Contact.new
		@contact.addresses.build
		@section = "Kontakte"
	end


	def create
		@contact = Contact.new(contact_params)
		@section = "Kontakte"

		if @contact.save
			redirect_to @contact
		else
			render 'new'
		end
	end


	def edit
		@contact = Contact.find(params[:id])
	end


	def update
		@contact = Contact.find(params[:id])

		respond_to do |format|

			if @contact.update_attributes(contact_params)
				redirect_to contacts_path, notice: "Kontakt aktualisiert."
			else
				render 'edit'
			end
		end
	end


	private
	def contact_params
		params.require(:contact).permit(
			:name,
			addresses_attributes: [
				:id,
				:contact_id,
				:description,
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