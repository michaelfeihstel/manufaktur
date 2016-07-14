class Api::BackordersController < Api::ApplicationController
  respond_to :json
  after_action :verify_authorized

  def index
    @backorders = Backorder.all
    authorize @backorders
    render json: @backorders
  end

  def show
    @backorder = Backorder.find(params[:id])
    authorize @backorder
    render json: @backorder
  end

  def create
    @backorder = Backorder.new(backorder_params)
    authorize @backorder
    if @backorder.save
      render json: @abckorder, status: :created
    else
      render json: @backorder.errors, status: :unprocessable_entity
    end
  end

  def update
    @backorder = Backorder.find(params[:id])
    authorize @backorder
    if @backorder.update(backorder_params)
      render json: @backorder
    else
      render json: @backorder.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @backorder = Backorder.find(params[:id])
    authorize @backorder
    if @backorder.destroy
      head 204
    else
      head :bad_request
    end
  end

  def destroy_by_order
    @backorders = Backorder.where(order_id: params[:order_id])
    authorize @backorders
    if @backorders.destroy_all
      head 204
    else
      head :bad_request
    end
  end



  private

  def backorder_params
    params.require(:backorder).permit(
      :id,
      :order_id,
      :product_id,
      :g1,
      :g1h,
      :g2,
      :g2h,
      :g3,
      :g3h,
      :g4,
      :g4h,
      :g5,
      :g5h,
      :g6,
      :g6h,
      :g7,
      :g7h,
      :g8,
      :g8h,
      :g9,
      :g9h,
      :g10,
      :g10h,
      :g11,
      :g11h,
      :g12,
      :g12h,
      :g13,
      :g13h,
      :g14,
      :g14h,
      :g15,
      :g16,
      :comment
    )
  end
end