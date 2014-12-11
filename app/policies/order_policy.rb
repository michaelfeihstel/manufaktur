class OrderPolicy < ApplicationPolicy
  def get_marked_orders?
    index?
  end
end