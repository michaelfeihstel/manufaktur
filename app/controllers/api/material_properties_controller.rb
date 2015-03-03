module Api
  class MaterialPropertiesController < ApplicationController
    respond_to :json

    def index
      @material_properties = respond_with MaterialProperty.all
    end

    def show
      @material_property = respond_with MaterialProperty.find(params[:id])
    end

    def update
      @material_property = MaterialProperty.find(params[:id])
      respond_with @material_property.update_attributes(material_property_params)
    end

    def create
      @material_property = MaterialProperty.create(material_property_params)
      respond_with :api, @material_property
    end





    private
    def material_property_params
      params.require(:material_property).permit(
        :id,
        :name,
        :value,
        :use_in_name
      )
    end

  end
end