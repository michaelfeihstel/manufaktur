module Api
	class OrdersController < ApplicationController
		respond_to :json

		# GET /api/orders/
		def index
			respond_with Order.all
		end

		# GET /api/orders/1/
		def show
			respond_with Order.find(params[:id]), include: :line_items
		end

		# POST /api/orders/
		def create
			respond_with Order.create(order_params)
		end

		# PATCH /api/orders/1/
		def update
			respond_with Order.update(params[:id], order_params)
		end

		# DELETE /api/orders/1/
		def destroy
			respond_with Order.destroy(params[:id])
		end



		private

		def order_params
			params.require(:order).permit(
				:id,
				:created_at,
				:delivered_on,
				:is_scheduled_delivery,
				:invoiced_at,
				:completed_at,
				:paid_on,
				:paid_amount,
				:cashback_until,
				:cashback_percent,
				:contact_id,
				:tax_id,
				:billing_address_id,
				:billing_name,
				:billing_street,
				:billing_house_number,
				:billing_zip,
				:billing_city,
				:billing_country,
				:delivery_address_id,
				:delivery_name,
				:delivery_street,
				:delivery_house_number,
				:delivery_zip,
				:delivery_city,
				:delivery_country,
				:marked,
				:comment,
				:is_webshop,
				:is_free,
				:is_vat_exempt,
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