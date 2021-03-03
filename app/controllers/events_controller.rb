class EventsController < ApplicationController
  def new
    @event = Event.new(event_params)
  end


  private

  def event_params
    params.require(:event).permit(:name, :category, :day_number, :description, :user)
  end

end
