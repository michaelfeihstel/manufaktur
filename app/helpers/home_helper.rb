module HomeHelper

  def get_categories_for_revenue_chart
    categories = LineItem.where("created_at BETWEEN '#{13.months.ago}' AND '#{Time.now}'").to_a.group_by_month(&:created_at).map{|k,v| v.map(&:price_total).sum.to_i }.prepend("Warenwert")
  end

  def get_columns_for_revenue_chart
    columns = LineItem.where("created_at BETWEEN '#{13.months.ago}' AND '#{Time.now}'").group_by_month(:created_at, format: "%b %Y").count.map{ |k, v| k }
  end

end
