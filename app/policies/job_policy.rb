class JobPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    is_owner?
  end

  def show?
    true
  end

  def update?
    is_owner?
  end
end
