class CalendarsController < ApplicationController
  # before_action :find_calendar, only: [:show]

  def show
    @calendar = Calendar.first
    # authorize @calendar
  end


  private

  # def find_calendar
  #   @calendar = Calendar.find(params[:id])
  # end

  def calendar_params
    params.require(:calendar).permit(:start_day, :start_year, :current_day, :months, :weekdays, :user)
  end

end
