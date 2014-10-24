class ProductsController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]

  def index
    @products = @search.result(distinct: true).includes(:product_images).order(:name)
  end



  def search
    index
    render "index"
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
      redirect_to product_path(@product), notice: "Artikel aktualisiert."
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
  def initialize_search
    @search = Product.search(params[:q])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :sku,
      :color_text,
      :primary_color,
      :secondary_color,
      :price,
      :vat,
      :size_id,
      product_images_attributes: [
        :id,
        :product_id,
        :image,
        :_destroy
      ]
    )
  end
end
