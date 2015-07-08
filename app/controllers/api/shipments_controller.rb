class Api::ShipmentsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @shipments = Shipment.all
    authorize @shipments
    respond_with @shipments
  end

  def show
    @shipment = Shipment.find(params[:id])
    authorize @shipment
    respond_with @shipment
  end

  def create
    @shipment = Shipment.new(shipment_params)
    authorize @shipment
    if @shipment.save
      render nothing: :true, status: :created
    end
  end

  def update
    @shipment = Shipment.find(params[:id])
    authorize @shipment
    respond_with @shipment.update(shipment_params)
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