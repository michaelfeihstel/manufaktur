class OrderPolicy < ApplicationPolicy
  def favorites?
    index?
  end

  def dashboard?
    index?
  end
end