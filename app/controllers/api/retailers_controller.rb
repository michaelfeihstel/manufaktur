module Api
  class RetailersController < ApplicationController
    respond_to :json

    def index
      @retailers = Retailer.all
      respond_with @retailers
    end

    def show
      @retailer = Retailer.find(params[:id])
      respond_with @retailer
    end

    def update
      @retailer = Retailer.find(params[:id])
      respond_with @retailer.update_attributes(retailer_params)
    end

    def create
      @retailer = Retailer.create(retailer_params)
      respond_with :api, @retailer
    end





    private
    def retailer_params
      params.require(:retailer).permit(
        :id,
        :allow_orders
      )
    end

  end
end