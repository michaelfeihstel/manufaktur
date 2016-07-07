class Api::ProductsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized
  protect_from_forgery except: [:create, :update]

  # GET /api/products/
  def index
    @products = Product.all
    authorize @products
    render json: @products
  end

  def search
    query = "%" + params[:query] + "%"
    @products = Product.where("sku ILIKE ? OR name ILIKE ? OR color_text ILIKE ?", query, query, query)
    render "index"
  end

  # GET /api/products/1
  def show
    @product = Product.find(params[:id])
    authorize @product
    render json: @product
  end

  # POST /api/product/
  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unpreocessable_entity
    end
  end

  # PUT /api/products/1
  def update
    @product = Product.find(params[:id])
    authorize @product
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unpreocessable_entity
    end
  end



  private

  def product_params
    params.require(:product).permit(
      :id,
      :sku,
      :name,
      :price,
      :retail_price,
      :vat,
      :color_text,
      :size_set_id,
      :primary_color,
      :secondary_color,
      :text_color,
      :product_family_id
    )
  end

end