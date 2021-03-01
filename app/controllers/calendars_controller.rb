class CalendarsController < ApplicationController
  authorize @calendar

  def index
    @calendars = policy_scope(Calendar).order(created_at: :desc)
  end

end
