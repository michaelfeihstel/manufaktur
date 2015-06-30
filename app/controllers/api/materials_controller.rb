module Api
  class MaterialsController < ApplicationController
    respond_to :json

    def index
      @materials = respond_with Material.all, include: :material_properties
    end

    def show
      @material = respond_with Material.find(params[:id]), include: :material_properties
    end

    def update
      @material = Material.find(params[:id])
      respond_with @material.update_attributes(material_params)
    end

    def create
      @material = respond_with Material.create(material_params)
    end




    private
    def material_params
      params.require(:material).permit(
        :id,
        :contact_id,
        :name,
        :supplier_sku,
        :unit,
        :price,
        :comment,
        material_properties_attributes: [
          :id,
          :name,
          :value,
          :use_in_name,
          :_destroy
        ]
      )
    end

  end
end