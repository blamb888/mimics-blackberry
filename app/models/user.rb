class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  
  has_many :calendars_as_owner, class_name: "Calendar", foreign_key: "user_id"
  has_many :events
  has_many :notification
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_one_attached :photo
  validates_uniqueness_of :username
  def all_calendars
    calendars + calendars_as_owner
  end
end
