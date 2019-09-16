require 'csv'

namespace :import do
  desc "Import data from csv file"
  task prospect: :environment do
    CSV.foreach('./data/olympic_data.csv', headers: true) do |row|
      row_data = row.to_h

      olympian = Olympian.find_or_create_by(name: row_data["Name"], sex: row_data["Sex"], age: row_data["Age"], height: row_data["Height"], weight: row_data["Weight"], team: row_data["Team"])

      if row_data["Medal"] != "NA"
        olympian.update_column(:total_medals_won, olympian.total_medals_won += 1)
      end

      sport = Sport.find_or_create_by(sport: row_data["Sport"])

      event = Event.find_by(event: row_data["Event"])
      if !event
        new_event = sport.events.create(event: row_data["Event"])
        OlympianEvent.create(olympian_id: olympian.id, event_id: new_event.id, medal: row_data["Medal"], games: row_data["Games"])
      else
        OlympianEvent.create(olympian_id: olympian.id, event_id: event.id, medal: row_data["Medal"], games: row_data["Games"])
      end
    end
  end
end
