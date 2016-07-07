class Api::MaterialConsumptionsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @material_consumptions = MaterialConsumption.all
    authorize @material_consumptions
    render json: @material_consumptions
  end

  def show
    @material_consumption = MaterialConsumption.find(params[:id])
    authorize @material_consumption
    render json: @material_consumption
  end

  def create
    @material_consumption = MaterialConsumption.new(material_consumption_params)
    authorize @material_consumption
    if @material_consumption.save
      render json: @material_consumption, status: :created
    else
      render json: @material_consumption.errors, status: :unprocessable_entity
    end
  end

  def update
    @material_consumption = MaterialConsumption.find(params[:id])
    authorize @material_consumption
    if @material_consumption.update(material_consumption_params)
      render json: @material_consumption
    else
      render json: @material_consumption.errors, status: :unprocessable_entity
    end
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