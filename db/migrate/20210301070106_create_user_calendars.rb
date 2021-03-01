class CreateUserCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :user_calendars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true
      t.timestamps
    end
  end
end
