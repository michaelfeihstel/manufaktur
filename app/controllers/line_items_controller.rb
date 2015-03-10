class LineItemsController < ApplicationController
  after_action :verify_authorized
  
  def get_quantity
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def select_product
    @product = Product.find(params[:product_id])
    @data = params

    respond_to do |format|
      format.js
    end
  end

  def change_quantity
    @line_item_id = params[:line_item_id]
    @quantity = params[:quantity].to_i || 0
    @product = Product.find(params[:product_id])
    @price_single = @product.price || 0
    @price_total = @quantity * @price_single

    respond_to do |format|
      format.js
    end
  end





  private
  def line_item_params
    params.require(:line_item).permit(
      :id,
      :product_id
    )
  end
end