class ContactPolicy < ApplicationPolicy
  def retailers?
    index?
  end

  def suppliers?
    index?
  end

  def employees?
    index?
  end

  def customers?
    index?
  end
end