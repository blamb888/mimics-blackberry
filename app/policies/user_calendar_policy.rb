class UserCalendarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def join?
    record.calendar.user != user
  end

end