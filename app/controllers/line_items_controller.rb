# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  product_id   :integer
#  comment      :text
#  g1           :integer
#  g1h          :integer
#  g2           :integer
#  g2h          :integer
#  g3           :integer
#  g3h          :integer
#  g4           :integer
#  g4h          :integer
#  g5           :integer
#  g5h          :integer
#  g6           :integer
#  g6h          :integer
#  g7           :integer
#  g7h          :integer
#  g8           :integer
#  g8h          :integer
#  g9           :integer
#  g9h          :integer
#  g10          :integer
#  g10h         :integer
#  g11          :integer
#  g11h         :integer
#  g12          :integer
#  g12h         :integer
#  g13          :integer
#  g13h         :integer
#  g14          :integer
#  g14h         :integer
#  g15          :integer
#  g16          :integer
#  vat          :decimal(, )
#  price        :decimal(8, 2)
#  created_at   :datetime
#  updated_at   :datetime
#  fmid         :integer
#  completed_at :datetime
#

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
