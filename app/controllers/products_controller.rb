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


	def edit
		@product = Product.find(params[:id])
	end


	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to products_path, notice: "Artikel aktualisiert."
		else
			render action: :edit
		end
	end



	def new
		@product = Product.new
		@product.product_images.build
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
			:vat,
			:variation_set_id,
			product_images_attributes: [
				:id,
				:product_id,
				:image,
				:_destroy
			]
		)
	end
end
