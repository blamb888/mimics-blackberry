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
end
