class EventPolicy < ApplicationPolicy
  class Scope < Scope

    def new
      record.user == user
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

    def resolve
      scope.all
    end
  end
end
