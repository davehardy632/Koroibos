class CompetitorFacade

  def self.return_competitors(sport_id_hash)
    sport_id = sport_id_hash["id"].to_i
    sport = Sport.find(sport_id)
    sport_name = sport.sport
    competitors = Olympian.sport_competitors(sport_name)

    response_obj = {}
    response_obj["sport"] = sport_name
    response_obj["competitors"] = []
    competitors.each do |competitor|
      response_obj["competitors"] << competitor.name
    end
    response_obj
  end

end
