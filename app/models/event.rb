class Event < ApplicationRecord
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  validates_presence_of :event
end
