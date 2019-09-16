class AddSportToOlympians < ActiveRecord::Migration[5.2]
  def change
    add_column :olympians, :sport, :string
  end
end
