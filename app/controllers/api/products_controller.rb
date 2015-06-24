module Api
  class ProductsController < ApplicationController
    respond_to :json
    protect_from_forgery except: [:create, :update]

    # GET /api/products/
    def index
      @products = Product.all
    end

    def search
      query = "%" + params[:query] + "%"
      @products = Product.where("sku ILIKE ? OR name ILIKE ? OR color_text ILIKE ?", query, query, query)
      render "index"
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
        :retail_price,
        :vat,
        :color_text,
        :size_set_id,
        :primary_color,
        :secondary_color,
        :text_color,
        :product_family
      )
    end

  end
end