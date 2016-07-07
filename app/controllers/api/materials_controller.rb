class Api::MaterialsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @materials = Material.all
    authorize @materials
    render json: @materials
  end

  def show
    @material = Material.find(params[:id])
    authorize @material
    render json: @material
  end

  def create
    @material = Material.new(material_params)
    authorize @material
    if @material.save
      render json: @material, status: :created
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  def update
    @material = Material.find(params[:id])
    authorize @material
    if @material.update(material_params)
      render json: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
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