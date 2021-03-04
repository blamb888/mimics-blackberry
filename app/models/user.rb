class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :events
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_one_attached :photo
end
