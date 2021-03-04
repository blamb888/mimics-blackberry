class Calendar < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_calendars
  has_many :events, dependent: :destroy

  validates :start_day, presence: true
  validates :start_year, presence: true
  validates :months, presence: true
  validates :weekdays, presence: true
  validates :name, presence: true

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
  
  def self.new_template(template)
    case template
    when "eberron"
      Calendar.new(
        name: "Eberron",
        start_day: 1,
        start_year: 1,
        current_day: 1,
        months: {Zarantyr: 28, Olarune: 28, Therendor: 28, Eyre: 28, Dravago: 28, Nymm: 28, Lharvion: 28, Barrakas: 28, Rhaan: 28, Sypheros: 28, Aryth: 28, Vult: 28 },
        weekdays:{Sul: 0, Mol: 1, Zol: 2, Wir: 3, Zor: 4, Far: 5, Sar: 6}
      )
    end
  end
 
  def get_next_month(month_index)
    next_month = month_index.to_i + 1
    if next_month > self.months.length - 1
      next_month = 0
    end
    return next_month
  end

  def get_previous_month(month_index)
    next_month = month_index.to_i - 1
    if next_month < 0
      next_month = self.months.length - 1
    end
    return next_month
  end

  def set_current_day(day)
    self.current_day = day
    self.save
  end
end
