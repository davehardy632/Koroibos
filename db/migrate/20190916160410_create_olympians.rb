class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :team
      t.integer :total_medals_won, default: 0
    end
  end
end
