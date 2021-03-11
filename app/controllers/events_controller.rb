class EventsController < ApplicationController
  before_action :find_calendar, only: [:new, :create]
  skip_before_action :verify_authenticity_token, :only => [:create]
  skip_before_action :authenticate_user!


  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.calendar = @calendar
    @event.user = current_user if user_signed_in?
    authorize @event
    if @event.save
      redirect_to month_view_calendar_path(@calendar, :month_id => params[:month_id].to_i, :today => params[:day_number].to_i), notice: 'Event was successfully created.'
    else
      redirect_to month_view_calendar_path(@calendar, :month_id => params[:month_id].to_i, :today => params[:day_number].to_i), notice: 'Event not created.'
    end
  end

  private

  def find_calendar
    @calendar = Calendar.find(params[:calendar_id])
  end

  def event_params
    params.require(:event).permit(:user_id, :name, :category, :private, :day_number, :rich_description, photos: [])
  end

end
