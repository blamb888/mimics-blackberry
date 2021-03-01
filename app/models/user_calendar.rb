class UserCalendar < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  validates :user, presence: true
  validates :calendar, presence: true
  validates_uniqueness_of :user_id, :scope => :calendar_id
end
