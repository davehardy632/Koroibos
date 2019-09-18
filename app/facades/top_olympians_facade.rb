class TopOlympiansFacade

  def self.return_top_ten
    return_raw = Olympian.top_ten_by_medals
    response_obj = {}
    response_obj["top_ten_olympians"] = []
    return_raw.each do |olympian|
      olympian_obj = {}
      olympian_obj["name"] = olympian.name
      olympian_obj["team"] = olympian.team
      olympian_obj["age"] = olympian.age
      olympian_obj["sport"] = olympian.sport
      olympian_obj["total_medals_won"] = olympian.total_medals_won
      olympian_obj
      response_obj["top_ten_olympians"] << olympian_obj
    end
    response_obj
  end

end
