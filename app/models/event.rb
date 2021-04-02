class Event < ApplicationRecord
  belongs_to :user, class_name: 'User'
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :date, :location, presence: true
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
