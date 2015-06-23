class LineItemsController < ApplicationController
  
  def get_quantity
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def select_product
    @product = Product.includes(:size_set).find(params[:product_id])

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

  def update_revenue_chart
    @line_items = LineItem.completed_since(13.months.ago.beginning_of_month).to_a.group_by_month(&:completed_at)
    @line_items_previous_year = LineItem.completed_between(25.months.ago.beginning_of_month, 14.months.ago.end_of_month).to_a.group_by_month(&:completed_at)
    render "orders/dashboard/update_revenue_chart"
  end





  private
  def line_item_params
    params.require(:line_item).permit(
      :id,
      :product_id
    )
  end
end