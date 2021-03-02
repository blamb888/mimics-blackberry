class CalendarsController < ApplicationController
  before_action :find_calendar, only: [:show]

  authorize @calendar

  def index
    @calendars = policy_scope(Calendar).order(created_at: :desc)

  

  def show
    authorize @calendar
  end


  private

  def find_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:start_day, :start_year, :current_day, :months, :weekdays, :user)

  end

end
