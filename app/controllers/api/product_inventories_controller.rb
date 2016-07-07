class Api::ProductInventoriesController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @product_inventories = ProductInventory.all
    authorize @product_inventories
    render json: @product_inventories
  end

  def show
    @product_inventory = ProductInventory.find(params[:id])
    authorize @product_inventory
    render json: @product_inventory
  end

  def create
    @product_inventory = ProductInventory.new(product_inventory_params)
    authorize @product_inventory
    if @product_inventory.save
      render json: @product_inventory, status: :created
    else
      render json: @product_inventory.errors, status: :unprocessable_entity
    end
  end

  def update
    @product_inventory = ProductInventory.find(params[:id])
    authorize @product_inventory
    if @product_inventory.update(product_inventory_params)
      render json: @product_inventory
    else
      render json: @product_inventory.errors, status: :unprocessable_entity
    end
  end





  private

  def product_inventory_params
    params.require(:product_inventory).permit(
      :id,
      :year,
      :name,
      :created_at
    )
  end
end