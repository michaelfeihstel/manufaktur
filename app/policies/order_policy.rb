class OrderPolicy < ApplicationPolicy
  def favorites?
    index?
  end

  def dashboard?
    index?
  end

  def update_revenue_chart?
    index?
  end
end