require 'rails_helper'

describe "Returns the top 10 perfoming olympians" do
  before :each do
    @olympian_1 = Olympian.create(name: "Jim Smith", sex: "M", age: 25, height: 123, weight: 123, team: "United States", total_medals_won: 12, sport: "Weightlifting")
    @olympian_2 = Olympian.create(name: "Larry Johnson", sex: "M", age: 27, height: 123, weight: 127, team: "Austria", total_medals_won: 22, sport: "Fencing")
    @olympian_3 = Olympian.create(name: "Mara Katherine Abbott", sex: "F", age: 22, height: 123, weight: 123, team: "Finland", total_medals_won: 10, sport: "Swimming")
    @olympian_4 = Olympian.create(name: "Jennifer Abel", sex: "F", age: 22, height: 143, weight: 107, team: "Germany", total_medals_won: 1, sport: "Gymnastics")
    @olympian_5 = Olympian.create(name: "Julien Absalon", sex: "M", age: 28, height: 140, weight: 165, team: "Egypt", total_medals_won: 0, sport: "Basketball")
    @olympian_6 = Olympian.create(name: "Rachael Alexis Adams", sex: "F", age: 21, height: 112, weight: 100, team: "Austrailia", total_medals_won: 0, sport: "Badminton")
    @olympian_7 = Olympian.create(name: "Luca Agamennoni", sex: "M", age: 22, height: 145, weight: 165, team: "United States", total_medals_won: 4, sport: "Rowing")
    @olympian_8 = Olympian.create(name: "Mayada Al-Sayad", sex: "M", age: 26, height: 133, weight: 156, team: "Palestine", total_medals_won: 5, sport: "Equestrianism")
    @olympian_9 = Olympian.create(name: "Alison Conte Cerutti", sex: "F", age: 30, height: 103, weight: 98, team: "Jamaica", total_medals_won: 9, sport: "Table Tennis")
    @olympian_10 = Olympian.create(name: "Frida Andersn", sex: "F", age: 27, height: 140, weight: 116, team: "Sweden", total_medals_won: 8, sport: "Volleyball")
    @olympian_11 = Olympian.create(name: "Jim Jones", sex: "M", age: 25, height: 123, weight: 123, team: "United States", total_medals_won: 2, sport: "Weightlifting")
    @olympian_12 = Olympian.create(name: "Larry Fitzgerald", sex: "M", age: 27, height: 123, weight: 127, team: "Austria", total_medals_won: 2, sport: "Fencing")
    @olympian_13 = Olympian.create(name: "Mara Katherine Abonkers", sex: "F", age: 22, height: 123, weight: 123, team: "Finland", total_medals_won: 7, sport: "Swimming")
    @olympian_14 = Olympian.create(name: "Jennifer Abelonian", sex: "F", age: 22, height: 143, weight: 107, team: "Germany", total_medals_won: 1, sport: "Gymnastics")
    @olympian_15 = Olympian.create(name: "Julien Absinthe", sex: "M", age: 28, height: 140, weight: 165, team: "Egypt", total_medals_won: 0, sport: "Basketball")
    @olympian_16 = Olympian.create(name: "Rachael Alexis Adamson", sex: "F", age: 21, height: 112, weight: 100, team: "Austrailia", total_medals_won: 0, sport: "Badminton")
    @olympian_17 = Olympian.create(name: "Luca Brazzi", sex: "M", age: 22, height: 145, weight: 165, team: "United States", total_medals_won: 1, sport: "Rowing")
    @olympian_18 = Olympian.create(name: "Mayada Hunduras", sex: "M", age: 26, height: 133, weight: 156, team: "Palestine", total_medals_won: 10, sport: "Equestrianism")
    @olympian_19 = Olympian.create(name: "Alison Conte Perciotti", sex: "F", age: 30, height: 103, weight: 98, team: "Jamaica", total_medals_won: 6, sport: "Table Tennis")
    @olympian_20 = Olympian.create(name: "Frida Andes-Smith", sex: "F", age: 27, height: 140, weight: 116, team: "Sweden", total_medals_won: 1, sport: "Volleyball")
  end
  it "Top olympians are ranked by their total medal count" do

    get '/api/v1/top_ten_olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)

    expect(olympians["top_ten_olympians"].count).to eq(10)
    expect(olympians["top_ten_olympians"].first.keys).to eq(["name", "team", "age", "sport", "total_medals_won"])
    expect(olympians["top_ten_olympians"].first["name"]).to eq("Larry Johnson")
    expect(olympians["top_ten_olympians"].first["team"]).to eq("Austria")
    expect(olympians["top_ten_olympians"].first["age"]).to eq(27)
    expect(olympians["top_ten_olympians"].first["sport"]).to eq("Fencing")
    expect(olympians["top_ten_olympians"].first["total_medals_won"]).to eq(22)

    expect(olympians["top_ten_olympians"].last.keys).to eq(["name", "team", "age", "sport", "total_medals_won"])
    expect(olympians["top_ten_olympians"].last["name"]).to eq("Luca Agamennoni")
    expect(olympians["top_ten_olympians"].last["team"]).to eq("United States")
    expect(olympians["top_ten_olympians"].last["age"]).to eq(22)
    expect(olympians["top_ten_olympians"].last["sport"]).to eq("Rowing")
    expect(olympians["top_ten_olympians"].last["total_medals_won"]).to eq(4)
  end
end
