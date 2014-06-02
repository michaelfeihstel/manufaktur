module Api
	class OrdersController < ApplicationController
		respond_to :json

		# GET /orders/
		def index
			respond_with Order.all
		end

		# GET /orders/1/
		def show
			respond_with Order.find(params[:id])
		end

		# POST /orders/
		def create
			respond_with Order.create(order_params)
		end

		# PATCH /orders/1/
		def update
			respond_with Order.update(params[:id], order_params)
		end

		# DELETE /orders/1/
		def destroy
			respond_with Order.destroy(params[:id])
		end



		private

		def order_params
			params.require(:order).permit(
				:id,
				:delivered_on,
				:invoiced_at,
				:completed_at,
				:contact_id,
				:billing_address_id,
				:billing_address_name,
				:billing_address_street,
				:billing_address_house_number,
				:billing_address_zip,
				:billing_address_city,
				:billing_address_country,
				:delivery_address_id,
				:delivery_address_name,
				:delivery_address_street,
				:delivery_address_house_number,
				:delivery_address_zip,
				:delivery_address_city,
				:delivery_address_country,
				:marked,
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
end