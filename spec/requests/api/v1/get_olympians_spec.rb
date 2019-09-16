require 'rails_helper'

describe "Get all Olympians, name, team, age, sport, total medals won" do
  it "When a user sends the following url, all olympians are returned" do

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)
binding.pry
    expect(olympians.count).to eq(2856)
  end
end
