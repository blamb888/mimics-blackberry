class Calendar < ApplicationRecord
  MINIMUM_TOKEN_LENGTH = 5
  belongs_to :user
  has_many :user_calendars, dependent: :destroy
  has_many :users, through: :user_calendars
  has_many :events, dependent: :destroy
  has_secure_token

  validates :start_day, presence: true
  validates :start_year, presence: true
  validates :months, presence: true
  validates :weekdays, presence: true
  validates :name, presence: true
  # validates :title, presence: true
  # validates :description, presence: true
def get_day_style(day, current_user)
  if day == self.current_day
    #set yellow if current day
    return "year-current-day"
  elsif self.events.any? {|event| event.day_number == day && (event.private == false || (event.private == true && event.user == current_user))}
    #set blue if has events
    return "year-current-day-has-event"
  else
    #set as normal
    return "day"
  end

end
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

  def self.new_template(template, current_user)
    case template
    when "eberron"
      # @calendar = Calendar.new(
        # user: current_user,
        # name: "Eberron",
        # start_day: 1,
        # start_year: 1,
        # current_day: 1,
        # months: {Zarantyr: 28, Olarune: 28, Therendor: 28, Eyre: 28, Dravago: 28, Nymm: 28, Lharvion: 28, Barrakas: 28, Rhaan: 28, Sypheros: 28, Aryth: 28, Vult: 28 },
        # weekdays:{Sul: 0, Mol: 1, Zol: 2, Wir: 3, Zor: 4, Far: 5, Sar: 6}
      # )
      SetupCalendarService.new(current_user, template).call
    end
      #  Event.create!(
      #   calendar: @calendar,
      #   user: current_user,
        # name: "Rebirth Eve",
        # category: "Holiday",
        # day_number: 14,
        # rich_description: '<b>Rebirth Eve</b><br /><a href="https://eberron.fandom.com/wiki/Church_of_the_Silver_Flame" target="_blank">The Silver Flame</a><br />This flamic festival, which takes the form of a spiritual vigil, celebrates the winter solstice.<br />'
      # )
      # Event.create!(
      #   calendar: @calendar,
      #   user: current_user,
      #   name: "Bright Soul's Day",
      #   category: "Holiday",
      #   day_number: 46,
      #   rich_description: '<b>Bright Souls Day</b><br /><a href="https://static.wikia.nocookie.net/eberron/images/5/55/Silver-flame.jpg/revision/latest?cb=20090905064640" class="image"><img alt="Silver-flame.jpg" src="data:image/gif;base64,R0lGODlhAQABAIABAAAAAP///yH5BAEAAAEALAAAAAABAAEAQAICTAEAOw%3D%3D" decoding="async" width="20" height="22" data-image-name="Silver-flame.jpg" data-image-key="Silver-flame.jpg" data-src="https://static.wikia.nocookie.net/eberron/images/5/55/Silver-flame.jpg/revision/latest/scale-to-width-down/20?cb=20090905064640" class="lazyload" /></a> <a href="/wiki/The_Silver_Flame" class="mw-redirect" title="The Silver Flame">The Silver Flame</a><br />This Flamic festival, marking the end of winter, remembers the sacrifices and celebrates the lives of members of the church who died in the fight against evil. As it is a memorial day of sorts, practices include visiting the graves of the fallen to perform funeral rites. The faithful are forbidden to use artificial light sources for the entire day, though exceptions are made for emergencies.<br />'
      # )
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
end
