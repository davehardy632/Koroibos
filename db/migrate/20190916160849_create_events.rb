class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :sport, foreign_key: true
      t.string :event
    end
  end
end
