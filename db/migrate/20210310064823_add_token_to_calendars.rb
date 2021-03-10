class AddTokenToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :token, :string, limit: 5
    add_index :calendars, :token, unique: true
  end
end
