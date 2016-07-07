class Api::ProductInventoryItemsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @product_inventory_items = ProductInventoryItem.all
    authorize @product_inventory_items
    render json: @product_inventory_items
  end

  def show
    @product_inventory_item = ProductInventoryItem.find(params[:id])
    authorize @product_inventory_item
    render json: @product_inventory_item
  end

  def create
    @product_inventory_item = ProductInventoryItem.new(product_inventory_item_params)
    authorize @product_inventory_item
    if @product_inventory_item.save
      render json: @product_inventory_item, status: :created
    else
      render json: @product_inventory_item.errors, status: :unprocessable_entity
    end
  end

  def update
    @product_inventory_item = ProductInventoryItem.find(params[:id])
    authorize @product_inventory_item
    if @product_inventory_item.save
      render json: @product_inventory_item
    else
      render json: @product_inventory_item, status: :unprocessable_entity
    end
  end





  private

  def product_inventory_item_params
    params.require(:product_inventory_item).permit(
      :id,
      :product_inventory_id,
      :product_id,
      :contact_id,
      :entered_on,
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
      :value
    )
  end
end