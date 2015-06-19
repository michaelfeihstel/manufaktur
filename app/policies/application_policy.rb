class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    user
  end

  def search?
    index?
  end

  def filter?
    index?
  end

  def dashboard?
    index?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user
  end

  def edit?
    update?
  end

  def destroy?
    user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

