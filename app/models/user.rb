class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4 }
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
end
