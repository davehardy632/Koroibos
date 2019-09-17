class EventsFacade

  def self.return_events
    response_obj = {}
    response_obj["events"] = []
    all_sports = Sport.all
    all_sports.each do |sport|
      sport_obj = {}
      sport_obj["sport"] = sport.sport
      sport_obj["events"] = []
      sport.events.each do |event|
        sport_obj["events"] << event.event
      end
      sport_obj
      response_obj["events"] << sport_obj
    end
    response_obj
  end

end
