class CalendarPolicy < ApplicationPolicy
  class Scope < Scope


    def resolve
      user.all_calendars
    end
  end

  def show?
    user.all_calendars.include?(record)
  end
  
  def show_month?
    user.all_calendars.include?(record)
  end

    def new?
      return true
    end


    def create?
      return true
    end

  def update?
    record.user == user
    # - record: the calendar passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end


  def destroy?
    record.user == user
  end

  def create?
    return true
  end
end
