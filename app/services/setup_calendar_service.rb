class SetupCalendarService
  attr_reader :current_user, :template

  def initialize(current_user, template)
    @current_user = current_user
    @template = template
    @file_path = "db/calendars/#{template}.json"
  end

  def call
    create_calendar
    create_events
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
      create_events
  end

  def create_events
    serialized_calendar = File.read(@file_path)
    info = JSON.parse(serialized_calendar, symbolize_names: true)
    rich_description = info[:events][0][:rich_description]
    raise
      Event.create!(
        calendar: @calendar,
        user: @current_user,

      )
  end

end
