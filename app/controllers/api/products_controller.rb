module Api
	class ProductsController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/products/
		def index
			respond_with Product.all
		end

		# GET /api/products/1
		def show
			respond_with Product.find(params[:id])
		end

		# POST /api/product/
		def create
			respond_with Product.create(product_params)
		end

		# PUT /api/products/1
		def update
			respond_with Product.update(params[:id], product_params)
		end



		private
		def product_params
			params.require(:product).permit(
				:id,
				:sku,
				:name,
				:price,
				:vat,
				:color_text,
				:size_id,
				:primary_color,
				:secondary_color,
				:text_color
			)
		end

	end
end