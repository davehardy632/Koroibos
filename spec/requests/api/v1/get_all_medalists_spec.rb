require 'rails_helper'

describe "Return the medalists for an event" do
  before :each do
    @sport_1 = Sport.create!(sport: "Basketball")
      @event_1 = @sport_1.events.create!(event: "Men's Basketball")
        @olympian_1 = Olympian.create!(name: "James Adede", sex: "M", age: 24, height: 123, weight: 156, team: "United States", total_medals_won: 1)
          @oe_1 = OlympianEvent.create!(olympian_id: @olympian_1.id, event_id: @event_1.id, medal: "Bronze", games: "2016 Summer")
        @olympian_2 = Olympian.create!(name: "Evelina Afoa", sex: "F", age: 27, height: 112, weight: 122, team: "Egypt", total_medals_won: 1)
          @oe_2 = OlympianEvent.create!(olympian_id: @olympian_2.id, event_id: @event_1.id, medal: "Silver", games: "2016 Summer")
        @olympian_3 = Olympian.create!(name: "Macarena Aguilar Daz", sex: "F", age: 22, height: 122, weight: 144,  team: "China", total_medals_won: 1)
          @oe_3 = OlympianEvent.create!(olympian_id: @olympian_3.id, event_id: @event_1.id, medal: "Gold", games: "2016 Summer")
        @olympian_4 = Olympian.create!(name: "Jim Smith", sex: "M", age: 25, height: 133, weight: 155,  team: "China", total_medals_won: 1)
          @oe_4 = OlympianEvent.create!(olympian_id: @olympian_3.id, event_id: @event_1.id, medal: "NA", games: "2016 Summer")
  end
  it "Given the event id, return medalist name, team, age and medal" do

    get "/api/v1/events/#{@event_1.id}/medalists"

    expect(response).to be_successful

    medalists = JSON.parse(response.body)

    expect(medalists["medalists"].count).to eq(3)
    expect(medalists["medalists"][0].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][0].values).to eq(["Macarena Aguilar Daz", "China", 22, "Gold"])

    expect(medalists["medalists"][1].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][1].values).to eq(["Evelina Afoa", "Egypt", 27, "Silver"])

    expect(medalists["medalists"][2].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][2].values).to eq(["James Adede", "United States", 24, "Bronze"])
  end
end
