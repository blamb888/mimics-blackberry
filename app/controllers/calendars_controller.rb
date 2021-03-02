class CalendarsController < ApplicationController
  before_action :find_calendar, only: [:show]

  #authorize @calendar

  def index
    @calendars = policy_scope(Calendar).order(created_at: :desc)
  end

  

  def show
    #authorize @calendar
  end


  private

  def find_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:start_day, :start_year, :current_day, :months, :weekdays, :user)

  end

  def calculate_date(target_day)
    @calendar = Calendar.first
    @sum_of_months = 0
    @target_day = target_day
    @current_month = 0
    @current_day = 0
    #iterate over the months has
    @calendar.months.values.each.with_index do |month, index|
      if(@sum_of_months + month > @target_day)
        #day is in this month set current month to index
        puts "breaking"
        @current_month = index;
        break
      else
        # else add number of days to sum
        puts "adding days"
        @sum_of_months += month
      end
    end
    #use current month to get day of the month
    @calendar.months.values[@current_month].times do
      @sum_of_months += 1
      @current_day += 1
      #if the sum is the same as the target day
      if(@sum_of_months == @target_day)
        break
      end
    end
    @final_date = { @calendar.months.keys[@current_month] => @current_day}
    return @final_date
  end
end
