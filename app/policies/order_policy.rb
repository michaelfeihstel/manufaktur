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

  def set_period?
    index?
  end

  def destroy_line_items?
    destroy?
  end

  def mark?
    update?
  end

  def complete?
    update?
  end
end