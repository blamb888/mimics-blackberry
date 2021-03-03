class Calendar < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_calendars
  has_many :events, dependent: :destroy

  validates :start_day, presence: true
  validates :start_year, presence: true
  validates  :months, presence: true
  validates :weekdays, presence: true
  validates :name, presence: true
end
