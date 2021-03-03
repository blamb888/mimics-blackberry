class EventsController < ApplicationController

  def new
    @event = Event.new
    @calendar = Calendar.find(params[:calendar_id])
    authorize @calendar
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.calendar = @calendar
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to calendar_path(@calendar)
    else
      render :calendar
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :category, :day_number, :description, :user)
  end

end
