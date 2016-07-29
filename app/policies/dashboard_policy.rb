class DashboardPolicy < Struct.new(:user, :dashboard)
  def show?
    user
  end
end 