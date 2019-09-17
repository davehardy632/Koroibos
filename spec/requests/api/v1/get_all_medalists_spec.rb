require 'rails_helper'

describe "Return the medalists for an event" do
  before :each do
    @sport_1 = Sport.create(sport: "Basketball")
      @event_1 = @sport_1.events.create(event: "Men's Basketball")
        @olympian_1 = @event_1.olympians.create(name: "James Adede", team: "United States", age: 24, medal: "Gold")
        @olympian_2 = @event_1.olympians.create(name: "Evelina Afoa", team: "Egypt", age: 27, medal: "Bronze")
        @olympian_3 = @event_1.olympians.create(name: "Macarena Aguilar Daz", team: "China", age: 22, medal: "Silver")
  end
  it "Given the event id, return medalist name, team, age and medal" do

    get "/api/v1/events/#{@event_1.id}/medalists"

    expect(response).to be_successful

    medalists = JSON.parse(response.body)
binding.pry
    expect(medalists["medalists"].count).to eq(3)
    expect(medalists["medalists"][0].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][0].values).to eq(["James Adede", "United States", "24", "Gold"])

    expect(medalists["medalists"][1].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][1].values).to eq(["Macarena Aguilar Daz", "China", "22", "Silver"])

    expect(medalists["medalists"][2].keys).to eq(["name", "team", "age", "medal"])
    expect(medalists["medalists"][2].values).to eq(["Evelina Afoa", "Egypt", "27", "Bronze"])
  end
end
