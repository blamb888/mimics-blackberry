class EventsController < ApplicationController
  before_action :find_calendar, only: [:create]

  def create
    @event = Event.new(event_params)
    @event.calendar = @calendar
    @event.user = current_user
    authorize @event
    if @event.save
      raise
      redirect_to month_view_calendar_path(@calendar)
    else
      redirect_to month_view_calendar_path(@calendar)
    end
  end

  private

  def find_calendar
    @calendar = Calendar.find(params[:calendar_id])
  end

  def event_params
    params.require(:event).permit(:name, :category, :day_number, :rich_description, :user)
  end

end
