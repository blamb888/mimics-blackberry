class UserCalendarsController < ApplicationController

  def create
    @calendar = Calendar.find(params[:calendar_id])
    @user_calendar = UserCalendar.new
    @user_calendar.calendar = @calendar
    @user_calendar.user = get_user_from_email(params[:add_user_params].values.first)
    authorize @user_calendar
    if @user_calendar.save
      #redirect to page with the add player button/year view?
      redirect_to calendar_path(@calendar)
    else
      redirect_to calendar_path(@calendar)
    end
  end

  def user_calendar_params
    params.require(:user_calendar).permit("email")
  end

  def get_user_from_email(email)
    User.find_by(email: email)
  end
end
