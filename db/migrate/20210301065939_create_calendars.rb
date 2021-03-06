class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.integer :start_year
      t.integer :start_day
      t.integer :current_day
      t.json :months
      t.json :weekdays
      # creator of calendar
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
