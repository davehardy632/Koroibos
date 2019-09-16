require 'csv'

namespace :import do
  desc "Import data from csv file"
  task olympian_data: :environment do
    CSV.foreach('./data/olympic_data.csv', headers: true) do |row|
      return row
    end
  end
end
