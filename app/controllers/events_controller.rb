class EventsController < ApplicationController
  before_action :find_calendar, only: [:create]

  def create
    @event = Event.new(event_params)
    @event.calendar = @calendar
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to calendar_path(@calendar)
    else
      redirect_to calendar_path(@calendar)
    end
  end

  private

  def find_calendar
    @calendar = Calendar.find(params[:calendar_id])
  end

  def event_params
    params.require(:event).permit(:name, :category, :day_number, :description, :user)
  end

end
