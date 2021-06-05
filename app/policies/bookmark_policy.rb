class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    record.list.user == user
  end

  def destroy?
    record.list.user == user
  end

end
