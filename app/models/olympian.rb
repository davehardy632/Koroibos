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
    self.select("olympians.name as name, olympians.team as team, olympians.age as age, olympians.sport as sport, olympians.total_medals_won as total_medals_won").order("olympians.name")
  end

  def self.youngest
    self.select("olympians.name as name, olympians.team as team, olympians.age as age, olympians.sport as sport, olympians.total_medals_won as total_medals_won").order("age").first
  end

  def self.oldest
    self.select("olympians.name as name, olympians.team as team, olympians.age as age, olympians.sport as sport, olympians.total_medals_won as total_medals_won").order("age desc").first
  end

  def self.average_male_weight
    self.where(sex: "M").average(:weight).to_f.round(1)
  end

  def self.average_female_weight
    self.where(sex: "F").average(:weight).to_f.round(1)
  end

  def self.average_age
    self.average(:age).to_f.round(1)
  end

  def self.sport_competitors(sport_name)
    self.where(sport: sport_name).order(name: :asc)
  end

  def self.total_medals(country)
    self.where(team: country).sum(:total_medals_won)
  end

  def self.match_countries(id, country)
    olympian = self.find(id)
    if olympian.team == country
      true
    end
  end

  def self.top_ten_by_medals
    self.order(total_medals_won: :desc).limit(10)
  end
end
