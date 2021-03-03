class MigrateDescriptiontoRichDescriptionEvents < ActiveRecord::Migration[6.1]
  def up
    Event.find_each do |event|
      event.update(rich_description: event.description)
    end
  end

  def down
    Event.find_each do |event|
      event.update(description: event.rich_description)
      event.update(rich_description: nil)
  end

end
