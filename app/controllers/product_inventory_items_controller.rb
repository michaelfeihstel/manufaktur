class ProductInventoryItemsController < ApplicationController
  before_action :initialize_search
  after_action :verify_authorized

  def index
    @product_inventory = ProductInventory.find(params[:product_inventory_id])
    @entries = @product_inventory.entries.includes({ product: [:size_set] })
    authorize @entries
  end





  private

  def initialize_search
  end
end