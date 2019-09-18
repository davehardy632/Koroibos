require 'rails_helper'

describe "With any specified country return the total medal count" do
  before :each do
    @sport = Sport.create!(sport: "Badminton")
    @event_1 = @sport.events.create!(event: "Half Court Badminton")

    @olympian_1 = Olympian.create(name: "Jim Smith", sex: "M", age: 25, height: 123, weight: 123, team: "United States", total_medals_won: 1, sport: "Weightlifting")
      @oe_1 = OlympianEvent.create!(olympian_id: @olympian_1.id, event_id: @event_1.id, medal: "Silver", games: "2016 Summer")

    @olympian_2 = Olympian.create(name: "Larry Johnson", sex: "M", age: 27, height: 123, weight: 127, team: "United States", total_medals_won: 1, sport: "Fencing")
      @oe_2 = OlympianEvent.create!(olympian_id: @olympian_2.id, event_id: @event_1.id, medal: "Gold", games: "2016 Summer")

    @olympian_3 = Olympian.create(name: "Mara Katherine Abbott", sex: "F", age: 22, height: 123, weight: 123, team: "United States", total_medals_won: 1, sport: "Swimming")
      @oe_3 = OlympianEvent.create!(olympian_id: @olympian_3.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_4 = Olympian.create(name: "Jennifer Abel", sex: "F", age: 22, height: 143, weight: 107, team: "United States", total_medals_won: 1, sport: "Gymnastics")
      @oe_4 = OlympianEvent.create!(olympian_id: @olympian_4.id, event_id: @event_1.id, medal: "Silver", games: "2016 Summer")

    @olympian_5 = Olympian.create(name: "Julien Absalon", sex: "M", age: 28, height: 140, weight: 165, team: "United States", total_medals_won: 1, sport: "Basketball")
      @oe_5 = OlympianEvent.create!(olympian_id: @olympian_5.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_6 = Olympian.create(name: "Rachael Alexis Adams", sex: "F", age: 21, height: 112, weight: 100, team: "United States", total_medals_won: 1, sport: "Badminton")
      @oe_6 = OlympianEvent.create!(olympian_id: @olympian_6.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_7 = Olympian.create(name: "Luca Agamennoni", sex: "M", age: 22, height: 145, weight: 165, team: "United States", total_medals_won: 1, sport: "Rowing")
      @oe_7 = OlympianEvent.create!(olympian_id: @olympian_7.id, event_id: @event_1.id, medal: "Gold", games: "2016 Summer")

    @olympian_8 = Olympian.create(name: "Mayada Al-Sayad", sex: "M", age: 26, height: 133, weight: 156, team: "United States", total_medals_won: 1, sport: "Equestrianism")
      @oe_8 = OlympianEvent.create!(olympian_id: @olympian_8.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_9 = Olympian.create(name: "Alison Conte Cerutti", sex: "F", age: 30, height: 103, weight: 98, team: "United States", total_medals_won: 1, sport: "Table Tennis")
      @oe_9 = OlympianEvent.create!(olympian_id: @olympian_9.id, event_id: @event_1.id, medal: "Silver", games: "2016 Summer")

    @olympian_10 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "United States", total_medals_won: 1, sport: "Volleyball")
      @oe_10 = OlympianEvent.create!(olympian_id: @olympian_10.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_11 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "Finland", total_medals_won: 1, sport: "Volleyball")
      @oe_11 = OlympianEvent.create!(olympian_id: @olympian_11.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_12 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "Finland", total_medals_won: 1, sport: "Volleyball")
      @oe_12 = OlympianEvent.create!(olympian_id: @olympian_12.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")

    @olympian_13 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "Finland", total_medals_won: 1, sport: "Volleyball")
      @oe_13 = OlympianEvent.create!(olympian_id: @olympian_13.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")
  end
  it "count of gold, silver, bronze, and overall total" do

    get '/api/v1/medal_count?country=United States'

    expect(response).to be_successful

    medal_info = JSON.parse(response.body)

    expect(medal_info.keys).to eq(["country", "medals", "total_medal_count"])
    expect(medal_info["country"]).to eq("United States")
    expect(medal_info["medals"]).to eq({"gold"=>2, "silver"=>3, "bronze"=>5})
    expect(medal_info["total_medal_count"]).to eq(10)

  end
end
