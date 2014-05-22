class ProductsController < ApplicationController

	def index
		@search = Product.search(params[:q])
		@products = @search.result(distinct: true)

		respond_to do |format|
  		format.html # index.html.erb
  		format.json { render json: @products }
		end
	end



	def show
		@search = Product.search(params[:q])
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



	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path, :flash => { :success => "Product deleted!" }
	end



	def get_product_price
		@product = Product.find(params[:order][:line_items_attributes]["0"][:product_id])
		@temp_id = params[:temp_id]

		respond_to do |format|
			format.js
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
			:size_id,
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
