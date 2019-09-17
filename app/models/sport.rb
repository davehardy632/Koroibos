class Sport < ApplicationRecord
  has_many :events

  validates_presence_of :sport

  def self.all_alphabetically
    self.order(sport: :asc)
  end
end
