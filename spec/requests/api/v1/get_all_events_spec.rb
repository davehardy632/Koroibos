require 'rails_helper'

describe "Endpoint returns all events with their parent sport record" do
  before :each do
    @sport_1 = Sport.create(sport: "Basketball")
      @event_1 = @sport_1.events.create(event: "Men's Basketball")
      @event_2 = @sport_1.events.create(event: "Women's Basketball")
      @event_3 = @sport_1.events.create(event: "Half Court Basketball")
    @sport_2 = Sport.create(sport: "Fencing")
      @event_4 = @sport_2.events.create(event: "Men's Fencing")
      @event_5 = @sport_2.events.create(event: "Women's Fencing")
      @event_6 = @sport_2.events.create(event: "Half Court Fencing")
    @sport_3 = Sport.create(sport: "Water Polo")
      @event_7 = @sport_3.events.create(event: "Men's Water Polo")
      @event_8 = @sport_3.events.create(event: "Women's Water Polo")
      @event_9 = @sport_3.events.create(event: "Half Court Water Polo")
  end
  it "Returns all associated event associated with a sport" do

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events["events"].count).to eq(3)
    expect(events["events"].first.keys).to eq(["sport", "events"])
    expect(events["events"].last.keys).to eq(["sport", "events"])
    expect(events["events"].first["events"].count).to eq(3)
    expect(events["events"].last["events"].count).to eq(3)
  end
end
