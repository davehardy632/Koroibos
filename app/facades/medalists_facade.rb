class MedalistsFacade

  def self.return_medalists(event_id_string)
    event_id = event_id_string.to_i
    event = Event.find(event_id)
    medalists = OlympianEvent.olympian_medalists(event_id)
    response_obj = {}
    response_obj["event"] = event.event
    response_obj["medalists"] = []
    medalists.each do |medalist|
      medalist_obj = {}
        medalist_obj["name"] = medalist.name
        medalist_obj["team"] = medalist.team
        medalist_obj["age"] = medalist.age
        medalist_obj["medal"] = medalist.medal
      response_obj["medalists"] << medalist_obj
    end
    response_obj
  end

end
