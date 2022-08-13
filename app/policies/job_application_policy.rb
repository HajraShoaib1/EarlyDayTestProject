class JobApplicationPolicy < ApplicationPolicy
  def index?
    is_owner?
  end

  def create?
    is_owner?
  end

  def show?
    is_owner?
  end

  def update?
    is_owner?
  end
end
