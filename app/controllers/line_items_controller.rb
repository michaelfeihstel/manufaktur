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
    @line_items = LineItem.completed_since(23.months.ago.beginning_of_month).group_by_month(:completed_at).sum("(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)) * price")
    # @line_items_previous_year = LineItem.completed_between(23.months.ago.beginning_of_month, 12.months.ago.end_of_month).to_a.group_by_month(&:completed_at)
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