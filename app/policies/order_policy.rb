class OrderPolicy < ApplicationPolicy
  def favorites?
    index?
  end
end