class SetupCalendarService
  attr_reader :current_user, :template

  def initialize(current_user, template)
    @current_user = current_user
    @template = template
    @file_path = "db/calendars/#{template}.json"
  end

  def call
    @calendar = create_calendar
    create_events
    @calendar
  end

  def create_calendar
    serialized_calendar = File.read(@file_path)
    info = JSON.parse(serialized_calendar, symbolize_names: true)
    @calendar = Calendar.new(
        user: current_user,
        name: info[:calendar][:name],
        start_day: info[:calendar][:start_day],
        start_year: info[:calendar][:start_year],
        current_day: info[:calendar][:current_day],
        months: info[:calendar][:months],
        weekdays: info[:calendar][:weekdays]
      )
  end

  def create_events
    serialized_calendar = File.read(@file_path)
    info = JSON.parse(serialized_calendar, symbolize_names: true)
      info[:events].each do |event|
        Event.create!(
          calendar: @calendar,
          user: @current_user,
          name: event[:name],
          category: event[:category],
          day_number: event[:day_number],
          rich_description: event[:rich_description],
          private: false
        )
      end
  end

end
