class ProductPolicy < ApplicationPolicy
  def update_top_products?
    index?
  end
end