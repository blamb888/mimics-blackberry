class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :user

  CATEGORIES = ['Weather', 'Notes', 'Holiday', 'Item', 'Character']

  validates :name, presence: true
  validates :category, presence: true
  validates :day_number, presence: true
  validates :description, presence: true
end
