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

  def join
    @calendar = Calendar.find_by(token: params[:token])
    @user_calendar = UserCalendar.new(user: current_user)
    @user_calendar.calendar = @calendar
    authorize @user_calendar
    if @user_calendar.save
      #redirect to page with the add player button/year view?
      redirect_to calendar_path(@calendar)
    else
      flash[:alert] = "Cannot connect to calendar"
      redirect_to root_path
    end

  end

  def user_calendar_params
    params.require(:user_calendar).permit("email")
  end

  def get_user_from_email(email)
    User.find_by(email: email)
  end
end
