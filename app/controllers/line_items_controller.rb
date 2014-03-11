class LineItemsController < ApplicationController
	
	def get_quantity
		@line_item = LineItem.find(params[:id])

		respond_to do |format|
			format.html
			format.js
		end
	end

	def update_product_price
		@product = Product.find(params[:product_id])
		@price_single = @product.price.to_i || 0
		@quantity = params[:quantity].to_i || 0
		@price_total = @quantity * @price_single


		respond_to do |format|
			format.js
		end
	end

end
