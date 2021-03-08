class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  
  has_many :calendars_as_owner, class_name: "Calendar", foreign_key: "user_id"
  has_many :events
  has_many :notifications
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_one_attached :photo

  def all_calendars
    calendars + calendars_as_owner
  end

  def all_notifications
    n_array = []
    notifications.each do |n|
      n_string = format.html do
        link_to "#{n.user.email} added you to #{n.target.name}", calendar_path(n.target)
      end
      n_array << n_string
    end
    return n_array
  end
end
