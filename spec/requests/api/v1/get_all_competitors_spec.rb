require 'rails_helper'

describe "Returns a list of competitors for each sport" do
  before :each do
    @sport = Sport.create(sport: "Badminton")
    @olympian_1 = Olympian.create(name: "Jim Smith", sex: "M", age: 23, height: 122, weight: 234, team: "Canada", sport: "Badminton")
    @olympian_1 = Olympian.create(name: "Bill Johnsob", sex: "M", age: 24, height: 133, weight: 264, team: "United States", sport: "Badminton")
    @olympian_1 = Olympian.create(name: "Kathy Bates", sex: "F", age: 28, height: 124, weight: 124, team: "Germany", sport: "Badminton")
  end
  it "When the sport id is send, all cometitor names are returned" do

    get "/api/v1/sports/#{@sport.id}/competitors"

    expect(response).to be_successful

    competitors = JSON.parse(response.body)
binding.pry
    expect(competitors.count).to eq(3)
  end
end
