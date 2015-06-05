class ProductsController < ApplicationController
  before_action :initialize_search
  after_action :verify_authorized

  def index
    @products = @search.result(distinct: true).includes(:product_images).order(:name)
    authorize @products
  end

  def filter_by_model
    @products = @search.result(distinct: true).only_model(params[:name]).includes(:product_images).order(:name)
    authorize @product

    render "index"
  end

  def search
    index
    render "index"
  end

  def show
    @product = Product.includes({ line_items: [:order] }, :material_consumptions).find(params[:id])
    authorize @product
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product

    if @product.update_attributes(product_params)
      redirect_to product_path(@product), notice: "Artikel aktualisiert."
    else
      render action: :edit
    end
  end

  def new
    @product = Product.new
    authorize @product

    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    authorize @product

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end



  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy

    redirect_to products_path, :flash => { :success => "Product deleted!" }
  end



  def get_product_price
    @product = Product.find(params[:order][:line_items_attributes]["0"][:product_id])
    authorize @product
    
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
      :text_color,
      :price,
      :vat,
      :size_set_id,
      product_images_attributes: [
        :id,
        :product_id,
        :image,
        :_destroy
      ]
    )
  end
end
