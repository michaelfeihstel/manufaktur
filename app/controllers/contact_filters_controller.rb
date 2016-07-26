class ContactFiltersController < ApplicationController
  def set_revenue_chart
    @contact = Contact.find(params[:id])
    @period = params[:period]
    render "contacts/ajax/set_revenue_chart"
  end

  def set_product_family_share_chart
    @contact = Contact.find(params[:id])
    from = params[:from] || 1.years.ago
    to = params[:to] || Time.now
    @product_families = @contact.line_items.select("product_families.name AS name, SUM(COALESCE(g1, 0) + COALESCE(g1h, 0) + COALESCE(g2, 0) + COALESCE(g2h, 0) + COALESCE(g3, 0) + COALESCE(g3h, 0) + COALESCE(g4, 0) + COALESCE(g4h, 0) + COALESCE(g5, 0) + COALESCE(g5h, 0) + COALESCE(g6, 0) + COALESCE(g6h, 0) + COALESCE(g7, 0) + COALESCE(g7h, 0) + COALESCE(g8, 0) + COALESCE(g8h, 0) + COALESCE(g9, 0) + COALESCE(g9h, 0) + COALESCE(g10, 0) + COALESCE(g10h, 0) + COALESCE(g11, 0) + COALESCE(g11h, 0) + COALESCE(g12, 0) + COALESCE(g12h, 0) + COALESCE(g13, 0) + COALESCE(g13h, 0) + COALESCE(g14, 0) + COALESCE(g14h, 0) + COALESCE(g15, 0) + COALESCE(g16, 0)) AS total").where(completed_at: from..to).joins(product: :product_family).group("product_families.name").order("total DESC")
    render "contacts/ajax/set_product_family_share_chart"
  end
end