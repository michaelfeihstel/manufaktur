class MaterialPolicy < ApplicationPolicy
  def set_period?
    show?
  end
end