class Calendar < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_calendars
  has_many :events, dependent: :destroy

  validates :start_day, presence: true
  validates :start_year, presence: true
  validates :months, presence: true
  validates :weekdays, presence: true

def calculate_date(target_day) #TODO maybe I could refactor this.
    @calendar = self
    @sum_of_months = 0
    @target_day = target_day
    @current_month = 0
    @current_day = 0
    #iterate over the months has
    @calendar.months.values.each.with_index do |month, index|
      if(@sum_of_months + month > @target_day)
        #day is in this month set current month to index
        # puts "breaking"
        @current_month = index;
        break
      else
        # else add number of days to sum
        # puts "adding days"
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

  def event_day_calculation(today)
    date_calculation = self.calculate_date(today.to_i)
    month_name = date_calculation.keys.first
    day_number = date_calculation.values.first
    date = "#{month_name} - #{day_number}"
  end

end
