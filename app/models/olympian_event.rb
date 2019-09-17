class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  validates_presence_of :medal
  validates_presence_of :games

  enum medal: ["Gold", "Silver", "Bronze", "NA"]

  def self.olympian_medalists(event_id)
    OlympianEvent.where(event_id: event_id).where("olympian_events.medal != ?", 3).joins(:olympian).select("olympian_events.medal as medal, olympians.id, olympians.name as name, olympians.team as team, olympians.age as age").order("olympian_events.medal asc")
  end
end
