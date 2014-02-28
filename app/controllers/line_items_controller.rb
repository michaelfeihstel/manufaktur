class LineItemsController < ApplicationController
	def get_quantity
		@line_item = LineItem.find(params[:id])

		respond_to do |format|
			format.html
			format.js
		end
	end
end
