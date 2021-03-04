class Calendar < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_calendars
  has_many :events, dependent: :destroy

  validates :start_day, presence: true
  validates :start_year, presence: true
  validates :months, presence: true
  validates :weekdays, presence: true

  def get_next_month(month_index)
    next_month = month_index.to_i + 1
    if next_month > self.months.length - 1
      next_month = 0
    end
    return next_month
  end

  def get_previous_month(month_index)
    next_month = month_index.to_i - 1
    if next_month < 0
      next_month = self.months.length - 1
    end
    return next_month
  end
end
