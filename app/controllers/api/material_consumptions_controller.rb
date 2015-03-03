module Api
  class MaterialConsumptionsController < ApplicationController
    respond_to :json

    def index
      @material_consumptions = MaterialConsumption.includes(:product, :material)
      respond_with @material_consumptions
    end

    def show
      @material_consumption = MaterialConsumption.includes(:product, :material).find(params[:id]) 
      respond_with @material_consumption
    end

    def update
      @material_consumption = MaterialConsumption.find(params[:id])
      respond_with @material_consumption.update_attributes(material_consumption_params)
    end

    def create
      @material_consumption = MaterialConsumption.create(material_consumption_params)
      respond_with :api, @material_consumption
    end





    private
    def material_consumption_params
      params.require(:material_consumption).permit(
        :id,
        :product_id,
        :material_id,
        :yield_per_unit
      )
    end

  end
end