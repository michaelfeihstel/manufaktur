class BackorderPolicy < ApplicationPolicy
  def destroy_by_order?
    destroy?
  end
end