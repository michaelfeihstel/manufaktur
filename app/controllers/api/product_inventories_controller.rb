class Api::ProductInventoriesController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @product_inventories = ProductInventory.all
    authorize @product_inventories
    respond_with @product_inventories
  end

  def show
    @product_inventory = ProductInventory.find(params[:id])
    authorize @product_inventory
    respond_with @product_inventory
  end

  def create
    @product_inventory = ProductInventory.new(product_inventory_params)
    authorize @product_inventory
    if @product_inventory.save
      render nothing: true, status: :created
    end
  end

  def update
    @product_inventory = ProductInventory.find(params[:id])
    authorize @product_inventory
    respond_with @product_inventory.update(product_inventory_params)
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