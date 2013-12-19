class ProductsController < ApplicationController

	def index
		@products = Product.all

		respond_to do |format|
  		format.html # index.html.erb
  		format.json { render json: @products }
		end
	end



	def show
		@product = Product.find(params[:id])
	end



	def new
		@product = Product.new
	end


	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end






	private
	def product_params
		params.require(:product).permit(
			:name,
			:sku,
			:color_text,
			:price,
			:vat
		)
	end
end
