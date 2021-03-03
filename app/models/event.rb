class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :user
  has_rich_text :rich_description

  CATEGORIES = ['Weather', 'Notes', 'Holiday', 'Item', 'Character']

  validates :name, presence: true
  validates :category, presence: true
  validates :day_number, presence: true
  validates :description, presence: true
end
