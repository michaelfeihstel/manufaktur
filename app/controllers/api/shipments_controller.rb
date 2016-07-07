class Api::ShipmentsController < Api::ApplicationController
  respond_to :json
  after_action :verify_authorized

  def index
    @shipments = Shipment.all
    authorize @shipments
    render json: @shipments
  end

  def show
    @shipment = Shipment.find(params[:id])
    authorize @shipment
    render json: @shipment
  end

  def create
    @shipment = Shipment.new(shipment_params)
    authorize @shipment
    if @shipment.save
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  def update
    @shipment = Shipment.find(params[:id])
    authorize @shipment
    if @shipment.update(shipment_params)
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end





  private
  def shipment_params
    params.require(:shipment).permit(
      :id,
      :order_id,
      :tracking_code,
      :weight,
      :carrier_id,
      :updated_at
    )
  end
end