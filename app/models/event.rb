class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :user
  has_rich_text :rich_description
  has_many_attached :photos

  CATEGORIES = ['Weather', 'Notes', 'Holiday', 'Item', 'Character', 'Historical Event']

  validates :name, presence: true
  validates :category, presence: true
  validates :day_number, presence: true
  # validates :rich_description, presence: true

    def self.new_template(template)
    case template
    when "eberron"
      Event.create(
        name: "rebirth eve",
        category: "holiday",
        day_number: 1,
        rich_description: '<b>Rebirth Eve</b><br /><a href="https://static.wikia.nocookie.net/eberron/images/5/55/Silver-flame.jpg/revision/latest?cb=20090905064640" class="image"><img alt="Silver-flame.jpg" src="data:image/gif;base64,R0lGODlhAQABAIABAAAAAP///yH5BAEAAAEALAAAAAABAAEAQAICTAEAOw%3D%3D" decoding="async" width="20" height="22" data-image-name="Silver-flame.jpg" data-image-key="Silver-flame.jpg" data-src="https://static.wikia.nocookie.net/eberron/images/5/55/Silver-flame.jpg/revision/latest/scale-to-width-down/20?cb=20090905064640" class="lazyload" /></a> <a href="/wiki/The_Silver_Flame" class="mw-redirect" title="The Silver Flame">The Silver Flame</a><br />This flamic festival, which takes the form of a spiritual vigil, celebrates the winter solstice.<br />'
      )
      Event.calendar = Calendar.last
      Event.user = current_user
      Event.save
      raise
    end
  end
end
