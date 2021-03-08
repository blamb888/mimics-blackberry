class AddDescriptionToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :title, :string
    add_column :calendars, :description, :text
  end
end
