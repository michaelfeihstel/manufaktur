class ProductPolicy < ApplicationPolicy
  def set_period?
    index?
  end
end