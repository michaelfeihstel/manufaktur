class OrdersController < ApplicationController
	
	def index
		@search = Order.search(params[:q])
		@orders = @search.result(distinct: true)

		respond_to do |format|
			format.html # index.html.erb
  		format.json { render json: @orders }
		end
	end


	def show
		@order = Order.find(params[:id])
	end


	def new
		@order = Order.new
		@order.line_items.build
		@addresses = Address.all
	end


	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to @order
		else
			render "new"
		end
	end


	def edit
		@order = Order.find(params[:id])
		@addresses = Address.where(contact_id: @order.contact_id)
	end

	def select_contact
		respond_to do |format|
	   format.js 
	  end
	end


	def update
		@order = Order.find(params[:id])

		respond_to do |format|

			if @order.update_attributes(order_params)
				format.html { redirect_to edit_order_path, notice: "Auftrag aktualisiert." }
				format.json { render json: @order }
				format.js
			else
				render 'edit'
			end

		end
	end


	private
	def order_params
		params.require(:order).permit(
			:id,
			:date_delivery,
			:date_invoice,
			:date_completed,
			:contact_id,
			:billing_address_id,
			:delivery_address_id,
			line_items_attributes: [
				:id,
				:order_id,
				:product_id,
				:price,
				:vat,
				:comment,
				:g1,
				:g1h,
				:g2,
				:g2h,
				:g3,
				:g3h,
				:g4,
				:g4h,
				:g5,
				:g5h,
				:g6,
				:g6h,
				:g7,
				:g7h,
				:g8,
				:g8h,
				:g9,
				:g9h,
				:g10,
				:g10h,
				:g11,
				:g11h,
				:g12,
				:g12h,
				:g13,
				:g13h,
				:g14,
				:g14h,
				:g15,
				:g16,
				:_destroy
			]
		)
	end

end
