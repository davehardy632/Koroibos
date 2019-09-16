require 'rails_helper'

describe "Youngest olympian endpoint" do
  before :each do
    @olympian_1 = Olympian.create(name: "Jim Smith", sex: "M", age: 25, height: 123, weight: 123, team: "United States", total_medals_won: 2, sport: "Weightlifting")
    @olympian_2 = Olympian.create(name: "Larry Johnson", sex: "M", age: 27, height: 123, weight: 127, team: "Austria", total_medals_won: 2, sport: "Fencing")
    @olympian_3 = Olympian.create(name: "Mara Katherine Abbott", sex: "F", age: 22, height: 123, weight: 123, team: "Finland", total_medals_won: 0, sport: "Swimming")
    @olympian_4 = Olympian.create(name: "Jennifer Abel", sex: "F", age: 22, height: 143, weight: 107, team: "Germany", total_medals_won: 1, sport: "Gymnastics")
    @olympian_5 = Olympian.create(name: "Julien Absalon", sex: "M", age: 28, height: 140, weight: 165, team: "Egypt", total_medals_won: 0, sport: "Basketball")
    @olympian_6 = Olympian.create(name: "Rachael Alexis Adams", sex: "F", age: 21, height: 112, weight: 100, team: "Austrailia", total_medals_won: 0, sport: "Badminton")
    @olympian_7 = Olympian.create(name: "Luca Agamennoni", sex: "M", age: 22, height: 145, weight: 165, team: "United States", total_medals_won: 1, sport: "Rowing")
    @olympian_8 = Olympian.create(name: "Mayada Al-Sayad", sex: "M", age: 26, height: 133, weight: 156, team: "Palestine", total_medals_won: 0, sport: "Equestrianism")
    @olympian_9 = Olympian.create(name: "Alison Conte Cerutti", sex: "F", age: 30, height: 103, weight: 98, team: "Jamaica", total_medals_won: 2, sport: "Table Tennis")
    @olympian_10 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "Sweden", total_medals_won: 1, sport: "Volleyball")
  end
  it "Will return info about the youngest olympian" do

    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    youngest_olympian = JSON.parse(response.body)
    
    expected_keys = ["name", "team", "age", "sport", "total_medals_won"]

    expect(youngest_olympian["youngest"].first.keys).to eq(expected_keys)
    expect(youngest_olympian["youngest"].first["age"]).to eq(21)
  end
end
