class OlympiansFacade

  def self.all_olympians
    response_obj = {}
    response_obj["olympians"] = []
    Olympian.return_olympians.each do |olympian|
      olympian_hash = {}
      olympian_hash["name"] = olympian.name
      olympian_hash["team"] = olympian.team
      olympian_hash["age"] = olympian.age
      olympian_hash["sport"] = olympian.sport
      olympian_hash["total_medals_won"] = olympian.total_medals_won
      olympian_hash
      response_obj["olympians"] << olympian_hash
    end
    response_obj
  end

  def self.youngest_olympian
    response_obj = {}
    response_obj["youngest"] = []
    olympian = Olympian.youngest
    olympian_hash = {}
    olympian_hash["name"] = olympian.name
    olympian_hash["team"] = olympian.team
    olympian_hash["age"] = olympian.age
    olympian_hash["sport"] = olympian.sport
    olympian_hash["total_medals_won"] = olympian.total_medals_won
    olympian_hash
    response_obj["youngest"] << olympian_hash
    response_obj
  end

end
