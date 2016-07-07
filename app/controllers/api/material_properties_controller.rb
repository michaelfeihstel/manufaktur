class Api::MaterialPropertiesController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @material_properties = MaterialProperty.all
    authorize @material_properties
    render json: @material_properties
  end

  def show
    @material_property = MaterialProperty.find(params[:id])
    authorize @material_property
    render json: @material_property
  end

  def update
    @material_property = MaterialProperty.find(params[:id])
    authorize @material_property
    if @material_property.update(material_property_params)
      render json: @material_property
    else
      render json: @material_property.errors, status: :unprocessable_entity
    end
  end

  def create
    @material_property = MaterialProperty.new(material_property_params)
    authorize @material_property
    if @material_property.save
      render json: @material_property, status: :created
    else
      render json: @material_property.errors, status: :unprocessable_entity
    end
  end





  private

  def material_property_params
    params.require(:material_property).permit(
      :id,
      :material_id,
      :name,
      :value,
      :use_in_name
    )
  end
end