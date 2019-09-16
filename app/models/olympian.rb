class Olympian < ApplicationRecord
  has_many :olympian_events
  has_many :events, through: :olympian_events

  validates_presence_of :name
  validates_presence_of :sex
  validates_presence_of :age
  validates_presence_of :height
  validates_presence_of :weight
  validates_presence_of :team
  validates_presence_of :total_medals_won

  def self.return_olympians
    self.select("olympians.name as name, olympians.team as team, olympians.age as Age, olympians.sport as sport, olympians.total_medals_won as total_medals_won")
  end

  def self.youngest
    self.select("olympians.name as name, olympians.team as team, olympians.age as Age, olympians.sport as sport, olympians.total_medals_won as total_medals_won").order("age").first
  end

  def self.oldest
    self.select("olympians.name as name, olympians.team as team, olympians.age as Age, olympians.sport as sport, olympians.total_medals_won as total_medals_won").order("age desc").first
  end
end
