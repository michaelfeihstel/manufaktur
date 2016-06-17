# == Schema Information
#
# Table name: product_inventories
#
#  id         :integer          not null, primary key
#  year       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductInventoriesController < ApplicationController
  before_action :initialize_search
  after_action :verify_authorized

  def index
    @product_inventories = ProductInventory.all
    authorize @product_inventories
  end

  def show
    @product_inventory = ProductInventory.find(params[:id])
    authorize @product_inventory
  end





  private

  def initialize_search
  end
end
