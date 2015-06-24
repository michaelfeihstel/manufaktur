class ProductsController < ApplicationController
  before_action :initialize_search
  after_action :verify_authorized

  def dashboard
    @filter = { from: 3.months.ago.to_date, to: Date.today }
    @products = Product.limit(30).joins(:line_items).select("products.*, SUM(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)) AS quantity").where("line_items.created_at BETWEEN ? AND ? AND products.sku NOT IN ('LG105')", @filter[:from], @filter[:to]).group("products.id").order("quantity DESC")
    authorize @products
  end

  def set_period
    @filter = { from: params[:from], to: params[:to] }
    @products = Product.limit(30).joins(:line_items).select("products.*, SUM(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)) AS quantity").where("line_items.created_at BETWEEN ? AND ? AND products.sku NOT IN ('LG105')", params[:from], params[:to]).group("products.id").order("quantity DESC")
    authorize @products
  end

  def index
    @products = Product.includes(:product_images).order(:name)
    authorize @products
  end

  def filter
    @filter = params[:filter]
    @products = Product.only_model(@filter).includes(:product_images).order(:name)
    authorize @products

    render "index"
  end

  def search
    @products = @search.results(distinct: true).includes(:product_images).order(:name)
    authorize @products

    render "index"
  end

  def show
    @product = Product.includes({ line_items: [:order] }, { material_consumptions: [:material] }, { series: [:series_steps] }, :size_set, :product_inventory_items).find(params[:id])
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
      :product_family,
      product_images_attributes: [
        :id,
        :product_id,
        :image,
        :_destroy
      ]
    )
  end
end
