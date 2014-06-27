module Api
	class LineItemsController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/line_items/
		def index
			respond_with LineItem.all
		end

		# GET /api/line_items/1
		def show
			respond_with LineItem.find(params[:id])
		end

		# POST /api/line_items/
		def create
			respond_with LineItem.create(line_item_params)
		end

		# PUT /api/line_items/1
		def update
			respond_with LineItem.update(params[:id], line_item_params)
		end



		private
		def line_item_params
			params.require(:line_item).permit(
				:id,
				:created_at,
				:order_id,
				:product_id,
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
				:comment,
				:vat,
				:price
			)
		end
	end
end