class CalendarsController < ApplicationController
  before_action :find_calendar, only: [:show]
  helper_method :find_day_events, :get_year_day_from_month

  def index
    @calendars = policy_scope(Calendar).order(created_at: :desc)
  end

  def show
    @calendar = Calendar.find(params[:id])
    @events = Event.where(:calendar_id == @calendar)
    @event = Event.new
  end

  def show_month
    @calendar = Calendar.includes(:events).find(params[:id])
    authorize @calendar
    @month_name = @calendar.months.keys[params[:month_id].to_i]
    @month_days = @calendar.months.values[params[:month_id].to_i]
    @events = @calendar.events
    @month_index = params[:month_id]
    # @events = Event.where(:calendar_id == @calendar)
    @event = Event.new
  end

  def new
    @calendar = Calendar.new
    authorize @calendar
  end

  def create
    if params[:template].present?
      @calendar = Calendar.new_template(params[:template], current_user)
    else
      @calendar = Calendar.new(calendar_params)
    end
    @calendar.user = current_user
    authorize @calendar
    if @calendar.save
      redirect_to calendar_path(@calendar)
    else
      render :new
    end
  end

  def find_day_events(events, day)
    day_events = []
    events.each do |e|
      #if event day is the same as day
      if(e.day_number == day)
        #add to event array
        day_events << e
      end
    end
    return day_events
  end

  def get_year_day_from_month(month_id)
    day = 0
    @calendar.months.values.each.with_index do |days, index|
      if(index < month_id)
        day += days
      else
        break
      end
    end
    return day
  end
  private

  def find_calendar
    @calendar = Calendar.find(params[:id])
    authorize @calendar
  end

  def calendar_params
    params.require(:calendar).permit(:name, :start_day, :start_year, :current_day, :months, :weekdays, :user)
  end

  # def calculate_date(target_day)
  #   @calendar = Calendar.first
  #   @sum_of_months = 0
  #   @target_day = target_day
  #   @current_month = 0
  #   @current_day = 0
  #   #iterate over the months has
  #   @calendar.months.values.each.with_index do |month, index|
  #     if(@sum_of_months + month > @target_day)
  #       #day is in this month set current month to index
  #       puts "breaking"
  #       @current_month = index;
  #       break
  #     else
  #       # else add number of days to sum
  #       puts "adding days"
  #       @sum_of_months += month
  #     end
  #   end
  #   #use current month to get day of the month
  #   @calendar.months.values[@current_month].times do
  #     @sum_of_months += 1
  #     @current_day += 1
  #     #if the sum is the same as the target day
  #     if(@sum_of_months == @target_day)
  #       break
  #     end
  #   end
  #   @final_date = { @calendar.months.keys[@current_month] => @current_day}
  #   return @final_date
  # end
end
