class DashboardController < ApplicationController
  def show
    @options =  {
      from: params[:from] || 1.month.ago,
      to: params[:to] ||  Time.now
    }
  end

  def load_revenue_chart
    @line_items = LineItem.completed_since(23.months.ago.beginning_of_month).group_by_month(:completed_at, format: '%b %Y').sum("(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)) * price")
    @line_items_shop = LineItem.webshop.completed_since(11.months.ago.beginning_of_month).group_by_month("line_items.completed_at", format: '%b %Y', last: 12).sum("(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)) * price")
    render "dashboard/ajax/load_revenue_chart"
  end

  def load_product_family_share_chart
    from = params[:from] || 1.months.ago
    to = params[:to] || Time.now
    period = from..to
    @product_families = LineItem.select("product_families.name AS name, SUM(COALESCE(g1, 0) + COALESCE(g1h, 0) + COALESCE(g2, 0) + COALESCE(g2h, 0) + COALESCE(g3, 0) + COALESCE(g3h, 0) + COALESCE(g4, 0) + COALESCE(g4h, 0) + COALESCE(g5, 0) + COALESCE(g5h, 0) + COALESCE(g6, 0) + COALESCE(g6h, 0) + COALESCE(g7, 0) + COALESCE(g7h, 0) + COALESCE(g8, 0) + COALESCE(g8h, 0) + COALESCE(g9, 0) + COALESCE(g9h, 0) + COALESCE(g10, 0) + COALESCE(g10h, 0) + COALESCE(g11, 0) + COALESCE(g11h, 0) + COALESCE(g12, 0) + COALESCE(g12h, 0) + COALESCE(g13, 0) + COALESCE(g13h, 0) + COALESCE(g14, 0) + COALESCE(g14h, 0) + COALESCE(g15, 0) + COALESCE(g16, 0)) AS total").where(completed_at: period).joins(product: :product_family).group("product_families.name").order("total DESC")
    render "dashboard/ajax/load_product_family_share_chart"
  end
end