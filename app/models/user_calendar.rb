class UserCalendar < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  validates :user, presence: true
  validates :calendar, presence: true
  validates_uniqueness_of :user_id, :scope => :calendar_id

  after_commit :create_notification, on: :create

  private

  def create_notification
    Notification.create do |notification|
      #the notifty type/name is user calendar
      notification.notify_type = "user_calendar"
      #who created the notification -the calendar owner
      notification.actor = self.calendar.user
      #who is being notified - 
      notification.user = self.user
      #what is the notification about
      notification.target = self.calendar
    end
  end
end
